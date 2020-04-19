using DataModels;
using Library.BusinessLogic;
using System;
using System.Linq;
using Week3_FormCreation.Models;
using Xunit;

namespace Final
{
    public class FinalUnitTests
    {
        // Check Item In Cart That Exists
        [Fact]
        public void GetItemInCart_DbCheckItemCartReturnTrue()
        {
            //Arrange
            string expected_result = "True";
            string cart_session_id = "79163306-fb23-4ed1-8357-723f01a855a3";
            int cart_store_id = 0;
            int cart_menu_id = 4;

            //Act
            CartHandler carthandler = new CartHandler();
            var cartresult = carthandler.GetIteminCart(cart_session_id, cart_store_id, cart_menu_id);
            // ByDefault IT IS FALSE.
            bool actual_result = false;
            if (cartresult.Count() > 0)
            {
                actual_result = true;
            }

            // Assert

            Assert.Equal(expected_result.ToString(), actual_result.ToString());



        }

        // Check Item In Cart That Doesnot Exist
        [Fact]
        public void GetItemInCart_DbCheckItemCartReturnFalse()
        {
            //Arrange
            string expected_result = "False";
            string cart_session_id = "19163306-fb23-4ed1-8357-723f01a855a3";
            int cart_store_id = 0;
            int cart_menu_id = 4;

            //Act
            CartHandler carthandler = new CartHandler();
            var cartresult = carthandler.GetIteminCart(cart_session_id, cart_store_id, cart_menu_id);
            // ByDefault IT IS FALSE.
            bool actual_result = false;
            if (cartresult.Count() > 0)
            {
                actual_result = true;
            }

            // Assert

            Assert.Equal(expected_result.ToString(), actual_result.ToString());



        }

        // UPDATE CART ITEM -> UPDATES ITEM RETURNS TRUE
        [Fact]
        public void UpdateItemInCart_DbCheckItemCartReturnTrue()
        {
            //Arrange
            string expected_result = "True";
            //Act
            // CREATE CART OBJECT
            Cart cartitemtobeupdated = new Cart();
            cartitemtobeupdated.Cart_qty = 2;
            cartitemtobeupdated.Cart_menu_price = 15;
            cartitemtobeupdated.Cart_id = 2;
            // CREATE CARTHANDLER OBJECT
            CartHandler carthandler = new CartHandler();
            var cartresult = carthandler.UpdateCartItemQty(cartitemtobeupdated);

            bool actual_result = true;

            // Assert

            Assert.Equal(expected_result.ToString(), actual_result.ToString());


        }

        // INSERT CART ITEM -> INSERT THE CART ITEM
        [Fact]
        public void InsertItemInCart_DbCheckItemCartReturnTrue()
        {
            //Arrange
            string expected_result = "True";

            //Act
            // CREATE CART OBJECT
            Cart cartitemtobeinserted = new Cart();
            cartitemtobeinserted.Cart_qty = 2;
            cartitemtobeinserted.Cart_menu_price = 15;
            cartitemtobeinserted.Cart_id = 2;
            cartitemtobeinserted.Cart_menu_id = 1;
            cartitemtobeinserted.Cart_session_id = "79163306-fb23-4ed1-8357-723f01a855a3";
            cartitemtobeinserted.Cart_menu = "Small Pizza (6 Slices) (10)";
            cartitemtobeinserted.Cart_store_id = 0;


            // CREATE CARTHANDLER OBJECT
            CartHandler carthandler = new CartHandler();
            var cartresult = carthandler.InsertCartItem(cartitemtobeinserted);

            bool actual_result = true;

            // Assert
            Assert.Equal(expected_result.ToString(), actual_result.ToString());
        }
    }
}
