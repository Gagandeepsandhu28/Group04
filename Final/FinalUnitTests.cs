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
                // PRAMOD TEST STARTS HERE

        // VIEW ALL CART ITEMS -> TRUE
        [Fact]
        public void ViewCartItems_ViewCartItemsReturnTrue()
        {
            //Arrange
            string expected_result = "True";

            //Act
            // CREATE CART OBJECT
            string Cart_session_id = "79163306-fb23-4ed1-8357-723f01a855a3";
            
            // CREATE CARTHANDLER OBJECT
            CartHandler carthandler = new CartHandler();
            var cartresults = carthandler.ViewCartItems(Cart_session_id);

            bool actual_result = false;
            if(cartresults.Count()>0)
            {
                actual_result = true;
            }

            // Assert
            Assert.Equal(expected_result.ToString(), actual_result.ToString());
        }
        // VIEW ALL CART ITEMS -> FALSE

        [Fact]
        public void ViewCartItems_ViewCartItemsReturnFalse()
        {
            //Arrange
            string expected_result = "False";

            //Act
            // CREATE CART OBJECT
            string Cart_session_id = "09163306-fb23-4ed1-8357-723f01a855a3";

            // CREATE CARTHANDLER OBJECT
            CartHandler carthandler = new CartHandler();
            var cartresults = carthandler.ViewCartItems(Cart_session_id);

            bool actual_result = false;
            if (cartresults.Count() > 0)
            {
                actual_result = true;
            }

            // Assert
            Assert.Equal(expected_result.ToString(), actual_result.ToString());
        }


        // VIEW CART SUBTOTAL (ALL ITEMS PRICES EXCEPT BEFORE TAX TOTAL) - TRUE
        [Fact]
        public void GetCartSubTotal_GetCartSubTotalDbReturnTrue()
        {
            //Arrange
            string expected_result = "True";

            //Act
            // CREATE CART OBJECT
            string Cart_session_id = "79163306-fb23-4ed1-8357-723f01a855a3";

            // CREATE CARTHANDLER OBJECT
            CartHandler carthandler = new CartHandler();
            var cartresults = carthandler.GetCartSubTotal(Cart_session_id);

            bool actual_result = false;
            if (cartresults.Count() > 0)
            {
                actual_result = true;
            }

            // Assert
            Assert.Equal(expected_result.ToString(), actual_result.ToString());
        }

        // VIEW CART SUBTOTAL (ALL ITEMS PRICES EXCEPT BEFORE TAX TOTAL) - FALSE
        [Fact]
        public void GetCartSubTotal_GetCartSubTotalDbReturnFalse()
        {
            //Arrange
            string expected_result = "True";

            //Act
            // CREATE CART OBJECT
            string Cart_session_id = "59163306-fb23-4ed1-8357-723f01a855a3";

            // CREATE CARTHANDLER OBJECT
            CartHandler carthandler = new CartHandler();
            var cartresults = carthandler.GetCartSubTotal(Cart_session_id);

            bool actual_result = false;
            if (cartresults.Count() > 0)
            {
                actual_result = true;
            }

            // Assert
            Assert.Equal(expected_result.ToString(), actual_result.ToString());
        }

        // GET STORE ITEM DETAILS  TRUE
        [Fact]
        public void GetStoreItemDetails_GetStoreItemDetailsDbReturnTrue()
        {
            //Arrange
            string expected_result = "True";

            //Act
            // CREATE CART OBJECT
            int store_id = 0;
            int store_menu_id = 4;

            StoreMenuHandler storemenu = new StoreMenuHandler();
            var store_item_details = storemenu.GetStoreItemDetails(store_id, store_menu_id);

            bool actual_result = false;
            if (store_item_details.Count() > 0)
            {
                actual_result = true;
            }

            // Assert
            Assert.Equal(expected_result.ToString(), actual_result.ToString());
        }

        // GET STORE ITEM DETAILS  FALSE
        [Fact]
        public void GetStoreItemDetails_GetStoreItemDetailsDbReturnFalse()
        {
            //Arrange
            string expected_result = "False";

            //Act
            // CREATE CART OBJECT
            int store_id = 7;
            int store_menu_id = 4;

            StoreMenuHandler storemenu = new StoreMenuHandler();
            var store_item_details = storemenu.GetStoreItemDetails(store_id, store_menu_id);

            bool actual_result = false;
            if (store_item_details.Count() > 0)
            {
                actual_result = true;
            }

            // Assert
            Assert.Equal(expected_result.ToString(), actual_result.ToString());
        }

        // GET STORE MENUS - TRUE
        [Fact]
        public void GetStoreMenu_GetStoreMenuDbReturnTrue()
        {
            //Arrange
            string expected_result = "True";

            //Act
            // CREATE CART OBJECT
            int store_id = 0;
      

            StoreMenuHandler storemenu = new StoreMenuHandler();
            var store_menu = storemenu.GetStoreMenu(store_id);

            bool actual_result = false;
            if (store_menu.Count() > 0)
            {
                actual_result = true;
            }

            // Assert
            Assert.Equal(expected_result.ToString(), actual_result.ToString());
        }
        // GET STORE MENUS - FALSE
        [Fact]
        public void GetStoreMenu_GetStoreMenuDbReturnFalse()
        {
            //Arrange
            string expected_result = "False";

            //Act
            // CREATE CART OBJECT
            int store_id = 7;


            StoreMenuHandler storemenu = new StoreMenuHandler();
            var store_menu = storemenu.GetStoreMenu(store_id);

            bool actual_result = false;
            if (store_menu.Count() > 0)
            {
                actual_result = true;
            }

            // Assert
            Assert.Equal(expected_result.ToString(), actual_result.ToString());
        }
    }
}
