using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using eZeroOne.Common;
using eZeroOne.Domain;
using eZeroOne.MailService;
using eZeroOne.Service.Common;
using eZeroOne.Service.Property;
using eZeroOne.Service.Repository;
using eZeroOne.Service.Users;
using eZeroOne.eHorakelle.Models;
using PointOfInterest = eZeroOne.eHorakelle.Models.PointOfInterest;

namespace eZeroOne.eHorakelle.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        private readonly IProperties _properties;
        private readonly IUserService _userService;
        private readonly ICommon _common;
        public HomeController(IRepository repository, IUnitOfWork unitOfWork)
        {
            _properties = new Properties(repository, unitOfWork);
            _userService = new UserService(repository, unitOfWork);
            _common = new Service.Common.Common(repository, unitOfWork);
        }
        
        public ActionResult Login()
        {
            ViewBag.UserName = string.Empty;

            return View();
        }

        [HttpGet]
        public ActionResult Prelogin()
        {
            ViewBag.UserName = string.Empty;

            return View();
           //return RedirectToAction("Index", "Home", new { area = "" });
        }

        [HttpPost]
        public ActionResult Prelogin(LoginModel model)
        {
            if (!string.IsNullOrWhiteSpace(model.Email) && model.Email == "navaseelan4u@gmail.com" && !string.IsNullOrWhiteSpace(model.Password) && model.Password == "nava!")
            return RedirectToAction("Index", "Home", new { area = "" });

            return View();
        }

        public ActionResult Index()
        {
            var ip = string.Empty;
            var lat = string.Empty;
            var lon = string.Empty;
            var city = string.Empty;
            
            //IPFunctions.GetIpiInfo(out lat,out lon,out ip,out city);
            //EmailService.SendApprovalEmail("www.google.lk","navaseelan4u@gmail.com","navaseelan",1);
            ViewBag.UserName = string.Empty;

            PreLoadData();
            return View();
        }
        [HttpPost]
        public ActionResult Index(PropertyModel model)
        {
             return RedirectToAction("ChooseDate", "Property", new { area = "" });
            
        }

        public ActionResult Propertydetails()
        {
            return View();
        }

        public ActionResult Newproperties()
        {
            return View();
        }

        public JsonResult GetFileredAccomodationType(int distriictId)
        {

            var properties = _properties.GetHotelsList().ToList().Where(q => q.IsApproved).ToList();
            var acmTypes = _properties.GetAccomodationTypeList();

            var accTypelist = new List<AccommodationType>();

            if (distriictId == 0)
                foreach (var t in acmTypes)
                {
                    if (t.Id != 0)
                    {
                        var count = properties.Count(q => q.AccommodationType == t.Id);
                        var name = t.Name + " (" + count + ")";
                        accTypelist.Add(new AccommodationType
                            {
                                Id = t.Id,
                                Name = name
                            });
                    }
                    else
                    {
                        var name = t.Name;
                        accTypelist.Add(new AccommodationType
                            {
                                Id = t.Id,
                                Name = name
                            });
                    }

                }
            else
            {
                foreach (var t in acmTypes)
                {
                    if (t.Id != 0)
                    {
                        var count = properties.Count(q => q.MainCity == distriictId && q.AccommodationType==t.Id);
                        var name = t.Name + " (" + count + ")";
                        accTypelist.Add(new AccommodationType
                        {
                            Id = t.Id,
                            Name = name
                        });
                    }
                    else
                    {
                        var name = t.Name;
                        accTypelist.Add(new AccommodationType
                        {
                            Id = t.Id,
                            Name = name
                        });
                    }

                }
            }
            ViewBag.AccomodationTypeList = new SelectList(accTypelist, "Id", "Name");

            
            return Json(accTypelist.OrderBy(o => o.Name).ToList(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetFileredAccomodationStandard(int distriictId,int accoType)
        {
            var properties = _properties.GetHotelsList().ToList().Where(q => q.IsApproved).ToList();
            //var acmTypes = _hotelSvc.GetAccomodationTypeList();
            var acmStandards = _properties.GetAccomodationStandardList();
            var acmStandardlist = new List<AccommodationStandard>();

            if (distriictId == 0 && accoType>0)
                foreach (var t in acmStandards)
                {
                    if (t.Id != 0)
                    {
                        var count = properties.Count(q => q.AccommodationType == accoType && q.AccommodationStandard == t.Id);
                        var name = t.Name + " (" + count + ")";
                        acmStandardlist.Add(new AccommodationStandard
                        {
                            Id = t.Id,
                            Name = name
                        });
                    }
                    else
                    {
                        var name = t.Name;
                        acmStandardlist.Add(new AccommodationStandard
                        {
                            Id = t.Id,
                            Name = name
                        });
                    }

                }
            else
            {
                if (accoType > 0)
                foreach (var t in acmStandards)
                {
                    if (t.Id != 0)
                    {
                        var count = properties.Count(q => q.MainCity == distriictId && q.AccommodationType == accoType && q.AccommodationStandard == t.Id);
                        var name = t.Name + " (" + count + ")";
                        acmStandardlist.Add(new AccommodationStandard
                        {
                            Id = t.Id,
                            Name = name
                        });
                    }
                    else
                    {
                        var name = t.Name;
                        acmStandardlist.Add(new AccommodationStandard
                        {
                            Id = t.Id,
                            Name = name
                        });
                    }

                }
                else
                {
                    acmStandardlist = acmStandards.ToList();
                }
            }
            

            return Json(acmStandardlist.OrderBy(o => o.Name).ToList(), JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetFilteredHotelData(HotelSearchModel filter, string poiList, string featureList)
        {
            var result = new List<Property>();

            if (filter.LocationId2 > 0)
                filter.LocationId = filter.LocationId2;

            if (filter.DesignationId2 > 0)
                filter.DesignationId = filter.DesignationId2;


            var query = filter.Location;
            if (!string.IsNullOrWhiteSpace(query))
                query = query.ToLower();

            result = _properties.GetHotelsList().ToList().Where(q => q.IsApproved).ToList();

            if (filter.AccomodationTypeId > 0)
            result = result.Where(q => q.AccommodationType == filter.AccomodationTypeId).ToList();

            if (filter.AccomodationStandardId > 0 )
                result = result.Where(q => q.AccommodationStandard == filter.AccomodationStandardId
                       ).ToList();

            if (!string.IsNullOrWhiteSpace(query))
                result = result.Where(q => (q.Description != null && q.Description.ToLower().Contains(query))
                    || (q.Name!=null && q.Name.ToLower().Contains(query))
                    || (q.Adderss != null && q.Adderss.ToLower().Contains(query))
                    || (q.Street != null && q.Street.ToLower().Contains(query))
                    || (q.City != null && q.City.ToLower().Contains(query))).ToList();
            
            if (filter.LocationId>0)
                result = result.Where(q =>  q.MainCity == filter.LocationId).ToList();
   
            if (filter.No_ofRooms > 0)
                    result = result.Where(q => q.NoOfRooms >= filter.No_ofRooms
                 ).ToList();


            if (filter.PriceTo != 0)
                result = result.Where(q => (q.DisplayPrice >= filter.PriceFrom && q.DisplayPrice <= filter.PriceTo)).ToList();

            var desig = _properties.GetDesignation(filter.DesignationId);
            if (desig != null)
            {
                result = result.Where(q => (q.OwnerDesignation != null && q.OwnerDesignation.Contains(desig.Name))).ToList();
            }
          

            var cityObj = _properties.GetLocationList().Where(x => x.Id == filter.LocationId).FirstOrDefault();

            //use this for load the result partial view
            TempData["FilteredResults"] = result;

            return Json(new { city = cityObj, hotels = result, radius  = filter.Radius == 52 ? 100 : filter.Radius });
        }

        public ActionResult SearchResults(int? page)
        {
            var model = new List<PropertyModel>();
            ViewBag.Records = 0;
            ViewBag.ShowPage = page ?? 1;
           
            if (TempData["FilteredResults"] != null)
            {
                var properties = TempData["FilteredResults"] as IEnumerable<eZeroOne.Domain.Property>;
                if (properties != null && properties.Any())
                {
                    ViewBag.Records = properties.Count();

                    foreach (var p in properties)
                    {
                       var property = new PropertyModel
                           {
                               Id = p.Id,
                               Name = p.Name,
                               Description = p.Description,
                               DisplayPrice = p.DisplayPrice,
                               Discount = p.Discount ?? 0,
                               NoOfRooms = p.NoOfRooms,
                               Squarefeet=(decimal) p.Squarefeet,
                               PropertyUrl = string.Format("/{0}/{1}", "Property", "PropertyDetail?id=" + p.Id),
                               Images = new List<ImageModel>(),
                               Features = new List<Features>(),
                               Places = new List<PlaceModel>(),
                               Meals = new List<DiningModel>(),
                               PoIs = new List<PointOfInterest>(),
                               MobilePrimary = p.MobilePrimary,
                               MobileSecondary = p.MobileSecondary,
                               LandLinePrimary = p.LandLinePrimary,
                               LandLineSecondary = p.LandLineSecondary,
                               ContactPerson2 = p.ContactPerson2,
                               Adderss = p.Adderss,
                               Street = p.Street,
                               City = p.City,
                               FeatureList = p.Features,
                               PoiList = p.Interests,
                               MainCityName = _properties.GetDistrict((int)p.MainCity).City
                           };

                        if (property.FeatureList != null)
                        {
                            var features = property.FeatureList.Split(',').Select(s => s.ToLower()).Take(3).ToArray();
                            property.FeatureList = string.Join(",", features);
                        }
                        
                        var images = _properties.Images(p.Id).FirstOrDefault();
                        property.DefaultImageUrl = "/Content/img/demo/apt/apt1.jpg";
                        if (images!=null)
                        {
                            var path = "/PropertyImages/" + p.Id + "/thumbs/" + images.ImagePath;

                            property.DefaultImageUrl = path;
                        }
                        model.Add(property);
                    }
                   
                    
                }
               
            }

            return PartialView("_SearchResults", model);
        }

        public JsonResult GetLocation(int id)
        {
            var loc = string.Empty;
            var r = _properties.GetLocationList().Where(q => q.Id == id).FirstOrDefault();
            if (r != null)
                loc = r.Description??"Sorry !, No information available right now...";

            return Json(loc, JsonRequestBehavior.AllowGet);

        }

        public JsonResult GetRecommandation(int id)
        {
            var r = _properties.GetRecommandation(id);
            return Json(r, JsonRequestBehavior.AllowGet);

        }

        public ActionResult GetRecentlyAdded()
        {
            var results = _properties.GetHotelsList().ToList().Take(3).ToList();//.Where(q => q.IsApproved && q.ActiveTo != null ).OrderByDescending(o => o.ActiveTo).Take(3).ToList();
            var model = new List<PropertyModel>();
            foreach (var p in results)
            {
                var property = new PropertyModel
                {
                    Id = p.Id,
                    Name = p.Name,
                    Description = p.Description,
                    DisplayPrice = p.DisplayPrice,
                    
                    Discount = p.Discount ?? 0,
                    NoOfRooms = p.NoOfRooms,
                    Squarefeet = (decimal)p.Squarefeet,
                    PropertyUrl = string.Format("/{0}/{1}", "Property", "PropertyDetail?id=" + p.Id),
                    Images = new List<ImageModel>(),
                    Features = new List<Features>(),
                    Places = new List<PlaceModel>(),
                    Meals = new List<DiningModel>(),
                    PoIs = new List<PointOfInterest>(),
                    MobilePrimary = p.MobilePrimary,
                    MobileSecondary = p.MobileSecondary,
                    LandLinePrimary = p.LandLinePrimary,
                    LandLineSecondary = p.LandLineSecondary,
                    ContactPerson2 = p.ContactPerson2,
                    Adderss = p.Adderss,
                    Street = p.Street,
                    City = p.City,
                    FeatureList = p.Features,
                    PoiList = p.Interests,
                    Latitude=(decimal) p.Latitude,
                    Longitude=(decimal) p.Longitude,
                    MainCityName = _properties.GetDistrict((int)p.MainCity).City
                };

                if (property.FeatureList != null)
                {
                    var features = property.FeatureList.Split(',').Select(s => s.ToLower()).Take(3).ToArray();
                    property.FeatureList = string.Join(",", features);
                }

                var images = _properties.Images(p.Id).FirstOrDefault();
                property.DefaultImageUrl = "/Content/img/demo/apt/apt1.jpg";
                if (images != null)
                {
                    var path = "/PropertyImages/" + p.Id + "/thumbs/" + images.ImagePath;

                    property.DefaultImageUrl = path;
                }
                model.Add(property);
            }

            var cityObj = _properties.GetLocationList().Where(x => x.Id == 0).FirstOrDefault();

            return Json(new { city = cityObj, hotels = model, radius = 5 });
        }

        public ActionResult aboutus()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Contactus()
        {
            ViewBag.ContactUs = string.Empty;
            var model = new ContactUs();
            return View(model);
        }
        [HttpPost]
        public ActionResult Contactus(ContactUs model)
        {
            if (ModelState.IsValid)
            {
                var s = new StringBuilder();
                s.Append("<div><p>");
                s.Append("Dear sir,<br/>");
                s.Append("Name : ");
                s.Append(model.FirstName);
                s.Append("E-mail : ");
                s.Append(model.Email);
                s.Append("<br/>");
                s.Append("</p>");
                s.Append("<p>");
                s.Append("Comments : ");
                s.Append(model.Comments);
                s.Append("<br/>");
                s.Append("</p></div>");

                EmailService.ContactUs("mungoterrain@mac.com", s.ToString());
               
                ViewBag.ContactUs = "We will respond you as soon possible";
            }

            //return View();
            return RedirectToAction("Index");
        }

        public IEnumerable<ReviewModel> GetReviewComments()
        {
            var comments = new List<ReviewModel>();
            var path = "/Content/img/demo/apt/apt1.jpg";
            var results = _properties.GetReviewComments().Take(4);
            foreach (var visitorReview in results)
            {
                var user = _userService.GetUser(visitorReview.VisitorId);
                if (user != null)
                {
                    var s = _properties.Images(visitorReview.PropertyId).FirstOrDefault();
                    if (s != null && !string.IsNullOrWhiteSpace(s.ImagePath))
                        path = "/PropertyImages/" + visitorReview.PropertyId + "/thumbs/" + s.ImagePath;

                    var r = new ReviewModel
                    {
                        Id = visitorReview.Id,
                        Name = string.Format("{0} {1}", user.FirstName, user.LastName),
                        Email = user.Email,
                        Comment = visitorReview.Comments,
                        ImageUrl = path
                       
                    };
                    comments.Add(r);
                }

            }
            return comments;
        }

        public ActionResult Rooms()
        {
            PreLoadData();
            var model = LoadRooms();

            return View(model);
        }

        public ActionResult RoomDetail(int id)
        {
            var p = _properties.GetRoom(id);
            var estate = _properties.GetHotelsList().FirstOrDefault();

            var property = new PropertyModel
            {
                Id = p.Id,
                Name = p.Name,
                Description = p.Description,
                DisplayPrice = p.DisplayPrice,
                Occupancy = p.Occupancy,
                Squarefeet = (decimal)p.Squarefeet,
                PropertyUrl = string.Format("/{0}/{1}", "Home", "RoomDetail?id=" + p.Id),
                Images = new List<ImageModel>(),
                BedModels=new List<BedModel>(),
                Activities=new List<ActivityModel>(),
                Meals=new List<DiningModel>()
            };

            var images = p.RoomImages.AsEnumerable();
            property.DefaultImageUrl = "/Content/img/demo/apt/apt1.jpg";
            foreach (var i in images)
            {
                property.Images.Add(new ImageModel
                {
                    Id = i.Id,
                    ImagePath = "/RoomImages/" + p.Id + "/thumbs/" + i.ImagePath,
                    ImageDescription = i.ImageDescription,
                    PropertyId =i.RoomId,
                    DefaultImage = (bool)i.DefaultImage
                });

            }
            var beds = p.BedRooms;
            foreach (var b in beds)
            {
                var d = _properties.GetBed(b.BedId);
                var bed = new BedModel
                {
                    Id = b.Id,
                    BedName = d.BedName,
                    Occupancy = d.Occupancy,
                    ChildOccupancy = d.ChildOccupancy,
                    Rate = d.Rate,

                };
                property.BedModels.Add(bed);
            }

            var defaultRate = property.BedModels.OrderBy(o => o.Rate).FirstOrDefault();
            if (defaultRate != null)
            {
                property.DisplayPrice = defaultRate.Rate;
                property.Occupancy = defaultRate.Occupancy;
                property.ChildOccupancy = defaultRate.ChildOccupancy;
            }

            if (images.Any())
            {
                var path = "/RoomImages/" + p.Id + "/thumbs/" + images.FirstOrDefault().ImagePath;
                property.DefaultImageUrl = path;
            }

            if (estate != null)
            {
                foreach (var a in estate.Activities)
                {
                    var act = new ActivityModel
                        {
                            Id =a.Id,
                            Name = a.Name,
                            Description = a.Description,
                            PropertyId = a.PropertyId,
                            Rate = a.Rate,
                            ChildRate =a.ChildRate
                        };
                    property.Activities.Add(act);
                }

                var cuisines = _properties.GetCuisines().OrderBy(q => q.DisplayOrder);
                foreach (var cuisine in cuisines)
                {
                    var _meals = estate.Dinings.Where(q => q.FoodId == cuisine.Id).ToList();
                    if (_meals.Any())
                    {
                        var mealMod = new DiningModel
                        {
                            Meals = new List<DiningModel>(),
                            MealType = cuisine.FoodType,
                            FoodId = cuisine.Id,
                            //Imagepath = !string.IsNullOrWhiteSpace(cuisine.ImageName) ? "/PropertyImages/DiningImages/" + cuisine.Id + "/" + cuisine.ImageName : "/Content/img/dining.jpg"
                        };
                        foreach (var m in _meals)
                        {
                            var meal = new DiningModel
                            {
                                Id = m.Id,
                                PropertyId = m.PropertyId,
                                MealType = m.MealType,
                                Food = cuisine.FoodType,
                                Price = m.Price,

                            };
                            mealMod.Meals.Add(meal);
                        }

                        property.Meals.Add(mealMod);
                    }
                }
               
            }

            var transports = _properties.GetTransports();
            var transModel = new List<TransportModel>();
            foreach (var t in transports)
            {
                var trans = new TransportModel
                {
                    Id = t.Id,
                    Name = t.Name,
                    Rate = t.Rate
                };

                transModel.Add(trans);

            }
            ViewBag.Transports = transModel;

            return View(property);
        }

        private void PreLoadData()
        {
            var propertyId = 0;
            ViewBag.PropetyDescription= "";
            var results = _properties.GetHotelsList().ToList().Take(1).ToList();
            var model = new List<PropertyModel>();
            foreach (var p in results)
            {
                propertyId = p.Id;
                ViewBag.PropetyDescription = p.Description;

                var property = new PropertyModel
                {
                    Id = p.Id,
                    Name = p.Name,
                    Description = p.Description,
                    DisplayPrice = p.DisplayPrice,
                    Discount = p.Discount ?? 0,
                    NoOfRooms = p.NoOfRooms,
                    Squarefeet = (decimal)p.Squarefeet,
                    PropertyUrl = string.Format("/{0}/{1}", "Property", "PropertyDetail?id=" + p.Id),
                    Images = new List<ImageModel>(),
                    Features = new List<Features>(),
                    Meals = new List<DiningModel>(),
                    BedModels=new List<BedModel>(),
                    MobilePrimary = p.MobilePrimary,
                    MobileSecondary = p.MobileSecondary,
                    LandLinePrimary = p.LandLinePrimary,
                    LandLineSecondary = p.LandLineSecondary,

                    Adderss = p.Adderss,
                    Street = p.Street,
                    City = p.City,
                    Latitude=(decimal) p.Latitude,
                    Longitude=(decimal) p.Longitude,
                };

                var features = new List<Features>();
                var feature = _properties.GetPropertyDetail(propertyId);
                if (feature != null)
                {
                    var f = feature.Features;
                    if (!string.IsNullOrWhiteSpace(f))
                    {
                        var flists = f.Split(',');
                        foreach (var r in flists.ToList())
                        {
                            var fea = new Features { Name = r.ToString(), IsChecked = false };
                            features.Add(fea);

                        }
                    }
                }

                ViewBag.FeatureList = features.OrderBy(o => o.Name).ToList();

                ViewBag.Rooms = _properties.GetRooms().ToList().Where(q => q.IsActive).ToList();


                var images = _properties.Images(p.Id).FirstOrDefault();
                property.DefaultImageUrl = "/Content/img/demo/apt/apt1.jpg";
                if (images != null)
                {
                    var path = "/PropertyImages/" + p.Id + "/thumbs/" + images.ImagePath;

                    property.DefaultImageUrl = path;
                }
                model.Add(property);
            }

            ViewBag.Property = model.FirstOrDefault();

            ViewBag.YoutubeUrls = "www.youtube.com";

            var firstOrDefault = _properties.GetYoutubeUrls().FirstOrDefault();
            if (firstOrDefault != null)
                ViewBag.YoutubeUrls = firstOrDefault.Url;


            ViewBag.SliderImages = _properties.GetSliderImages().OrderBy(o => o.DisplayOrder).ToList();

            ViewBag.Testimonials = _properties.GetRecommandations().OrderBy(o => o.Name).ToList();

            ViewBag.ReviewComments = GetReviewComments();

            
        }

        private List<PropertyModel> LoadRooms()
        {
            var results = _properties.GetRooms().Where(q => q.IsActive && q.BedRooms.Count>0 ).ToList();
           
            var model = new List<PropertyModel>();
            foreach (var p in results)
            {
                var property = new PropertyModel
                {
                    Id = p.Id,
                    Name = p.Name,
                    Description = p.Description,
                    DisplayPrice = p.DisplayPrice,
                    Occupancy = p.Occupancy,
                    Squarefeet = (decimal)p.Squarefeet,
                    PropertyUrl = string.Format("/{0}/{1}", "Home", "RoomDetail?id=" + p.Id),
                    Images = new List<ImageModel>(),
                    BedModels=new List<BedModel>()

                };

                var beds = p.BedRooms;
                foreach (var b in beds)
                {
                    var d = _properties.GetBed(b.BedId);
                    var bed = new BedModel
                        {
                            Id=b.Id,
                            BedName =d.BedName,
                            Occupancy=d.Occupancy,
                            ChildOccupancy=d.ChildOccupancy,
                            Rate=d.Rate,

                        };
                    property.BedModels.Add(bed);
                }

                var defaultRate = property.BedModels.OrderBy(o => o.Rate).FirstOrDefault();
                if (defaultRate != null)
                {
                    property.DisplayPrice = defaultRate.Rate;
                    property.Occupancy = defaultRate.Occupancy;
                    property.ChildOccupancy = defaultRate.ChildOccupancy;
                }

                var images = p.RoomImages.FirstOrDefault();
                property.DefaultImageUrl = "/Content/img/demo/apt/apt1.jpg";
                if (images != null)
                {
                    var path = "/RoomImages/" + p.Id + "/thumbs/" + images.ImagePath;

                    property.DefaultImageUrl = path;
                }
                model.Add(property);
            }

            return model;

        }

        public PartialViewResult UserLogonInfo()
        {
            var userModel = new LoginUserDetails { UserName = string.Empty };
            if (User.Identity.IsAuthenticated)
            {
                var userEmail = User.Identity.Name;
                var user = _userService.GetUser(userEmail, 1);
                if (user != null)
                    userModel.UserName = string.Format("{0} {1}", user.FirstName.ToUpper(), user.LastName.ToUpper());

            }
            return PartialView(userModel);
        }

        public ActionResult Terms()
        {
            return View();
        }
        public ActionResult SensorData()
        {
            var data=_common.GetGpsData();
            return View(data);
        }

    }
}
