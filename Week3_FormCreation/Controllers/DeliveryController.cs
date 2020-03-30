﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Library.BusinessLogic;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Week3_FormCreation.Models;

namespace Week3_FormCreation.Controllers
{
    public class DeliveryController : Controller
    {
        public IActionResult DeliveryUserPanel()
        {
            // CHECK LOGIN SESSION!
            var var_chk_session = HttpContext.Session.GetString("DeliveryLogin");
            if (var_chk_session is null)
            {
                return RedirectToAction("Index");

            }
            else
            {
                if (var_chk_session.ToString().Equals("true"))
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
            var var_chk_session = HttpContext.Session.GetString("DeliveryLogin");
            if (var_chk_session is null)
            {
                return RedirectToAction("Index");

            }
            else
            {
                if (var_chk_session.ToString().Equals("true"))
                {
                    HttpContext.Session.SetString("DeliveryLogin", "false");
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
            var var_chk_session = HttpContext.Session.GetString("DeliveryLogin");
            if (var_chk_session is null)
            {
                return View();

            }
            else
            {
                if (var_chk_session.ToString().Equals("true"))
                {
                    return RedirectToAction("DeliveryUserPanel");
                }
                else
                {
                    return View();
                }

            }

        }

        [HttpPost]
        public IActionResult Index(DeliveryLogin deliverylogin)
        {

            // Create A Has Password in DB
            if (ModelState.IsValid)
            {
                if (deliverylogin.deliveryLoginId == null || deliverylogin.deliveryLoginPwd == null)
                {
                    return View(deliverylogin);
                }
                // CHK DB TO GET DELIVERY STORED PWD SALT AND HASH & LOGIN ID
                // CHK LOGIN
                DeliveryLogin login = new DeliveryLogin();

                bool chk_login_result = login.CheckLogin(deliverylogin);

                if (chk_login_result)
                {
                    HttpContext.Session.SetString("DeliveryLogin", "true");
                    deliverylogin.deliveryMsg = "Login Succesful!";
                    return RedirectToAction("DeliveryUserPanel");
                }
                else
                {
                    deliverylogin.deliveryMsg = "Invalid User Name or Pwd?";
                    return View(deliverylogin);

                }

            }
            return View(deliverylogin);
        }

        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Register(Week3_FormCreation.Models.DeliveryRegister deliveryregister)
        {

            // CHECK ALL THE REGISTERATION PARAMETERS
            if (ModelState.IsValid)
            {

                // CHECK THE STATUS ALL FIELDS ARE COMPLETE.
                if (deliveryregister.deliveryRegisterLoginEmailId == null || deliveryregister.deliveryRegisterLoginPwdFirst == null || deliveryregister.deliveryRegisterLoginPwdRepeat == null)
                {
                    return View(deliveryregister);
                }

                // INITATE DELIVERY REGISTER.
                DeliveryRegister register = new DeliveryRegister();

                // CHK USER_LOGIN EXISTS-> ID AVAILABLE
                DataModels.DeliveryRegister delivery_register = new DataModels.DeliveryRegister();
                delivery_register.Delivery_Login_Id = deliveryregister.deliveryRegisterLoginEmailId;
                bool isIDAlreadyExist = register.CheckLoginIdExists(delivery_register);

                if(isIDAlreadyExist)
                {
                    deliveryregister.deliveryRegisterMsg = "User Email Id Already Exists!";
                    return View(deliveryregister);
                }


                // CHK PWD_REPEAT & STRENGTH (ATLEAST 1 CAPITAL,LENGTH:8,1 SYMBOL (@#$`!),NUMBER 1)
                bool pwd_strengthMatch = register.CheckPasswordStrengthMatch(deliveryregister.deliveryRegisterLoginPwdFirst, deliveryregister.deliveryRegisterLoginPwdRepeat);

                if(pwd_strengthMatch==false)
                {
                    deliveryregister.deliveryRegisterMsg = "Password Not Matching / No Passord Strength Criteria Followed!";
                    return View(deliveryregister);
                }

                // GET THE HASH PASSWORD AND SALT
                HashSalt hash =  HashSalt.GenerateSaltedHash(64, deliveryregister.deliveryRegisterLoginPwdFirst);


                // NOW EVERYTHING FINE THEN ADD THE DELIVERY USER REGISTER DETAILS TO THE DB...
                delivery_register.Delivery_Login_Id = deliveryregister.deliveryRegisterLoginEmailId;
                delivery_register.Delivery_Pwd_Hash = hash.Hash;
                delivery_register.Delivery_Pwd_Salt = hash.Salt;
                delivery_register.Delivery_User_Address = deliveryregister.deliveryRegisterUserAddress;
                delivery_register.Delivery_User_City = deliveryregister.deliveryRegisterUserCity;
                delivery_register.Delivery_User_Firstname = deliveryregister.deliveryRegisterUserFirstName;
                delivery_register.Delivery_User_Lastname = deliveryregister.deliveryRegisterUserLastName;
                delivery_register.Delivery_User_Phoneno = deliveryregister.deliveryRegisterUserPhoneNo;
                delivery_register.Delivery_User_Postalcode = deliveryregister.deliveryRegisterUserPostalCode;
                delivery_register.Delivery_User_Province = deliveryregister.deliveryRegisterUserProvince;

                // ADD THE REGISTER DELIVERY USER TO DB...
                DeliveryRegisterHandler handler = new DeliveryRegisterHandler();
                var newregisteruser = handler.AddDeliveryRegister(delivery_register);

                deliveryregister.deliveryRegisterMsg = "User Added Succesfully! Please Login";
                
            

                return View(deliveryregister);
            }
            
            return View(deliveryregister);
        }
    }
}