

using SiteInProgress;
using SiteInProgress.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace SiteInProgress.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        public ActionResult Index(string searchString)
        {
            return RedirectToAction("List");
        }

        public ActionResult List()
        {
            using (Entities database = new Entities())
            {
                var categories = database.Categories.ToList();

                return View(categories);
            }
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Category category)
        {
            if (ModelState.IsValid)
            {
                using (Entities database = new Entities())
                {
                    category.CategoryCount = 0;
                    database.Categories.Add(category);
                    database.SaveChanges();

                    return RedirectToAction("Index");
                }
            }

            return View(category);
        }

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            using (Entities database = new Entities())
            {
                var category = database.Categories.FirstOrDefault(c => c.Id == id);
                if (category == null)
                {
                    return HttpNotFound();
                }

                return View(category);
            }
        }

        [HttpPost]
        public ActionResult Edit(Category category)
        {
            if (ModelState.IsValid)
            {
                using (Entities database = new Entities())
                {
                    database.Entry(category).State = EntityState.Modified;
                    database.SaveChanges();

                    return RedirectToAction("Index");
                }
            }

            return View(category);
        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            using (Entities database = new Entities())
            {
                var category = database.Categories.FirstOrDefault(c => c.Id == id);
                if (category == null)
                {
                    return HttpNotFound();
                }

                return View(category);
            }
        }

        [HttpPost]
        [ActionName("Delete")]
        public ActionResult DeleteConfirmed(int? id)
        {
            using (var database = new Entities())
            {
                var category = database.Categories.FirstOrDefault(c => c.Id == id);
                //....

                //foreach (var ... in collection)
                //{
                //
                //}

                database.Categories.Remove(category);
                database.SaveChanges();

                return RedirectToAction("Index");
            }
        }
    }
}
