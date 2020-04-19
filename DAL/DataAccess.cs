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
        public DataAccess()
        {

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
                DeliveryRegister[] deliveryloginavail = connection.Query<DeliveryRegister>("select * from delivery_register WHERE delivery_login_id='" + deliveryregister.Delivery_Login_Id + "'").ToArray();

                return deliveryloginavail;
            }
        }

        public object AddDeliveryRegisterToDatabase(DeliveryRegister deliveryregister)
        {
            string queryString = "INSERT INTO delivery_register (delivery_login_id, delivery_pwd_hash,delivery_pwd_salt, delivery_user_firstname,delivery_user_lastname,delivery_user_address,delivery_user_city,delivery_user_province,delivery_user_postalcode,delivery_user_phoneno) VALUES ('" + deliveryregister.Delivery_Login_Id + "', '" + deliveryregister.Delivery_Pwd_Hash + "','" + deliveryregister.Delivery_Pwd_Salt + "', '" + deliveryregister.Delivery_User_Firstname + "','" + deliveryregister.Delivery_User_Lastname + "','" + deliveryregister.Delivery_User_Address + "','" + deliveryregister.Delivery_User_City + "','" + deliveryregister.Delivery_User_Province + "','" + deliveryregister.Delivery_User_Postalcode + "','" + deliveryregister.Delivery_User_Phoneno + "');";
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
                DeliveryLoginDb deliverylogin = connection.QueryFirst<DeliveryLoginDb>("select * from delivery_register WHERE [delivery_login_id] = '" + dblogindetails.Delivery_Login_Id + "'");

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

        public StoresList[] GetAllStoreListFromDatabase()
        {
            using (IDbConnection connection = ConnectToDatabase())
            {
                StoresList[] storelist = connection.Query<StoresList>("select * from pizza_store order by store_id asc").ToArray();

                return storelist;
            }
        }

        public StoreMenu[] GetStoreMenuFromDatabase(int StoreId)
        {
            using (IDbConnection connection = ConnectToDatabase())
            {
                StoreMenu[] storemenu = connection.Query<StoreMenu>("SELECT dbo.pizza_store.store_name,dbo.pizza_store.store_image,dbo.pizza_store.store_delivery_time,dbo.pizza_store_menu.* FROM dbo.pizza_store INNER JOIN dbo.pizza_store_menu ON dbo.pizza_store.store_id = dbo.pizza_store_menu.pizza_store_id WHERE pizza_store_menu.pizza_store_id = " + StoreId + " ORDER BY pizza_store_menu.pizza_menu_id; ").ToArray();

                return storemenu;
            }
        }

        public StoreMenu[] GetMenuItemDetailsFromDb(int storeid, int menuid)
        {
            using (IDbConnection connection = ConnectToDatabase())
            {
                StoreMenu[] menuitemdetails = connection.Query<StoreMenu>("SELECT * FROM pizza_store_menu WHERE pizza_store_id=" + storeid + " AND pizza_menu_id=" + menuid + " ").ToArray();

                return menuitemdetails;
            }
        }

        public Cart[] GetIteminCartDb(string cart_session_id, int storeid, int menuid)
        {
            using (IDbConnection connection = ConnectToDatabase())
            {
                Cart[] getitemincart = connection.Query<Cart>("SELECT * FROM pizza_cart WHERE cart_session_id='" + cart_session_id + "' AND cart_menu_id=" + menuid + " AND cart_store_id='" + storeid + "' ").ToArray();

                return getitemincart;
            }
        }

        public Cart[] GetAllItemsInCartDb(string cart_session_id)
        {
            using (IDbConnection connection = ConnectToDatabase())
            {
                Cart[] getitemincart = connection.Query<Cart>("SELECT * FROM pizza_cart WHERE cart_session_id='" + cart_session_id + "'").ToArray();

                return getitemincart;
            }
        }

        public Cart[] GetCartSubTotal(string cart_session_id)
        {
            using (IDbConnection connection = ConnectToDatabase())
            {
                Cart[] getitemincart = connection.Query<Cart>("SELECT SUM(cart_menu_price) AS Cart_Sub_Total FROM pizza_cart WHERE cart_session_id='" + cart_session_id + "'").ToArray();

                return getitemincart;
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

        public Cart[] EmptyCart(string cart_session_id)
        {
            string queryString = "DELETE FROM pizza_cart WHERE cart_session_id='"+cart_session_id+"'";
            using (IDbConnection connection = ConnectToDatabase())
            {
                Cart[] deletecartentries = connection.Query<Cart>(queryString).ToArray();
                return deletecartentries;
            }
        }





        public Cart[] InsertCartItemDb(Cart cartitem)
        {
            string queryString = "INSERT INTO pizza_cart (cart_session_id, cart_menu_id, cart_store_id, cart_menu,cart_qty,cart_menu_price) VALUES ('"+ cartitem.Cart_session_id+ "','"+cartitem.Cart_menu_id+"', '"+cartitem.Cart_store_id+"','"+cartitem.Cart_menu+"',"+cartitem.Cart_qty+","+cartitem.Cart_menu_price+");";

            using (IDbConnection connection = ConnectToDatabase())
            {
                Cart[] cartitemadd = connection.Query<Cart>(queryString).ToArray();

                return cartitemadd;
            }

        }

        public Cart[] UpdateIteminCartDb(Cart cartitem)
        {
            string queryString = "UPDATE pizza_cart SET cart_qty=" + cartitem.Cart_qty + ", cart_menu_price='"+cartitem.Cart_menu_price+"' WHERE cart_id=" + cartitem.Cart_id + "";
            using (IDbConnection connection = ConnectToDatabase())
            {
                Cart[] cartupdate = connection.Query<Cart>(queryString).ToArray();
                return cartupdate;
            }
        }
    }
}


