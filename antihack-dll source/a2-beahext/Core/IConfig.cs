using System.Collections.Generic;

namespace a2_beahext.Core
{
    public interface IConfig
    {
        string[] CheckFiles { get; }
        string LogFormat { get; }
        string LogMessageDate { get; }
        string LogEncoding { get; }
        Dictionary<string, string> Logs { get; }
        string LogFileDate { get; }
        string BansFile { get; }
        string BanReason { get; }
    }
}