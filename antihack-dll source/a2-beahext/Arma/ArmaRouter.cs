using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using a2_beahext.Core;

namespace a2_beahext.Arma
{
    public class ArmaRouter
    {
        private readonly object _routesInstance;
        private readonly Dictionary<string, MethodInfo> _routes;
        private readonly object _taskLock = new object();
        private int _taskPointer;
        private readonly Dictionary<int, Task<string>> _tasks = new Dictionary<int, Task<string>>();

        public ArmaRouter(Type routesType, IConfig config)
        {
            var routeConstructor = routesType.GetConstructor(new[] { typeof(IConfig) });
            if (routeConstructor == null)
                throw new ArmaRouterException("The routes type doesnt have a constructor that takes IConfig");
            _routesInstance = routeConstructor.Invoke(new object[] { config });
            _routes = routesType
                .GetMethods(BindingFlags.Public | BindingFlags.Instance)
                .Where(method =>
                {
                    var parameters = method.GetParameters();
                    return (method.ReturnType == typeof(string) || method.ReturnType == typeof(void)) && 
                        (parameters.Length == 0 || parameters.Select(m => m.ParameterType).SequenceEqual(new[] { typeof(string) }));
                })
                .ToDictionary(method => method.Name);
        }

        public string Invoke(string input)
        {
            var parts = input.Split(new[] { '|' }, 2);
            var fnc = parts[0];
            var args = parts.Length > 1 ? parts[1] : "";
            if (fnc == "Result")
                return GetResult(args);

            if (!_routes.ContainsKey(fnc))
                return ArmaMessage.Error($"The method {fnc} was not found");

            var method = _routes[fnc];
            if (method.ReturnType == typeof(void))
            {
                Task.Factory.StartNew(() =>
                {
                    lock (_taskLock)
                        method.Invoke(_routesInstance, method.GetParameters().Length == 0 ? new object[] { } : new object[] { args });
                });
                return ArmaMessage.Success();
            }

            var task = Task<string>.Factory.StartNew(() =>
            {
                lock (_taskLock)
                    return (string)method.Invoke(_routesInstance, new object[] { args });
            });
            var taskId = ++_taskPointer;
            _tasks.Add(taskId, task);
            return ArmaMessage.Success($"{taskId}");
        }

        private string GetResult(string args)
        {
            if (!int.TryParse(args, out int id))
                return ArmaMessage.Error("Task id invalid");
            if (!_tasks.ContainsKey(id))
                return ArmaMessage.Error("Could not find task");
            var task = _tasks[id];
            if (task.IsFaulted)
                return ArmaMessage.Error(task.Exception?.InnerException?.InnerException?.Message ?? "There was an error");
            return task.IsCompleted
                ? ArmaMessage.Success(task.Result)
                : ArmaMessage.Wait("Task is still running");
        }
    }
}
