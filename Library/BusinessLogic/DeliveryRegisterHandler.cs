using DAL;
using DataModels;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library.BusinessLogic
{
   public class DeliveryRegisterHandler
    {
        public DeliveryRegisterHandler() { }
        public DeliveryRegister[] GetEmailLoginId(DeliveryRegister deliveryregister)
        {
            DataAccess db = new DataAccess();
            var deliveryavail = db.CheckDeliveryRegisterLoginAvailable(deliveryregister);
            return deliveryavail;
        }
        public object AddDeliveryRegister(DeliveryRegister deliveryregister)
        {
            DataAccess db = new DataAccess();
            var add_delivery = db.AddDeliveryRegisterToDatabase(deliveryregister);
            return add_delivery;
        }
    }
}
