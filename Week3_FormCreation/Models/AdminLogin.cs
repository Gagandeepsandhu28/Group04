using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Week3_FormCreation.Models
{
    public class AdminLogin
    {
        public string adminLoginId { get; set; }
        public string adminLoginPwd { get; set; }

        public string adminLoginHash { get; set; }
        public string adminLoginSalt { get; set; }
        public string adminMsg { get; set; }

    }
}
