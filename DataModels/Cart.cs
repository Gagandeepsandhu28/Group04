using System;
using System.Collections.Generic;
using System.Text;

namespace DataModels
{
    public class Cart
    {
        public string Cart_id { get; set; }
        public string Cart_session_id { get; set; }
        public string Cart_menu_id { get; set; }
        public int Cart_store_id { get; set; }
        public string Cart_qty { get; set; }
        public string Cart_menu_price { get; set; }
    }
}
