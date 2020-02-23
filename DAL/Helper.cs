using Microsoft.Extensions.Configuration;
using System;

namespace DAL
{
    public static class Helper
    {
        public static string BlogConnectionStringValue(IConfiguration configuration, string name)
        {
            return configuration.GetSection("ConnectionStrings")[name];

        }
    }
}
