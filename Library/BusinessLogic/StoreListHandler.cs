using DAL;
using DataModels;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library.BusinessLogic
{
   public class StoreListHandler
    {
        public StoreListHandler() { }
        public StoresList[] GetAllStoreList()
        {
            DataAccess db = new DataAccess();
            var storelist = db.GetAllStoreListFromDatabase();
            return storelist;
        }
    }
}
