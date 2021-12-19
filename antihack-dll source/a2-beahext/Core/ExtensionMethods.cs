using System;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace a2_beahext.Core
{
    public static class ExtensionMethods
    {
        public static string PathToAbsolute(this string path)
        {
            return Path.IsPathRooted(path) ? path : Path.GetFullPath(Path.Combine(DllEntry.BasePath, path));
        }

        public static string SteamIdToGuid(this long steamId)
        {
            byte[] parts = { 0x42, 0x45, 0, 0, 0, 0, 0, 0, 0, 0 };
            byte counter = 2;
            do
            {
                parts[counter++] = (byte)(steamId & 0xFF);
            } while ((steamId >>= 8) > 0);
            MD5 md5 = new MD5CryptoServiceProvider();
            var beHash = md5.ComputeHash(parts);
            var sb = new StringBuilder();
            foreach (var t in beHash)
                sb.Append(t.ToString("x2"));
            return sb.ToString();
        }

        public static string ToArmaStringArray(this string input)
        {
            return $"[{string.Join(",", input.ToCharArray().Select(Convert.ToInt32))}]";
        }

        public static string WrapInDblQuotes(this string input)
        {
            return $"\"{input.Replace("\"", "\"\"")}\"";
        }
    }
}
