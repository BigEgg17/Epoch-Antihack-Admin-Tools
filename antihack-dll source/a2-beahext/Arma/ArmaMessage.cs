using a2_beahext.Core;

namespace a2_beahext.Arma
{
    public class ArmaMessage
    {
        public enum ResponseStatus
        {
            Success = 0x31, // 1
            Wait = 0x32, // 2
            Error = 0x33, // 3
        }

        public static string Error(string data = "")
        {
            return new ArmaMessage
            {
                Status = ResponseStatus.Error,
                Content = data.WrapInDblQuotes()
            }.ToString();
        }

        public static string Success(string data = "")
        {
            return new ArmaMessage
            {
                Status = ResponseStatus.Success,
                Content = data
            }.ToString();
        }

        public static string Wait(string data = "")
        {
            return new ArmaMessage
            {
                Status = ResponseStatus.Wait,
                Content = data.WrapInDblQuotes()
            }.ToString();
        }

        public ResponseStatus Status { get; set; }

        public string Content { get; set; }

        public override string ToString()
        {
            return string.IsNullOrWhiteSpace(Content) ? $"[{(char)Status}]" : $"[{(char)Status},{Content}]";
        }
    }
}
