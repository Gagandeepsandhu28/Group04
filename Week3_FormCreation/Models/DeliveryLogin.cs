using Library.BusinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Week3_FormCreation.Models
{
    public class DeliveryLogin
    {
        public DeliveryLogin()
        {

        }
        public string deliveryLoginId { get; set; }
        public string deliveryLoginPwd { get; set; }

        public string deliveryLoginHash { get; set; }
        public string deliveryLoginSalt { get; set; }
        public string deliveryMsg { get; set; }

        public bool CheckLogin(DeliveryLogin deliverylogin)
        {

            bool result = false;
            DataModels.DeliveryLoginDb dbdeliverylogin = new DataModels.DeliveryLoginDb();
            dbdeliverylogin.Delivery_Login_Id = deliverylogin.deliveryLoginId;
            

            DeliveryLoginHandler handler = new DeliveryLoginHandler();
            var deliverylogin_var = handler.GetDeliveryLoginId(dbdeliverylogin);
            //return View(contacts);
            // CHECK LOGIN
            if (deliverylogin.deliveryLoginId.ToString().Equals(deliverylogin_var.Delivery_Login_Id.ToString()))
            {
                string stored_hash = deliverylogin_var.Delivery_Pwd_Hash.ToString();
                string stored_salt = deliverylogin_var.Delivery_Pwd_Salt.ToString();
                string stored_pwd = deliverylogin.deliveryLoginPwd;
                bool pwd_verify = HashSalt.VerifyPassword(stored_pwd, stored_hash, stored_salt);
                if (pwd_verify)
                {
                    // Result -> TRUE
                    result = true;
                    // adminlogin.adminLoginSalt = "Password Verified";
                }
            }


            return result;
        }
    }
}
