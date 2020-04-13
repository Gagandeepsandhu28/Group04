using Library.BusinessLogic;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Moq;
using System;
using Week3_FormCreation.Controllers;
using Week3_FormCreation.Models;
using Xunit;


namespace Checkpoint1.Tests
{
    public class UnitTests
    {
        private IConfiguration _configuration;

        // TEST ChekLogin_Hash Alogrithm (Verifiying User Password)
        [Fact]
        public void CheckValidPassword_HashAlgorithmReturnsboolTrue()
        {
            //Arrange
            string expected_result = "True";
            string pwd_hash = "ygan3Pe4mlnH5lG0ZdvzpFY/ouODmMQG+iOg2WoJCYLgsIoXUC2tUrTQKXAY3A3ssgR+3n7Jplwa6vGv+omnhgiZJr4Be9mEwVAYr5IyWxYz0Oy+Z+lagtyql+QethJSo3ziKDDflv7dcleF85Hl1ZXdswZnT+FcP1wPL+onXGBujFl6egCAXgKJox4/iK9sk2kAs9NDhiTwbNiAOBl9lmvQv+UCbizfPTWQWkfVkRQyY8B2OpexaTt1jkCLwZkh/0JcZ/pa4tX/iDZA8RBjk6/RQcFQ74wwlitWhM+X9yJolBQ6qX8/s3OQaEyU0cOtfS5TkyOVLaRY16sRt/x4ZA==";
            string pwd_salt = "toPA/PERLRiLzaTUppBPE5OrFf3StjN99xo9N49h7mGXQFVZXoljBruO2Emt2kJy0EOWMIy2671g5FAfS/X5Kg==";
            string pwd = "pass@1234";


            //Act
            bool actual_result = HashSalt.VerifyPassword(pwd, pwd_hash, pwd_salt);

            //Assert
            Assert.Equal(expected_result.ToString(), actual_result.ToString());

        }


        // TEST ChekLogin_Hash Alogrithm (Verifiying User InvalidPassword)
        [Fact]
        public void CheckInvalidPassword_HashAlgorithmReturnsboolTrue()
        {
            //Arrange
            string expected_result = "True";
            string pwd_hash = "ygan3Pe4mlnH5lG0ZdvzpFY/ouODmMQG+iOg2WoJCYLgsIoXUC2tUrTQKXAY3A3ssgR+3n7Jplwa6vGv+omnhgiZJr4Be9mEwVAYr5IyWxYz0Oy+Z+lagtyql+QethJSo3ziKDDflv7dcleF85Hl1ZXdswZnT+FcP1wPL+onXGBujFl6egCAXgKJox4/iK9sk2kAs9NDhiTwbNiAOBl9lmvQv+UCbizfPTWQWkfVkRQyY8B2OpexaTt1jkCLwZkh/0JcZ/pa4tX/iDZA8RBjk6/RQcFQ74wwlitWhM+X9yJolBQ6qX8/s3OQaEyU0cOtfS5TkyOVLaRY16sRt/x4ZA==";
            string pwd_salt = "toPA/PERLRiLzaTUppBPE5OrFf3StjN99xo9N49h7mGXQFVZXoljBruO2Emt2kJy0EOWMIy2671g5FAfS/X5Kg==";
            string pwd = "pass@12345";


            //Act
            bool actual_result = HashSalt.VerifyPassword(pwd, pwd_hash, pwd_salt);

            //Assert
            Assert.NotEqual(expected_result.ToString(), actual_result.ToString());



        }

        // TEST Database Delivery CheckLogin - Test with Correct Credentials
        [Fact]
        public void DeliveryCheckValidPassword_DbCheckLoginReturnsboolTrue()
        {
            //Arrange
            string expected_result = "True";
            DeliveryLogin login = new DeliveryLogin();
            login.deliveryLoginId = "sibtain.bca@gmail.com";
            login.deliveryLoginPwd = "Buck$2255";

            //Act
            bool actual_result = login.CheckLogin(login);

            //Assert
            Assert.Equal(expected_result.ToString(), actual_result.ToString());



        }
        // TEST Database Delivery CheckLogin - Test with Invalid Credentials
        [Fact]
        public void DeliveryCheckValidPassword_DbCheckLoginReturnsboolFalse()
        {
            //Arrange
            string expected_result = "False";
            DeliveryLogin login = new DeliveryLogin();
            login.deliveryLoginId = "sibtain.bca@gmail.com";
            login.deliveryLoginPwd = "Buck2255";

            //Act
            bool actual_result = login.CheckLogin(login);

            //Assert
            Assert.Equal(expected_result.ToString(), actual_result.ToString());



        }

