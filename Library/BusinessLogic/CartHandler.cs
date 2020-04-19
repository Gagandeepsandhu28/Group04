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
        public Cart[] UpdateCartItemQty(Cart cartitem)
        {
            DataAccess db = new DataAccess();
            var updateitemincart = db.UpdateIteminCartDb(cartitem);
            return updateitemincart;
        }
        public Cart[] InsertCartItem(Cart cartitem)
        {
            DataAccess db = new DataAccess();
            var insertcartitm = db.InsertCartItemDb(cartitem);
            return insertcartitm;
        }

        public Cart[] ViewCartItems(string  cart_session_id)
        {
            DataAccess db = new DataAccess();
            var getcart_items = db.GetAllItemsInCartDb(cart_session_id);
            return getcart_items;
        }

        public Cart[] GetCartSubTotal(string cart_session_id)
        {
            DataAccess db = new DataAccess();
            var getcartsub_tot = db.GetCartSubTotal(cart_session_id);
            return getcartsub_tot;
        }

        public Cart[] EmptyCart(string cart_session_id)
        {
            DataAccess db = new DataAccess();
            var dbcartempty = db.EmptyCart(cart_session_id);
            return dbcartempty;
        }
    }
}
