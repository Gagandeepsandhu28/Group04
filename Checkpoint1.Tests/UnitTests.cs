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

        [Fact]
        public void CheckPLoginIdExists_UserIdReturnsboolFalse()
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
    }

}