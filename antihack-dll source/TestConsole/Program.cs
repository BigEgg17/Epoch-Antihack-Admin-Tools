using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using a2_beahext;

namespace TestConsole
{
    internal class Program
    {
        /// <summary>
        /// A small class to parse the extension response (mimick "call compile")
        /// </summary>
        internal class Response
        {
            public int Status { get; }
            public string Message { get; } = string.Empty;

            public Response(string input)
            {
                var data = input.Substring(1).Substring(0, input.Length - 2).Split(new [] {','}, 2);
                Status = int.Parse(data[0]);
                if (data.Length == 1)
                    return;
                Message = data[1];
            }
        }

        private const int Maxsize = 100000;
        private static void Main(string[] args)
        {

            DllEntry.Invoke("Init", Maxsize);
             DllEntry.Invoke("Log|info|This is a info log", Maxsize);
/*
           var res1 = new Response(DllEntry.Invoke("CheckFiles|elit", Maxsize));
            var id1 = int.Parse(res1.Message);
            while (true)
            {
                var res2 = new Response(DllEntry.Invoke($"Result|{id1}", Maxsize));
                if (res2.Status != 2) // status 2 means waiting for fnc to finish
                    break;
            }
            var res3 = DllEntry.Invoke($"Result|{id1}", Maxsize);

            
            DllEntry.Invoke("Ban|76561197996545192", Maxsize);
            DllEntry.Invoke("Ban|76561197996545192|123", Maxsize);
            DllEntry.Invoke("Ban|76561197996545192|123|test", Maxsize);

            DllEntry.Invoke("Log|info|This is a info log", Maxsize);
            DllEntry.Invoke("Log|warning|This is a warning log", Maxsize);
            DllEntry.Invoke("Log|another|This is a another log", Maxsize);
            */

            Console.WriteLine("done");
            Console.ReadLine();
        }
    }

}
