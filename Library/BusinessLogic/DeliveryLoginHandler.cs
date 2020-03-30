using DAL;
using DataModels;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library.BusinessLogic
{
    public class DeliveryLoginHandler
    {
        public DeliveryLoginDb GetDeliveryLoginId(DeliveryLoginDb login)
        {
            DataAccess db = new DataAccess();
            var deliverylogin = db.GetDeliveryLogin(login);
            return deliverylogin;
        }
    }
}
