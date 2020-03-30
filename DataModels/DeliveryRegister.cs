using System;
using System.Collections.Generic;
using System.Text;

namespace DataModels
{
   public class DeliveryRegister
    {
        public string Delivery_Id { get; set; }
        public string Delivery_Login_Id { get; set; }
        public string Delivery_Pwd_Hash { get; set; }
        public string Delivery_Pwd_Salt { get; set; }
        public string Delivery_User_Firstname { get; set; }
        public string Delivery_User_Lastname { get; set; }
        public string Delivery_User_Address { get; set; }
        public string Delivery_User_City { get; set; }
        public string Delivery_User_Province { get; set; }
        public string Delivery_User_Postalcode { get; set; }
        public string Delivery_User_Phoneno { get; set; }
        
    }
}
