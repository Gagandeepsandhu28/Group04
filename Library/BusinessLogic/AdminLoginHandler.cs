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
         public AdminLoginDb GetLoginId()
        {
            DataAccess db = new DataAccess();
            var adminlogin = db.GetLoginId();
            return adminlogin;
        }        
    }
}
