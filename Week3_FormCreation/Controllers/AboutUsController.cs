using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Week3_FormCreation.Models;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Week3_FormCreation.Controllers
{
    public class AboutUsController: Controller
    {

        public IActionResult Index()
        {
            AboutUs aboutUs = new AboutUs
            {
                Title = "Pizza dots",
            Body = "Pizza dots opened its doors with one goal in mind: Better Pizza." +
            " We knew that with best ingredients we would create better pizzas. That goal and the promise of " +
            "best ingredients, better pizza remain true always."
        };
          

            return View(aboutUs);
        }
    }
}
