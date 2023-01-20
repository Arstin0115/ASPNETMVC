using prjMvcDemo.Models;
using prjMvcDemo.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace prjMvcDemo.Controllers
{
    public class CommonController : Controller
    {
        // GET: Common
        public ActionResult Home()
        {
            if (Session[CDictionary.SK_LOINGED_USER] == null)
                return RedirectToAction("Login");

            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(CLoginViewModel vm)
        {
            CCustomer User = (new CCustomerFactory().queryByEmail(vm.txtAccount));
            if (User != null)
            {
                if (User.fPassword.Equals(vm.txtPassword))
                {
                    Session[CDictionary.SK_LOINGED_USER] = User;
                    return RedirectToAction("Home");
                }
            }
            return View();
        }
    }
}