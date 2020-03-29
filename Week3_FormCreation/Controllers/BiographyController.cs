using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Week3_FormCreation.Models;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Week3_FormCreation.Controllers
{
    public class BiographyController : Controller
    {
        // GET: /<controller>/
        public IActionResult Index()
        {
            return View();
        }

        // Gagan - Biography
        public IActionResult Gagan()
        {
            Biography bio = new Biography();
            bio.BioTitle = "Biography: Gagan";
            bio.BioBody = "<p>I am wife and mother of two kids and student at Conestoga college doing Software Quality Assurance and Test Engineering course. I left my studies few years before and did some jobs along with taking care of my kids. When they started going school then I thought I should study and got enrolled in software testing course. I am also a good homemaker, I love to cook, listening to music, shop and exploring the new places with my family. My nickname is <strong>Ginny</strong>.</p> <p> I am resident of Kitchener. I am basically from India and I love to visit India with my family during vacations. My kids have born here but they like to go there and enjoy Indian culture, meeting relatives, spending time with grandparents.</p>";
            return View(bio);
        }

        // Pramod - Biography
        public IActionResult Pramod()
        {
            Biography bio = new Biography();
            bio.BioTitle = "Biography: Pramod";
            bio.BioBody = "<p>I am student at Conestoga College and working part time at Tim Hortons as a counter staff member and baker I have done Bachelors in Computer Science and also completed Post Graduation in Network Architecture and security Analytics from Sault College ON Canada.</p>";
            return View(bio);            
        }

        // Sibtain - Biography
        public IActionResult Sibtain()
        {
            Biography bio = new Biography();
            bio.BioTitle = "Biography: Sibtain";
            bio.BioBody = "<p>I am student at Conestoga College and working part time at Christie Digital as a cleaning staff member as I have done Master&rsquo;s Degree in Computer Application and also completed Post Graduation in Project Management and currently pursing Software Quality Assurance from Conestoga College, ON Canada.</p>";
            return View(bio);
            
        }
    }
}
