using System;
using System.Collections.Generic;
using System.Text;

namespace DataModels
{
    public class DeliveryLoginDb
    {
        public string Delivery_Login_Id { get; set; }
        public string Delivery_Pwd_Hash { get; set; }
        public string Delivery_Pwd_Salt { get; set; }
    }
}
