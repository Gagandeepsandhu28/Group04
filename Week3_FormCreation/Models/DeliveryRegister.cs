using Library.BusinessLogic;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;
using DataModels;

namespace Week3_FormCreation.Models
{
    public class DeliveryRegister
    {
        public string deliveryRegisterLoginEmailId { get; set; }
        public string deliveryRegisterLoginPwdFirst { get; set; }
        public string deliveryRegisterLoginPwdRepeat { get; set; }

        public string deliveryRegisterLoginHash { get; set; }
        public string deliveryRegisterLoginSalt { get; set; }
        public string deliveryRegisterMsg { get; set; }

        public string deliveryRegisterUserFirstName { get; set; }
        public string deliveryRegisterUserLastName { get; set; }
        public string deliveryRegisterUserAddress { get; set; }

        public string deliveryRegisterUserCity { get; set; }
        public string deliveryRegisterUserProvince { get; set; }
        public string deliveryRegisterUserPostalCode { get; set; }
        public string deliveryRegisterUserPhoneNo { get; set; }


        public bool CheckLoginIdExists(DataModels.DeliveryRegister loginchk)
        {
            bool result = false;
            DeliveryRegisterHandler handler = new DeliveryRegisterHandler();
            var chkdeliveryloginidavail_var = handler.GetEmailLoginId(loginchk);
            if(chkdeliveryloginidavail_var.Count() > 0)
            {
                result = true;
            }
            return result;
        }
        public bool CheckPasswordStrengthMatch(string password,string repeat_pwd)
        {
            bool result = false;
            bool haslower = false;
            bool hasUpper = false;
            bool hasNumber = false;
            bool hasSymbol = false;
            bool hasLength = false;
            bool isMatching = false;

            // Password contains lowercase letters.
            if (password.Any(c => char.IsLower(c)))
            {
                haslower = true;
            }

            // Password contains uppercase letters.
            if (password.Any(c => char.IsUpper(c)))
            {
                hasUpper =true;
            }

            // Password contains numbers.
            if (password.Any(c => char.IsDigit(c)))
            {
                hasNumber = true;
            }

            // Password contains symbols.
            if (password.IndexOfAny("@#$`!".ToCharArray()) >= 0)
            {
                hasSymbol = true;
            }

            // Password Length > 8.
            if (password.Length >= 8)
            {
                hasLength = true;
            }

            // Password Matching (Repeat Match)
            if(password.Equals(repeat_pwd))
            {
                isMatching = true;
            }

            // CHECK ALL PWD PARAMETERS MATCH THEN SAY TRUE.
            if(hasUpper && haslower && hasLength && hasNumber && hasSymbol && isMatching)
            {
                result = true;
            }
            return result;
        }
    }

  
}
