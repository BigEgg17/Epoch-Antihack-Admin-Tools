using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace a2_beahext.Core
{
    public class Config : IConfig
    {
        public string[] CheckFiles { get; }
        public string LogFormat { get; }
        public string LogMessageDate { get; }
        public Dictionary<string, string> Logs { get; }
        public string LogFileDate { get; }
        public string BansFile { get; }
        public string BanReason { get; }

        public Config(string path)
        {
            var ini = new IniParser(path);
            CheckFiles = ini.EnumSection("CheckFiles")
                .Select(key =>
                {
                    var value = ini.GetSetting("CheckFiles", key);
                    var matches = Regex.Match(value, @"\$\(([^\)]+)\)");
                    if (matches.Success)
                        value = value.Replace(matches.Groups[0].Value, DateTime.Now.ToString(matches.Groups[1].Value));
                    return value.PathToAbsolute();
                })
                .ToArray();
            LogFormat = ini.GetSetting("Log", "logformat");
            LogFileDate = ini.GetSetting("Log", "filedate");
            LogMessageDate = ini.GetSetting("Log", "logdate");
            Logs = ini.EnumSection("Log")
                .Where(k => k.StartsWith("log-"))
                .ToDictionary(key => Regex.Replace(key, "^log-", ""), key => ini.GetSetting("Log", key).PathToAbsolute());
            BansFile = ini.GetSetting("Ban", "file").PathToAbsolute();
            BanReason = ini.GetSetting("Ban", "defaultreason");
        }

    }
}
