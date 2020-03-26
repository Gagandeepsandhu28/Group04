using System;
using System.Collections.Generic;
using System.Text;

namespace DataModels
{
    public class AdminLoginDb
    {
        public string Config_UserId { get; set; }
        public string Config_Pwd_Hash { get; set; }
        public string Config_Pwd_Salt { get; set; }
    }
}