        // TEST Database Admin CheckLogin - Test with Correct Credentials
        [Fact]
        public void CheckValidPassword_DbCheckLoginReturnsboolTrue()
        {
            //Arrange
            string expected_result = "True";
            AdminLogin login = new AdminLogin();
            login.adminLoginId = "admin";
            login.adminLoginPwd = "pass@1234";
           
            //Act
            bool actual_result = login.CheckLogin(login);

            //Assert
            Assert.Equal(expected_result.ToString(), actual_result.ToString());



        }

        // TEST Database Admin CheckLogin - Test with Invalid Credentials
        [Fact]
        public void CheckInValidPassword_DbCheckloginReturnsboolTrue()
        {
            //Arrange
            string expected_result = "True";
            AdminLogin login = new AdminLogin();
            login.adminLoginId = "admin";
            login.adminLoginPwd = "pass@12345";

            //Act
            bool actual_result = login.CheckLogin(login);

            //Assert
            Assert.NotEqual(expected_result.ToString(), actual_result.ToString());



        }
        // TEST CheckPasswordStrenghtMatch - Test with Matching PWD
        [Fact]
        public void CheckPasswordStrengthMatch_MatchReturnsboolTrue()
        {
            //Arrange
            string expected_result = "True";
           
            DeliveryRegister useradd = new DeliveryRegister();
            useradd.deliveryRegisterLoginPwdFirst = "@Rotpolx12";
            useradd.deliveryRegisterLoginPwdRepeat = "@Rotpolx12";

            //Act
            bool actual_result = useradd.CheckPasswordStrengthMatch(useradd.deliveryRegisterLoginPwdFirst,useradd.deliveryRegisterLoginPwdRepeat);

            //Assert
            Assert.Equal(expected_result.ToString(), actual_result.ToString());
            
        }

        // TEST CheckPasswordStrenghtMatch - Test with Without Capital Letter in pwd
        [Fact]
        public void CheckPasswordStrengthMatch_NoCapitalReturnsboolFalse()
        {
            //Arrange
            string expected_result = "False";

            DeliveryRegister useradd = new DeliveryRegister();
            useradd.deliveryRegisterLoginPwdFirst = "@kotpolx12";
            useradd.deliveryRegisterLoginPwdRepeat = "@kotpolx12";

            //Act
            bool actual_result = useradd.CheckPasswordStrengthMatch(useradd.deliveryRegisterLoginPwdFirst, useradd.deliveryRegisterLoginPwdRepeat);

            //Assert
            Assert.Equal(expected_result.ToString(), actual_result.ToString());

        }

        // TEST CheckDeliveryLoginIdExists in DB - Test with Username Which Doesnot Exists
        [Fact]
        public void CheckDeliveryLoginIdExists_UserIdReturnsboolFalse()
        {
            //Arrange
            string expected_result = "False";

            DataModels.DeliveryRegister useradd = new DataModels.DeliveryRegister();
            useradd.Delivery_Login_Id="sjagani3229@conestogac.on.ca";

            DeliveryRegister dl_user = new DeliveryRegister();
            
            //Act
            bool actual_result = dl_user.CheckLoginIdExists(useradd);

            //Assert
            Assert.Equal(expected_result.ToString(), actual_result.ToString());

        }

        // TEST CheckDeliveryLoginIdExists in DB - Test with Username Exists
        [Fact]
        public void CheckPLoginIdExists_UserIdReturnsboolTrue()
        {
            //Arrange
            string expected_result = "True";

            DataModels.DeliveryRegister useradd = new DataModels.DeliveryRegister();
            useradd.Delivery_Login_Id = "sibtain.bca@gmail.com";

            DeliveryRegister dl_user = new DeliveryRegister();

            //Act
            bool actual_result = dl_user.CheckLoginIdExists(useradd);

            //Assert
            Assert.Equal(expected_result.ToString(), actual_result.ToString());

        }

