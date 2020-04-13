using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Library.BusinessLogic;
using Microsoft.AspNetCore.Mvc;

namespace Week3_FormCreation.Controllers
{
    public class StoreMenuController : Controller
    {
        [HttpGet]
        public IActionResult Index(String StoreId)
        {
            StoreMenuHandler handler = new StoreMenuHandler();
            var storemenu = handler.GetStoreMenu(int.Parse(StoreId));
            return View(storemenu);           
        }
        

    }
}