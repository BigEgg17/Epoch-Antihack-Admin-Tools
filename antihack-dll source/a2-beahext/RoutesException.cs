using System;
using System.Runtime.Serialization;

namespace a2_beahext
{
    [Serializable]
    internal class RoutesException : Exception
    {
        public RoutesException()
        {
        }

        public RoutesException(string message) : base(message)
        {
        }

        public RoutesException(string message, Exception innerException) : base(message, innerException)
        {
        }

        protected RoutesException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}