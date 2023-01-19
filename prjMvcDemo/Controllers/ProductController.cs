using prjMvcDemo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace prjMvcDemo.Controllers
{
    public class ProductController : Controller
    {
        [HttpPost]
        public ActionResult Edit(tProduct p)
        {            
            dbDemoEntities db = new dbDemoEntities();
            tProduct x = db.tProduct.FirstOrDefault(t => t.fId == p.fId);
            if (x != null)
            {
                if (p.photo != null)
                {
                    string photoName=Guid.NewGuid().ToString()+".jpg";
                    x.fImagePath = photoName;
                    p.photo.SaveAs(Server.MapPath(@"..\..\Images\"+photoName));
                }
                x.fName = p.fName;
                x.fCost = p.fCost;
                x.fPrice = p.fPrice;
                x.fQty = p.fQty;
                db.SaveChangesAsync();
            }
            return RedirectToAction("List");
        }

        public ActionResult Edit(int? id)
        {
            if (id != null)
            {
                dbDemoEntities db = new dbDemoEntities();
                tProduct x = db.tProduct.FirstOrDefault(t => t.fId == id);
                if (x != null)
                    return View(x);
            }
            return RedirectToAction("List");
        }

        public ActionResult Delete(int? id)
        {
            if (id != null)
            {
                dbDemoEntities db = new dbDemoEntities();
                tProduct delProduct = db.tProduct.FirstOrDefault(t => t.fId == id);
                if (delProduct != null)
                {
                    db.tProduct.Remove(delProduct);
                    db.SaveChangesAsync();
                }
            }
            return RedirectToAction("List");
        }
        public ActionResult List()
        {
            IEnumerable<tProduct> datas = null;
            string keyword = Request.Form["txtKeyword"];
            dbDemoEntities db = new dbDemoEntities();
            if (string.IsNullOrEmpty(keyword))
                datas = from t in db.tProduct
                        select t;
            else
                datas = db.tProduct.Where(t => t.fName.Contains(keyword));

            return View(datas);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(tProduct p)
        {
            dbDemoEntities db = new dbDemoEntities();
            db.tProduct.Add(p);
            db.SaveChanges();
            return RedirectToAction("List");
        }
    }
}