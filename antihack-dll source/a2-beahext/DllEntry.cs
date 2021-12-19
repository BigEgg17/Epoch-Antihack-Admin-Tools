using System;
using System.IO;
using System.Reflection;
using a2_beahext.Arma;
using a2_beahext.Core;

#if !DEBUG
using Maca134.Arma.DllExport;
#endif

namespace a2_beahext
{
    public class DllEntry
    {
        public static string BasePath => Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);

        private static readonly ArmaRouter Router;
        private static readonly bool LoadError;
        private static readonly string ErrorMessage;

        static DllEntry()
        {
            AppDomain.CurrentDomain.AssemblyResolve += (sender, args) =>
            {
                var name = new AssemblyName(args.Name).Name;
                var filename = Path.Combine(BasePath, name + ".dll");
                return File.Exists(filename) ? Assembly.LoadFile(filename) : null;
            };
            try
            {
                var assemblyLocation = Assembly.GetExecutingAssembly().Location;
                var configPath = Path.Combine(BasePath, $"{Path.GetFileNameWithoutExtension(assemblyLocation)}.ini");
                Router = new ArmaRouter(typeof(Routes), new Config(configPath));
            }
            catch (Exception ex)
            {
                LoadError = true;
                ErrorMessage = ex.Message;
            }
        }
#if !DEBUG
        [ArmaDllExport]
#endif
        public static string Invoke(string input, int size)
        {
            if (LoadError)
                return ArmaMessage.Error(ErrorMessage);
            var result = Router.Invoke(input);
            if (result.Length > size)
                result = result.Substring(0, size);
            return result;
        }
    }
}
