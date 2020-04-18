using System;
using System.Collections.Generic;
using System.Text;

namespace DataModels
{
    public class Cart
    {
        public int Cart_id { get; set; }
        public string Cart_session_id { get; set; }
        public int Cart_menu_id { get; set; }
        public string Cart_menu { get; set; }
        public int Cart_store_id { get; set; }
        public int Cart_qty { get; set; }
        public float Cart_menu_price { get; set; }
        public float Cart_Sub_Total { get; set; }
        public float Cart_Total { get; set; }
        public float Cart_Total_Tax { get; set; }
        public string Cart_Msg { get; set; }
}
}
