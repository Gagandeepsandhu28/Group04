using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using DataModels;
using Dapper;
using System.Linq;
using System.Data.SqlClient;
using System.Configuration;

namespace DAL
{
    public class DataAccess
    {
        private readonly string ConnectionStringName = "DefaultConnection";

       // private IConfiguration _configuration;
        private string ConnectionString;
        public DataAccess() {

            var config = new ConfigurationBuilder()
           .AddJsonFile("appsettings.json")
           .Build();
            var connectionString = config["ConnectionStrings:DefaultConnection"];
            ConnectionString = connectionString;
        }

       private SqlConnection ConnectToDatabase()
        {
            var conn = new SqlConnection(ConnectionString);
            conn.Open();
            return conn;
        }
            public AdminLoginDb GetLoginId()
        {
            using (IDbConnection connection = ConnectToDatabase())
            {
                AdminLoginDb adminlogin = connection.QueryFirst<AdminLoginDb>("select * from admin_config WHERE config_id = 1");

                return adminlogin;
            }
        }

        public ContactUs[] GetAllContactUsFromDatabase()
        {
            using (IDbConnection connection = ConnectToDatabase())
            {
                ContactUs[] contactus = connection.Query<ContactUs>("select * from ContactUs order by id asc").ToArray();

                return contactus;
            }
        }

        public object AddContactUsToDatabase(ContactUs newContactUs)
        {
            string queryString = "INSERT INTO ContactUs (ContactName, ContactSubject, ContactEmail, ContactMessage) VALUES ( '" + newContactUs.ContactName + "', '" + newContactUs.ContactSubject + "', '" + newContactUs.ContactEmail + "', '" + newContactUs.ContactMessage + "');";

            using (IDbConnection connection = ConnectToDatabase())
            {
                ContactUs[] contactus = connection.Query<ContactUs>(queryString).ToArray();

                return contactus;
            }

        }
    }
}
