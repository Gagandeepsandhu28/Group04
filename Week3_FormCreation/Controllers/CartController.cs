using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
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
                Guid guid = new Guid();
                // CREATE GUID & SESSION VARIABLE - CART SESSION ID.

                HttpContext.Session.SetString("CartSessionId", guid.ToString());
              

            }

            // GET THE ITEM DETAILS FROM DB FOR THE CART
            StoreMenuHandler handler = new StoreMenuHandler();
            var storeitemdetails = handler.GetStoreItemDetails(int.Parse(StoreId),int.Parse(MenuId));

            // CHECK WHETHER THAT ITEM EXISTS IN CART THEN UPDATE ONLY QUANTITY.
            CartHandler chkcartitemexists = new CartHandler();
            var alreadyitemexistincart = chkcartitemexists.GetIteminCart(HttpContext.Session.GetString("CartSessionId").ToString(), int.Parse(StoreId), int.Parse(MenuId));
            if(alreadyitemexistincart.Count()>0)
            {
                // UPDATE THE ITEM QTY IN CART AT THE CART_ID FIELD
            }
            else
            {
                // INSERT THE ITEM IN THE CART

            }
            
            return View(storeitemdetails);
            
        }

    }
}