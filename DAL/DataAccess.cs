using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using DataModels;
using Dapper;
using System.Linq;
using System.Data.SqlClient;

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

        private const string ConnectionString = @"Data Source=dbfoodgroup4.cghbrgsd5ghi.ca-central-1.rds.amazonaws.com;Initial Catalog=Week6DB;User ID=dba;Password=$week6Dbfood;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

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
