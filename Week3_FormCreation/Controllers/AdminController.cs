using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using DAL;
using DataModels;
using Library.BusinessLogic;
using System.Configuration;
using Microsoft.Extensions.Configuration;
using Week3_FormCreation.Models;

namespace Week3_FormCreation.Controllers
{
    public class AdminController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Index(AdminLogin adminlogin)
        {

            // Create A Has Password in DB
            if (ModelState.IsValid)
            {
                if (adminlogin.adminLoginId == null || adminlogin.adminLoginPwd == null)
                {
                    return View(adminlogin);
                }

               HashSalt saltedhash =  HashSalt.GenerateSaltedHash(64,adminlogin.adminLoginPwd);
                adminlogin.adminLoginSalt = saltedhash.Salt;
                adminlogin.adminLoginHash = saltedhash.Hash;
              




            }
             return View(adminlogin);

            
        }
    }
    
}