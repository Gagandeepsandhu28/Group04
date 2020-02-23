using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Text;
using Dapper;
using DAL;
using DataModels;

namespace Library.BusinessLogic
{
    public class ContactUsHandler
    {
        private IConfiguration _configuration;
        public ContactUsHandler() { }
        public ContactUsHandler(IConfiguration Configuration)
        {
            _configuration = Configuration;
        }
        public ContactUs[] GetAllContactUs()
        {
            DataAccess db = new DataAccess(_configuration);
            var contactus = db.GetAllContactUsFromDatabase();
            return contactus;
        }
        public object AddContact(ContactUs contactus)
        {
            DataAccess db = new DataAccess(_configuration);
            var contacts = db.AddContactUsToDatabase(contactus);
            return contacts;
        }
    }
}

