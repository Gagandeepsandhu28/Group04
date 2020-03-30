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

        public DeliveryRegister[] CheckDeliveryRegisterLoginAvailable(DeliveryRegister deliveryregister)
        {
            using (IDbConnection connection = ConnectToDatabase())
            {
                DeliveryRegister[] deliveryloginavail = connection.Query<DeliveryRegister>("select * from delivery_register WHERE delivery_login_id='"+deliveryregister.Delivery_Login_Id+"'").ToArray();

                return deliveryloginavail;
            }
        }

        public object AddDeliveryRegisterToDatabase(DeliveryRegister deliveryregister)
        {
            string queryString = "INSERT INTO delivery_register (delivery_login_id, delivery_pwd_hash,delivery_pwd_salt, delivery_user_firstname,delivery_user_lastname,delivery_user_address,delivery_user_city,delivery_user_province,delivery_user_postalcode,delivery_user_phoneno) VALUES ('"+deliveryregister.Delivery_Login_Id+"', '"+deliveryregister.Delivery_Pwd_Hash+"','"+deliveryregister.Delivery_Pwd_Salt+"', '"+deliveryregister.Delivery_User_Firstname+"','"+deliveryregister.Delivery_User_Lastname+"','"+deliveryregister.Delivery_User_Address+"','"+deliveryregister.Delivery_User_City+"','"+deliveryregister.Delivery_User_Province+"','"+deliveryregister.Delivery_User_Postalcode+"','"+deliveryregister.Delivery_User_Phoneno+"');";
            using (IDbConnection connection = ConnectToDatabase())
            {
                DeliveryRegister[] deliveryinsert = connection.Query<DeliveryRegister>(queryString).ToArray();
                return deliveryinsert;
            }
        }
    

    public AdminLoginDb GetLoginId()
        {
            using (IDbConnection connection = ConnectToDatabase())
            {
                AdminLoginDb adminlogin = connection.QueryFirst<AdminLoginDb>("select * from admin_config WHERE config_id = 1");

                return adminlogin;
            }
        }

        public DeliveryLoginDb GetDeliveryLogin(DeliveryLoginDb dblogindetails)
        {
            using (IDbConnection connection = ConnectToDatabase())
            {
                DeliveryLoginDb deliverylogin = connection.QueryFirst<DeliveryLoginDb>("select * from delivery_register WHERE [delivery_login_id] = '"+ dblogindetails.Delivery_Login_Id+"'");

                return deliverylogin;
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
