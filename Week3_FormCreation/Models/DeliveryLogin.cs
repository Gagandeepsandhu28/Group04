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
    }
}
