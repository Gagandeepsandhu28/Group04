using Library.BusinessLogic;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Week3_FormCreation.Models
{
    public class AdminLogin
    {
        private IConfiguration _configuration;

        public AdminLogin()
        {
        }

        public AdminLogin(IConfiguration Configuration)
        {
            _configuration = Configuration;
        }

        public string adminLoginId { get; set; }
        public string adminLoginPwd { get; set; }

        public string adminLoginHash { get; set; }
        public string adminLoginSalt { get; set; }
        public string adminMsg { get; set; }

        public bool CheckLogin(AdminLogin adminlogin)
        {
            
            bool result = false;
            AdminLoginHandler handler = new AdminLoginHandler();
            var adminlogin_var = handler.GetLoginId();
            //return View(contacts);
            // CHECK LOGIN
            if (adminlogin.adminLoginId.ToString().Equals(adminlogin_var.Config_UserId.ToString()))
            {
                string stored_hash = adminlogin_var.Config_Pwd_Hash.ToString();
                string stored_salt = adminlogin_var.Config_Pwd_Salt.ToString();
                string stored_pwd = adminlogin.adminLoginPwd;
                bool pwd_verify = HashSalt.VerifyPassword(stored_pwd, stored_hash, stored_salt);
                if (pwd_verify)
                {
                    // Result -> TRUE
                    result = true;
                    // adminlogin.adminLoginSalt = "Password Verified";
                }
            }


            return result;
        }
    }
}
