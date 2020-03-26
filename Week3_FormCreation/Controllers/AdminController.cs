﻿using System;
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

using Microsoft.AspNetCore.Http;

namespace Week3_FormCreation.Controllers
{
    public class AdminController : Controller
    {
        
        public IActionResult AdminControlPanel()
        {
            // CHECK LOGIN SESSION!
            var var_chk_session = HttpContext.Session.GetString("AdminLogin");
            if (var_chk_session is null)
            {
                return RedirectToAction("Index");
                
            }
            else
            {
                if(var_chk_session.ToString().Equals("true"))
                {
                    return View();
                }
                else
                {
                    return RedirectToAction("Index");
                }
                
            }
            
        }

        public IActionResult SignOut()
        {
            // CHECK LOGIN SESSION!
            var var_chk_session = HttpContext.Session.GetString("AdminLogin");
            if (var_chk_session is null)
            {
                return RedirectToAction("Index");

            }
            else
            {
                if (var_chk_session.ToString().Equals("true"))
                {
                    HttpContext.Session.SetString("AdminLogin", "false");
                    return RedirectToAction("Index");
                }
                else
                {
                    return RedirectToAction("Index");
                }
            }

        }




        public IActionResult Index()
        {
            // CHECK LOGIN SESSION!
            var var_chk_session = HttpContext.Session.GetString("AdminLogin");
            if (var_chk_session is null)
            {
                return View();

            }
            else
            {
                if (var_chk_session.ToString().Equals("true"))
                {
                    return RedirectToAction("AdminControlPanel");
                }
                else
                {
                    return View();
                }

            }

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
                // CHK DB TO GET ADMIN STORED PWD SALT AND HASH & LOGIN ID
                // CHK LOGIN
                AdminLogin login = new AdminLogin();
                
                bool chk_login_result = login.CheckLogin(adminlogin);
                
                if(chk_login_result)
                {
                    HttpContext.Session.SetString("AdminLogin", "true");
                    adminlogin.adminMsg = "Login Succesful!";
                    return RedirectToAction("AdminControlPanel");
                }
                else
                {
                    adminlogin.adminMsg = "Invalid User Name or Pwd?";
                    return View(adminlogin);

                }

            }
             return View(adminlogin);           
        }

    }
    
}