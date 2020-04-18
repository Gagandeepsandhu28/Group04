using DAL;
using DataModels;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library.BusinessLogic
{
    public class CartHandler
    {
        public CartHandler() { }
        public Cart[] GetIteminCart(string Cart_Session_Id,int StoreId, int MenuId)
        {
            DataAccess db = new DataAccess();
            var getitemincart = db.GetIteminCartDb(Cart_Session_Id,StoreId, MenuId);
            return getitemincart;
        }
    }
}
