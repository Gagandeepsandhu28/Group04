﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using DAL;
using DataModels;
using Library.BusinessLogic;
using System.Configuration;
using Microsoft.Extensions.Configuration;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Week3_FormCreation.Controllers
{

    public class ContactUsController : Controller
    {
        private IConfiguration _configuration;

        public ContactUsController(IConfiguration Configuration)
        {
            _configuration = Configuration;
        }

        // GET: /<controller>/
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }



        [HttpPost]
        public async Task<IActionResult> Index(ContactUs contact)
        {
            
            // SEND A FORM DETAILS TO EMAIL ACCOUNT - prog8060group4@gmail.com (Dummy Practice SMTP MAIL SERVER)
            if (ModelState.IsValid)
            {
                if (contact.ContactEmail == null)
                {
                    return View();
                }

                // ADD THE CONTACT CONTENT TO DB...
                ContactUsHandler handler = new ContactUsHandler(_configuration);
                var newcontactus = handler.AddContact(contact);

                // SERVER COPY EMAIL
                var contact_mail = new MailMessage();
                contact_mail.To.Add(new MailAddress("prog8060group4@gmail.com","ContactUsForm")); // Demo Gmail Account:: 
                contact_mail.From = new MailAddress(contact.ContactEmail);  
                contact_mail.Subject = "ContactUsForm:" + contact.ContactSubject;
                contact_mail.Body = contact.ContactMessage + "<br/>-------------------------------<br/><b>Client Information</b><br/>-------------------------------<br/> Email: " + contact.ContactEmail + "<br/>Name:" + contact.ContactName ;
                contact_mail.IsBodyHtml = true;

                // AUTO MESSAGE EMAIL
                var auto_mail = new MailMessage();
                auto_mail.To.Add(new MailAddress(contact.ContactEmail, contact.ContactName)); // Email Account OF CLIENT 
                auto_mail.From = new MailAddress(contact.ContactEmail, "donotreply");
                auto_mail.Subject = "Contact Form Submission Acknowledgement (Auto Reply)";
                auto_mail.Body = "Hello " + contact.ContactName + ",<br/> <br/> This is an automated generated message acknowledging the receipt of your contact us form submission.<br/>Please don't reply this email as we will not be able to receive your mail. </br> We will get back to you soon. <br/><br/> Sincerely, <br/> <br/> PROG8060-G4 Team";
                auto_mail.IsBodyHtml = true;

                using (var smtp = new SmtpClient())
                {
                    var credential = new NetworkCredential
                    {
                        UserName = "prog8060group4@gmail.com",
                        Password = "group48060"
                    };
                    smtp.Credentials = credential;
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    await smtp.SendMailAsync(contact_mail);
                    await smtp.SendMailAsync(auto_mail);
                    return RedirectToAction("Listing");
                }
                
            }
            return RedirectToAction("Listing");
        }

        public IActionResult Listing()
        {
            ContactUsHandler handler = new ContactUsHandler(_configuration);
            var contacts = handler.GetAllContactUs();
            return View(contacts);
        }
    }
   
}
