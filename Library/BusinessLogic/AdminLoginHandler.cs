using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Text;
using Dapper;
using DAL;
using DataModels;

namespace Library.BusinessLogic
{
    public class AdminLoginHandler
    {
        private IConfiguration _configuration;
        public AdminLoginHandler() { }
        public AdminLoginHandler(IConfiguration Configuration)
        {
            _configuration = Configuration;
        }
        public AdminLogin GetLoginId()
        {
            DataAccess db = new DataAccess(_configuration);
            var adminlogin = db.GetLoginId();
            return adminlogin;
        }        
    }
}
