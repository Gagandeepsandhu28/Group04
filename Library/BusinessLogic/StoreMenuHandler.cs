using DAL;
using DataModels;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library.BusinessLogic
{
    public class StoreMenuHandler
    {
        public StoreMenuHandler() { }
        public StoreMenu[] GetStoreMenu(int StoreId)
        {
            DataAccess db = new DataAccess();
            var stormenu = db.GetStoreMenuFromDatabase(StoreId);
            return stormenu;
        }
        public StoreMenu[] GetStoreItemDetails(int StoreId, int MenuId)
        {
            DataAccess db = new DataAccess();
            var itemdetails = db.GetMenuItemDetailsFromDb(StoreId,MenuId);
            return itemdetails;
        }
    }
}
