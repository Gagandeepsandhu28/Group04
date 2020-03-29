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
        public ContactUsHandler() { }
        public ContactUs[] GetAllContactUs()
        {
            DataAccess db = new DataAccess();
            var contactus = db.GetAllContactUsFromDatabase();
            return contactus;
        }
        public object AddContact(ContactUs contactus)
        {
            DataAccess db = new DataAccess();
            var contacts = db.AddContactUsToDatabase(contactus);
            return contacts;
        }
    }
}

