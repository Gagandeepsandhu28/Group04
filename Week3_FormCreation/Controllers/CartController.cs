using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DataModels;
using Library.BusinessLogic;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Week3_FormCreation.Controllers
{
    public class CartController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public IActionResult Add(String MenuId, String StoreId)
        {
            // CHECK CART SESSIONID VARIABLE.
            var var_chk_session = HttpContext.Session.GetString("CartSessionId");
            if (var_chk_session is null)
            {
                // IF NULL THEN CREATE NEW GUID & ASSIGN THE SESSION
                Guid guid = Guid.NewGuid();
                // CREATE GUID & SESSION VARIABLE - CART SESSION ID.

                HttpContext.Session.SetString("CartSessionId", guid.ToString());
              

            }

            // GET THE ITEM DETAILS FROM DB FOR THE CART
            StoreMenuHandler handler = new StoreMenuHandler();
            var storeitemdetails = handler.GetStoreItemDetails(int.Parse(StoreId),int.Parse(MenuId));

            // CHECK WHETHER THAT ITEM EXISTS IN CART THEN UPDATE ONLY QUANTITY.
            CartHandler chkcartitemexists = new CartHandler();
            var alreadyitemexistincart = chkcartitemexists.GetIteminCart(HttpContext.Session.GetString("CartSessionId").ToString(), int.Parse(StoreId), int.Parse(MenuId));
            // ITEM EXISTS IN CART
            if(alreadyitemexistincart.Count()>0)
            {
                // UPDATE THE ITEM QTY IN CART AT THE CART_ID FIELD
                CartHandler cart_item_upd = new CartHandler();
                // INCREMENT QTY BY 1 ++
                alreadyitemexistincart[0].Cart_qty = alreadyitemexistincart[0].Cart_qty +1;
                alreadyitemexistincart[0].Cart_menu_price = alreadyitemexistincart[0].Cart_qty*alreadyitemexistincart[0].Cart_menu_price;
                var cartitemupd = cart_item_upd.UpdateCartItemQty(alreadyitemexistincart[0]);

            }
            else
            {
                // INSERT THE ITEM IN THE CART
                CartHandler cartinsertitem = new CartHandler();
                Cart crtitm = new Cart();
                crtitm.Cart_session_id = HttpContext.Session.GetString("CartSessionId").ToString();
                crtitm.Cart_menu = storeitemdetails[0].Pizza_Menu;
                crtitm.Cart_menu_id = storeitemdetails[0].Pizza_Menu_Id;
                crtitm.Cart_menu_price = storeitemdetails[0].Pizza_Menu_Price;
                crtitm.Cart_qty = 1;
                crtitm.Cart_store_id = storeitemdetails[0].Pizza_Store_Id;
                var cartitmins = cartinsertitem.InsertCartItem(crtitm);

            }
            
            return View(storeitemdetails);            
        }

        public IActionResult ViewCart(String MenuId, String StoreId)
        {
            // CHECK CART SESSIONID VARIABLE.
            var var_chk_session = HttpContext.Session.GetString("CartSessionId");
            if (var_chk_session is null)
            {
                return View();
            }

            // GET THE ITEM DETAILS FROM DB FOR THE CART
           CartHandler handler = new CartHandler();
           var getallitemsincart = handler.ViewCartItems(HttpContext.Session.GetString("CartSessionId").ToString());
            // GET TOTAL OF CART ITEMS
            var getcarttotal = handler.GetCartSubTotal(HttpContext.Session.GetString("CartSessionId").ToString());
            // SET TOTAL IN [getallitemsincart] object for VIEW
            foreach (var item in getallitemsincart)
            {
                item.Cart_Total = getcarttotal[0].Cart_Sub_Total + (getcarttotal[0].Cart_Sub_Total * 13)/100;
                item.Cart_Sub_Total = getcarttotal[0].Cart_Sub_Total;
                item.Cart_Total_Tax = (getcarttotal[0].Cart_Sub_Total * 13) / 100;
            }
           return View(getallitemsincart);
        }

        public IActionResult EmptyCart()
        {
            // CHECK CART SESSIONID VARIABLE.
            var var_chk_session = HttpContext.Session.GetString("CartSessionId");
            if (var_chk_session is null)
            {
                return View();
            }

            // GET THE ITEM DETAILS FROM DB FOR THE CART
            CartHandler handler = new CartHandler();
            var emptycart = handler.EmptyCart(HttpContext.Session.GetString("CartSessionId").ToString());
            
            return View();
        }
    }

}