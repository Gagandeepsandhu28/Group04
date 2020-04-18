using System;
using System.Collections.Generic;
using System.Text;

namespace DataModels
{
    public class StoreMenu
    {
        public string Store_Name { get; set; }
        public string Store_Image { get; set; }
        public string Store_Delivery_Time { get; set; }
        public int Pizza_Store_Id { get; set; }
        public int Pizza_Menu_Id { get; set; }
        public string Pizza_Menu { get; set; }
        public string Pizza_Menu_Description { get; set; }
        public float Pizza_Menu_Price { get; set; }
    }
}
