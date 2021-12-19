using System;
using System.Runtime.Serialization;

namespace a2_beahext.Arma
{
    [Serializable]
    internal class ArmaRouterException : Exception
    {
        public ArmaRouterException()
        {
        }

        public ArmaRouterException(string message) : base(message)
        {
        }

        public ArmaRouterException(string message, Exception innerException) : base(message, innerException)
        {
        }

        protected ArmaRouterException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}