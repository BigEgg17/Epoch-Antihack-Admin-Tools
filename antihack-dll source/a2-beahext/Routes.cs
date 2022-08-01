using System;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using a2_beahext.Core;

namespace a2_beahext
{
    public class Routes
    {
        private readonly IConfig _config;

        public Routes(IConfig config)
        {
            _config = config;
        }

        /// <summary>
        /// Empty function for first dll call, as all loading happens on first call
        /// </summary>
        public void Init()
        {

        }


        /// <summary>
        /// Any function that returns a string (not call compile'able) needs to be wrapped in "", there is a helper method called WrapInDblQuotes for ease.
        /// Calling this from arma returns [1,"this is a string for arma"].
        /// If called and there was no WrapInDblQuotes, the return would be [1,this is a string for arma]. This can not be call compiled.
        /// </summary>
        public string FncThatReturnString()
        {
            return "this is a string for arma".WrapInDblQuotes();
        }

        public string CheckFiles(string input)
        {
            if (string.IsNullOrEmpty(input))
                throw new RoutesException("String is empty");
            var checkCounts =
                _config.CheckFiles.Select(file => new Regex(Regex.Escape(input)).Matches(File.ReadAllText(file)).Count);
            return $"[{string.Join(",", checkCounts)}]";
        }

        public void Log(string input)
        {
            var parts = input.Split(new[] { '|' }, 2);
            if (parts.Length != 2)
                throw new RoutesException("Invalid log format");
            var logType = parts[0];
            var logMessage = parts[1];
            if (!_config.Logs.ContainsKey(logType))
                throw new RoutesException($"Log {logType} does not exist");
            var logFile = _config.Logs[logType];
            var logName = Path.GetFileNameWithoutExtension(logFile);
            var logExt = Path.GetExtension(logFile);
            var logDir = Path.GetDirectoryName(logFile);
            // ReSharper disable once AssignNullToNotNullAttribute
            var logPath = Path.Combine(logDir, $"{logName}.{DateTime.Now.ToString(_config.LogFileDate)}{logExt}");
            File.AppendAllLines(logPath, new[]
            {
                string.Format(_config.LogFormat, DateTime.Now.ToString(_config.LogMessageDate), logMessage)
            });
        }

        public void Ban(string input)
        {
            var parts = input.Split('|');
            if (!long.TryParse(parts[0], out long steamId))
                throw new RoutesException("Invalid steam id");
            if (!int.TryParse(parts.Length > 1 ? parts[1] : "-1", out int time))
                throw new RoutesException("Invalid ban time");
            var reason = parts.Length > 2 ? parts[2] : _config.BanReason;
            File.AppendAllLines(_config.BansFile, new[] { $"{steamId.SteamIdToGuid()} {time} {reason}" });
        }
    }
}