        // CHECK DeliveryUser Data is saved in DB.
        [Fact]
        public void DeliveryUserAdd_UserDetailsReturnsInserted()
        {
            //Arrange
            string expected_result = "True";

            DataModels.DeliveryRegister useradd = new DataModels.DeliveryRegister();
            useradd.Delivery_Login_Id = "pramodjat@gmail.com";
            useradd.Delivery_Pwd_Hash = "Hash";
            useradd.Delivery_Pwd_Salt = "Salt";
            useradd.Delivery_User_Address = "Address555";
            useradd.Delivery_User_City = "Waterloo";
            useradd.Delivery_User_Firstname = "Pramod";
            useradd.Delivery_User_Phoneno = "545454";
            useradd.Delivery_User_Postalcode = "MXE6555";
            useradd.Delivery_User_Province = "Ontario";

            DeliveryRegisterHandler handler = new DeliveryRegisterHandler();
            var newregisteruser = handler.AddDeliveryRegister(useradd);


            //Act
          
            bool actual_result = true;

            //Assert
            Assert.Equal(expected_result.ToString(), actual_result.ToString());

        }

        // TEST CheckPasswordStrenghtMatch - Test with NoMatching PWD
        [Fact]
        public void CheckPasswordStrengthMatch_MatchReturnsboolFalse()
        {
            //Arrange
            string expected_result = "True";

            DeliveryRegister useradd = new DeliveryRegister();
            useradd.deliveryRegisterLoginPwdFirst = "@Rotpolx12";
            useradd.deliveryRegisterLoginPwdRepeat = "@Rotpolx123";

            //Act
            bool actual_result = useradd.CheckPasswordStrengthMatch(useradd.deliveryRegisterLoginPwdFirst, useradd.deliveryRegisterLoginPwdRepeat);

            //Assert
            Assert.NotEqual(expected_result.ToString(), actual_result.ToString());

        }
        // TEST Without Symbol In Password//
        [Fact]
        public void CheckPasswordStrengthMatchWithoutSymbol_MatchReturnsboolFalse()
        {
            //Arrange
            string expected_result = "True";

            DeliveryRegister useradd = new DeliveryRegister();
            useradd.deliveryRegisterLoginPwdFirst = "Rotpolx123";
            useradd.deliveryRegisterLoginPwdRepeat = "Rotpolx123";

            //Act
            bool actual_result = useradd.CheckPasswordStrengthMatch(useradd.deliveryRegisterLoginPwdFirst, useradd.deliveryRegisterLoginPwdRepeat);

            //Assert
            Assert.NotEqual(expected_result.ToString(), actual_result.ToString());

        }
        // TEST Without Number In Password//
        [Fact]
        public void CheckPasswordStrengthMatchWithoutNumber_MatchReturnsboolFalse()
        {
            //Arrange
            string expected_result = "True";

            DeliveryRegister useradd = new DeliveryRegister();
            useradd.deliveryRegisterLoginPwdFirst = "Rotpolxabc";
            useradd.deliveryRegisterLoginPwdRepeat = "Rotpolxabc";

            //Act
            bool actual_result = useradd.CheckPasswordStrengthMatch(useradd.deliveryRegisterLoginPwdFirst, useradd.deliveryRegisterLoginPwdRepeat);

            //Assert
            Assert.NotEqual(expected_result.ToString(), actual_result.ToString());

        }
        // TEST With Less Than Eight Characters In Password//
        [Fact]
        public void CheckPasswordStrengthMatchWithLessThanEightCharacters_MatchReturnsboolFalse()
        {
            //Arrange
            string expected_result = "True";

            DeliveryRegister useradd = new DeliveryRegister();
            useradd.deliveryRegisterLoginPwdFirst = "Rot23";
            useradd.deliveryRegisterLoginPwdRepeat = "Rot23";

            //Act
            bool actual_result = useradd.CheckPasswordStrengthMatch(useradd.deliveryRegisterLoginPwdFirst, useradd.deliveryRegisterLoginPwdRepeat);

            //Assert
            Assert.NotEqual(expected_result.ToString(), actual_result.ToString());

        }
        //Test with all Uppercase Characters in Password
        [Fact]
        public void CheckPasswordStrengthMatchWithAllUpperCaseCharacters_MatchReturnsboolFalse()
        {
            //Arrange
            string expected_result = "True";

            DeliveryRegister useradd = new DeliveryRegister();
            useradd.deliveryRegisterLoginPwdFirst = "BUCK$2255";
            useradd.deliveryRegisterLoginPwdRepeat = "BUCK$2255";

            //Act
            bool actual_result = useradd.CheckPasswordStrengthMatch(useradd.deliveryRegisterLoginPwdFirst, useradd.deliveryRegisterLoginPwdRepeat);

            //Assert
            Assert.NotEqual(expected_result.ToString(), actual_result.ToString());

        }

    }

}