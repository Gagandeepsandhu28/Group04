using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using DataModels;
using Dapper;
using System.Linq;

namespace DAL
{
    public class DataAccess
    {
        private readonly string ConnectionStringName = "DefaultConnection";

        private IConfiguration _configuration;

        public DataAccess() { }

        public DataAccess(IConfiguration Configuration)
        {
            _configuration = Configuration;
        }

        public AdminLoginDb GetLoginId()
        {
            using (IDbConnection connection = new System.Data.SqlClient.SqlConnection(Helper.BlogConnectionStringValue(_configuration, ConnectionStringName)))
            {
                AdminLoginDb adminlogin = connection.QueryFirst<AdminLoginDb>("select * from admin_config WHERE config_id = 1");

                return adminlogin;
            }
        }

        public ContactUs[] GetAllContactUsFromDatabase()
        {
            using (IDbConnection connection = new System.Data.SqlClient.SqlConnection(Helper.BlogConnectionStringValue(_configuration, ConnectionStringName)))
            {
                ContactUs[] contactus = connection.Query<ContactUs>("select * from ContactUs order by id asc").ToArray();

                return contactus;
            }
        }

        public object AddContactUsToDatabase(ContactUs newContactUs)
        {
            string queryString = "INSERT INTO ContactUs (ContactName, ContactSubject, ContactEmail, ContactMessage) VALUES ( '" + newContactUs.ContactName + "', '" + newContactUs.ContactSubject + "', '" + newContactUs.ContactEmail + "', '" + newContactUs.ContactMessage + "');";

            using (IDbConnection connection = new System.Data.SqlClient.SqlConnection(Helper.BlogConnectionStringValue(_configuration, ConnectionStringName)))
            {
                ContactUs[] contactus = connection.Query<ContactUs>(queryString).ToArray();

                return contactus;
            }

        }
    }
}
