﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using eZeroOne.Common;
using eZeroOne.Domain;
using eZeroOne.MailService;
using eZeroOne.Service.Property;
using eZeroOne.Service.Repository;
using eZeroOne.Service.Users;
using eZeroOne.eHorakelle.Models;
using PointOfInterest = eZeroOne.Domain.PointOfInterest;

namespace eZeroOne.eHorakelle.Areas.Clients.Controllers
{
    [Authorize(Roles = RoleNames.Client)]
    public class ClientPropertyController : Controller
    {
        //
        // GET: /Clients/Clients/
         private readonly IHotelService _hotelSvc;
        private readonly IUserService _userService;
        //
        // GET: /Property/
        public ClientPropertyController(IRepository repository, IUnitOfWork unitOfWork)
        {
            _hotelSvc = new HotelService(repository, unitOfWork);
            _userService = new UserService(repository, unitOfWork);
        }


        [HttpGet]
        public ActionResult AddProperty(int? id)
        {
            var clientId = 0;
            if (User.Identity.IsAuthenticated)
            {
                var userEmail = User.Identity.Name;
                var user = _userService.GetUser(userEmail, 1);
                if (user != null)
                    clientId = user.UserId;
            }

            var property = new PropertyModel();
            PreLoadData();
            if (id != null)
            {
                var model = _hotelSvc.GetProperty((int)id);

                if (model != null)
                {
                    property.Id = model.Id;
                    property.Name = model.Name;
                    property.Description = model.Description;
                    property.MainCity = (int)model.MainCity;
                    property.Location = model.Location;
                    property.AccomodationTypeId = model.AccommodationType;
                    property.AccomodationStandardId = model.AccommodationStandard;
                    property.NoOfRooms = model.NoOfRooms;
                    property.DisplayPrice = model.DisplayPrice;
                    property.Squarefeet = (decimal)model.Squarefeet;
                    property.Latitude = (decimal)model.Latitude;
                    property.Longitude = (decimal)model.Longitude;
                    property.Adderss = model.Adderss;
                    property.Street = model.Street;
                    property.City = model.City;
                    property.ContactPerson1 = model.ContactPerson1;
                    property.LandLinePrimary = model.LandLinePrimary;
                    property.MobilePrimary = model.MobilePrimary;
                    //property.Designation = ;
                    property.Email = model.Email;
                    property.VideoUrl = model.VideoUrl;
                    property.Website = model.Website;
                    property.IsActive = true;
                    property.ActiveFrom = (DateTime)model.ActiveFrom;

                    property.CompanyId = 1;//default value is 1
                    property.ImageName = model.ImageName;
                    property.ClientId = clientId;
                    property.AboutOwner = model.AboutOwner;
                }

            }

            return View(property);
        }

        [HttpPost]
        public ActionResult AddProperty(PropertyModel model, HttpPostedFileBase[] file)
        {
            if (ModelState.IsValid)
            {
                var userId = model.ClientId;
                if (User.Identity.IsAuthenticated)
                {
                    var userEmail = User.Identity.Name;
                    var user = _userService.GetUser(userEmail, 1);
                    if (user != null)
                        userId = user.UserId;

                }

                var p = new eZeroOne.Domain.Property
                {
                    Name = model.Name,
                    Description = model.Description,
                    MainCity = model.MainCity,
                    Location = model.Location,
                    AccommodationType = model.AccomodationTypeId,
                    AccommodationStandard = model.AccomodationStandardId,
                    NoOfRooms = model.NoOfRooms,
                    DisplayPrice = model.DisplayPrice,
                    Squarefeet = model.Squarefeet,
                    Latitude = model.Latitude,
                    Longitude = model.Longitude,
                    Adderss = model.Adderss,
                    Street = model.Street,
                    City = model.City,
                    ContactPerson1 = model.ContactPerson1,
                    LandLinePrimary = model.LandLinePrimary,
                    MobilePrimary = model.MobilePrimary,
                    OwnerDesignation = _hotelSvc.DesignationName(model.Designation),
                    Email = model.Email,
                    VideoUrl = model.VideoUrl,
                    Website = model.Website,
                    IsActive = false,
                    IsApproved = false,
                    IsPosted = true,
                    ActiveFrom = DateTime.UtcNow,
                    CompanyId = 1,
                    ClientId = userId,
                    //ImageName = file != null ? file[0].FileName : model.ImageName,
                    //MealImage = file != null ? file[1].FileName : model.MealImage,
                    AboutOwner = model.AboutOwner,
                    //PoliceReport = file != null ? file[2].FileName : model.PoliceReport,
                    //GSReport = file != null ? file[3].FileName : model.GSReport,
                };

                p.ImageName = file != null ? file[0] != null ? file[0].FileName : model.ImageName : "";
                p.MealImage = file != null ? file[1] != null ? file[1].FileName : model.MealImage : "";
                p.PoliceReport = file != null ? file[2] != null ? file[2].FileName : model.PoliceReport : "";
                p.GSReport = file != null ? file[3] != null ? file[3].FileName : model.GSReport : "";

                if (model.Id == 0)
                {
                    _hotelSvc.SaveProperty(p);
                    p.Id = p.Id;
                }
                else
                {
                    p.Id = model.Id;
                    _hotelSvc.UpdateProperty(p);
                }
                //adding photos
                if (file != null && file[0] != null && file[0].ContentLength > 0)
                {
                    string pic = System.IO.Path.GetFileName(file[0].FileName);

                    var photoPath = "/PropertyImages/" + p.Id + "/thumbs/contact/";

                    string path = System.IO.Path.Combine(Server.MapPath(photoPath), pic);

                    bool isExists = System.IO.Directory.Exists(Server.MapPath(photoPath));
                    if (!isExists)
                        System.IO.Directory.CreateDirectory(Server.MapPath(photoPath));

                    // file is uploaded
                    file[0].SaveAs(path);


                }

                //adding photos
                if (file != null && file[1] != null && file[1].ContentLength > 0)
                {
                    string pic = System.IO.Path.GetFileName(file[1].FileName);

                    var photoPath = "/PropertyImages/MealImages/" + p.Id + "/";

                    string path = System.IO.Path.Combine(Server.MapPath(photoPath), pic);

                    bool isExists = System.IO.Directory.Exists(Server.MapPath(photoPath));
                    if (!isExists)
                        System.IO.Directory.CreateDirectory(Server.MapPath(photoPath));

                    // file is uploaded
                    file[1].SaveAs(path);

                }

                //adding police report
                if (file != null && file[2] != null && file[2].ContentLength > 0)
                {
                    string rptname = System.IO.Path.GetFileName(file[2].FileName);

                    var pReport = "/PropertyImages/PoliceReport/" + p.Id + "/";

                    string path = System.IO.Path.Combine(Server.MapPath(pReport), rptname);

                    bool isExists = System.IO.Directory.Exists(Server.MapPath(pReport));
                    if (!isExists)
                        System.IO.Directory.CreateDirectory(Server.MapPath(pReport));

                    // file is uploaded
                    file[2].SaveAs(path);


                }

                //adding GS report
                if (file != null && file[3] != null && file[3].ContentLength > 0)
                {
                    string rptname = System.IO.Path.GetFileName(file[3].FileName);

                    var pReport = "/PropertyImages/GSReport/" + p.Id + "/";

                    string path = System.IO.Path.Combine(Server.MapPath(pReport), rptname);

                    bool isExists = System.IO.Directory.Exists(Server.MapPath(pReport));
                    if (!isExists)
                        System.IO.Directory.CreateDirectory(Server.MapPath(pReport));

                    // file is uploaded
                    file[3].SaveAs(path);


                }
                return RedirectToAction("PropertyList");
            }
            PreLoadData();
            return View(model);
        }

        public ActionResult PropertyList()
        {
            var model = new List<PropertyModel>();
            var userId = 0;
            if (User.Identity.IsAuthenticated)
            {
                var userEmail = User.Identity.Name;
                var user = _userService.GetUser(userEmail, 1);
                if (user != null)
                    userId = user.UserId;

            }

            var results = _hotelSvc.GetHotelsList().Where(q => q.ClientId == userId).ToArray();
            foreach (var p in results)
            {
                model.Add(item: new PropertyModel
                {
                    Id = p.Id,
                    Name = p.Name,
                    ContactPerson1 = p.ContactPerson1,
                    Adderss=p.Adderss,
                    Street=p.Street,
                    City=p.City,
                    Email = "",
                    IsActive = (bool)p.IsActive,
                    AddedBy = _userService.GetUser((int)p.ClientId) == null ? "Admin" : _userService.GetUser((int)p.ClientId).RoleId == 1 ? "Admin" : "Client",
                });
            }
            return View(model);
        }
        [HttpGet]
        public ActionResult AddImages(int id)
        {
            ViewBag.Property = PropertyName(id);
            var model = new ImageViewModel { ImageList = new List<ImageModel>() };
            var results = _hotelSvc.Images(id);
            foreach (var p in results)
            {
                model.ImageList.Add(new ImageModel
                {
                    Id = p.Id,
                    ImagePath = p.ImagePath,
                    ImageDescription = p.ImageDescription,
                    PropertyId = p.PropertyId,
                    DefaultImage = (bool)p.DefaultImage
                });

            }
            model.Id = id;
            return View(model);
        }
        [HttpPost]
        public ActionResult UploadImage(ImageViewModel model, HttpPostedFileBase file)
        {
            if (file == null)
            {
                return RedirectToAction("AddImages", new { id = model.Id });
            }
            if (file.ContentLength > 0)
            {
                try
                {
                    // var path = Path.Combine(Server.MapPath("~/Content/ItemImages"), fileName);
                    var fileName = Path.GetFileName(file.FileName);
                    var pathThump = "/PropertyImages/" + model.Id + "/thumbs";
                    var pathFull = "/PropertyImages/" + model.Id + "/large";

                    var path = Path.Combine(Server.MapPath("~/PropertyImages/" + model.Id + "/thumbs"), fileName);

                    //large&thumps images
                    bool isExists = System.IO.Directory.Exists(Server.MapPath("~/PropertyImages/" + model.Id + "/thumbs"));
                    if (!isExists)
                        System.IO.Directory.CreateDirectory(Server.MapPath("~/PropertyImages/" + model.Id + "/thumbs"));

                    file.SaveAs(path);


                    _hotelSvc.AddIImage(model.Id, fileName, model.ImageDescription, model.DefaultImage);
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }

            }

            return RedirectToAction("AddImages", new { id = model.Id });
        }
        public ActionResult AddPoI(int id)
        {
            ViewBag.Property = PropertyName(id);
            var poiList = _hotelSvc.GetPointOfInterestList().ToList();
            var pl = poiList.Select(item => new Models.PointOfInterest { Id = item.Id, Name = item.Name, IsChecked = false }).ToList();
            // ViewBag.POTList = new SelectList(poiList, "Id", "Name");
            var poi = new List<Models.PointOfInterest>();
            var feature = _hotelSvc.GetPropertyDetail(id);
            if (feature != null)
            {
                var f = feature.Interests;
                if (f != null)
                {
                    var flists = f.Split(',');
                    foreach (var r in flists.Select(flist => pl.FirstOrDefault(q => q.Name.ToLower() == flist)).Where(r => r != null))
                    {
                        r.IsChecked = true;
                        poi.Add(r);

                    }
                }

            }
            pl = pl.Except(poi).ToList();
            pl.AddRange(poi);

            ViewBag.PropertyId = id;

            ViewBag.POTList = pl.OrderBy(o => o.Name).ToList();

            return View();
        }

        public ActionResult SavePois(string poiList, int propertyId)
        {
            _hotelSvc.UpdatePois(propertyId, poiList);

            return RedirectToAction("AddPoI", new { id = propertyId });
        }

        public ActionResult AddFeatures(int id)
        {
            var featureList = _hotelSvc.GetFeatureList().ToList();
            var fl = featureList.Select(item => new Features { Id = item.Id, Name = item.Name, IsChecked = false, GroupId = item.GroupId }).ToList();

            var pF = new List<Features>();
            var feature = _hotelSvc.GetPropertyDetail(id);
            if (feature != null)
            {
                var f = feature.Features;
                if (!string.IsNullOrWhiteSpace(f))
                {
                    var flists = f.Split(',');
                    foreach (var r in flists.Select(flist => fl.FirstOrDefault(q => q.Name.ToLower() == flist)).Where(r => r != null))
                    {
                        r.IsChecked = true;
                        pF.Add(r);

                    }
                }
            }
            fl = fl.Except(pF).ToList();
            fl.AddRange(pF);

            ViewBag.PropertyId = id;
            ViewBag.FeatureList = fl.OrderBy(o => o.Name).ToList();


            //FeatureGroup
            var featureGroup = new List<FeatureGroup>();
            var groups = _hotelSvc.FeatureCategories().OrderBy(o => o.Name).ToList();
            foreach (var featureCategory in groups)
            {
                var feaList = new FeatureGroup
                {
                    Features = new List<Features>(),
                    Id = featureCategory.Id,
                    GroupName = featureCategory.Name
                };

                var _features = new List<Features>();
                foreach (var fea in fl.Where(q => q.GroupId == featureCategory.Id))
                {
                    _features.Add(new Features
                    {
                        Id = fea.Id,
                        Name = fea.Name,
                        IsChecked = fea.IsChecked,
                        GroupId = fea.GroupId
                    });
                }

                feaList.Features = _features;
                featureGroup.Add(feaList);
            }

            ViewBag.Property = PropertyName(id);

            ViewBag.FeatureGroup = featureGroup;
            ViewBag.FeatureList = fl;

            return View();
        }

        public ActionResult SaveFeatures(string featureList, int propertyId)
        {
            _hotelSvc.UpdateFeatures(propertyId, featureList);

            return RedirectToAction("AddFeatures", new { id = propertyId });
        }
        [HttpGet]
        public ActionResult AddContacts(int propertyId, int? id)
        {
            ViewBag.Property = PropertyName(propertyId);
            var model = new TranslatorModel
            {
                Translators = new List<TranslatorModel>()
                ,
                PropertyId = propertyId
            };
            if (id != null)
            {
                var contact = _hotelSvc.GetTranslatorById((int)id);
                if (contact != null)
                {
                    model.Id = contact.Id;
                    model.PropertyId = contact.PropertyId;
                    model.Name = contact.Name;
                    model.Language = contact.Language;
                    model.Landline = contact.Landline;
                    model.Mobile = contact.Mobile;
                    model.IsActive = contact.IsActive;
                    model.ImageName = contact.ImageName;
                }
            }
            var results = _hotelSvc.GetTranslators(propertyId);
            foreach (var t in results)
            {
                model.Translators.Add(new TranslatorModel
                {
                    Id = t.Id,
                    PropertyId = t.PropertyId,
                    Name = t.Name,
                    Language = t.Language,
                    Landline = t.Landline,
                    Mobile = t.Mobile,
                    IsActive = t.IsActive,
                    ImageName = !string.IsNullOrWhiteSpace(t.ImageName) ? "/PropertyImages/" + t.PropertyId + "/thumbs/translator/" + t.Id + "/" + t.ImageName : "/Content/img/defaultphoto.gif"
                });

            }
            return View(model);
        }
        [HttpPost]
        public ActionResult AddContacts(TranslatorModel model, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                var translator = new Translator
                {
                    Name = model.Name,
                    Language = model.Language,
                    Landline = model.Landline,
                    Mobile = model.Mobile,
                    IsActive = true,
                    PropertyId = model.PropertyId,
                    ImageName = file != null ? file.FileName : model.ImageName
                };
                if (model.Id == 0)
                {
                    _hotelSvc.SaveTranslator(translator);
                    translator.Id = translator.Id;
                }
                else
                {
                    translator.Id = model.Id;
                    _hotelSvc.UpdateTranslator(translator);
                }

                //adding photos
                if (file != null && file.ContentLength > 0)
                {
                    string pic = System.IO.Path.GetFileName(file.FileName);

                    var photoPath = "/PropertyImages/" + model.PropertyId + "/thumbs/translator/" + translator.Id + "/";

                    string path = System.IO.Path.Combine(Server.MapPath(photoPath), pic);

                    bool isExists = System.IO.Directory.Exists(Server.MapPath(photoPath));
                    if (!isExists)
                        System.IO.Directory.CreateDirectory(Server.MapPath(photoPath));

                    // file is uploaded
                    file.SaveAs(path);

                }
                return RedirectToAction("AddContacts", new { propertyId = model.PropertyId });
            }
            return View(model);
        }
        [HttpGet]
        public ActionResult AddPlaces(int propertyId, int? id)
        {
            ViewBag.Property = PropertyName(propertyId);
            var travelBy = _hotelSvc.GetTravelBy();
            ViewBag.TravelBy = new SelectList(travelBy, "Id", "Name");

            var poiList = _hotelSvc.GetPointOfInterestList().ToList();
            ViewBag.POTList = new SelectList(poiList, "Id", "Name");
         
            var model = new PlaceModel { Places = new List<PlaceModel>(), PropertyId = propertyId };
            if (id != null)
            {
                var p = _hotelSvc.GetPlace((int)id);
                if (p != null)
                {
                    model.Id = p.Id;
                    model.PropertyId = p.PropertyId;
                    model.PlaceName = p.PlaceName;
                    model.TimeTake = p.TimeTake;
                    model.Latitude = p.Lat;
                    model.Longitude = p.Long;
                    model.Distance = p.Distance;
                    model.Travel = p.TravelBy;
                }
            }
            var results = _hotelSvc.GetPlaces(propertyId);
            foreach (var p in results)
            {
                model.Places.Add(new PlaceModel
                {
                    Id = p.Id,
                    PropertyId = p.PropertyId,
                    PlaceName = p.PlaceName + " (" + GetPoiName(p.PoiId) + ")",
                    TimeTake = p.TimeTake,
                    Distance = p.Distance,
                    Travel = p.TravelBy,
                    TravelBy = _hotelSvc.TravelByName(p.TravelBy)
                });
            }
            return View(model);
        }
        [HttpPost]
        public ActionResult AddPlaces(PlaceModel model)
        {
            if (ModelState.IsValid)
            {
                var p = new Place
                {
                    PropertyId = model.PropertyId,
                    Id = 0,
                    PlaceName = model.PlaceName,
                    Lat = model.Latitude,
                    Long = model.Longitude,
                    Distance = model.Distance,
                    TimeTake = model.TimeTake,
                    TravelBy = model.Travel,
                    PoiId = model.PoiId,
                };
                if (model.Id == 0)
                    _hotelSvc.SaveNearetPlaces(p);
                else
                {
                    p.Id = model.Id;
                    p.PropertyId = model.PropertyId;
                    _hotelSvc.UpdateNearetPlaces(p);
                }
                return RedirectToAction("AddPlaces", new { propertyId = model.PropertyId });

            }

            return View(model);
        }

        private string GetPoiName(int id)
        {
            var str = string.Empty;
            if (id == 1)
                str = "Cultural";
            if (id == 2)
                str = "Nature";
            if (id == 3)
                str = "Time & People";
            return str;
        }

        [HttpGet]
        public ActionResult AddFood(int propertyId, int? id)
        {
            ViewBag.Property = PropertyName(propertyId);
            var model = new DiningModel { Meals = new List<DiningModel>(), PropertyId = propertyId };
            var mealTypes = _hotelSvc.GetCuisines();
            ViewBag.Meals = new SelectList(mealTypes, "Id", "FoodType");

            if (id != null)
            {
                var f = _hotelSvc.GetFood((int)id);
                model.Id = f.Id;
                model.FoodId = f.FoodId;
                model.Price = f.Price;
                model.PropertyId = f.PropertyId;
                model.MealType = f.MealType;
            }
            var results = _hotelSvc.GetMeals(propertyId);
            foreach (var r in results)
            {
                model.Meals.Add(new DiningModel
                {
                    Id = r.Id,
                    Food = _hotelSvc.GetMealDetail(r.FoodId) == null ? "" : _hotelSvc.GetMealDetail(r.FoodId).FoodType,
                    PropertyId = r.PropertyId,
                    Price = r.Price,
                    MealType = r.MealType,
                });
            }

            return View(model);
        }
        [HttpPost]
        public ActionResult AddFood(DiningModel model)
        {
            ViewBag.Property = "House" + "( house name )";

            var mealTypes = _hotelSvc.GetCuisines();
            ViewBag.Meals = new SelectList(mealTypes, "Id", "FoodType");

            var d = new Dining
            {
                FoodId = model.FoodId,
                MealType = model.MealType,
                PropertyId = model.PropertyId,
                Price = model.Price,
            };

            if (ModelState.IsValid)
            {
                if (model.Id == 0)
                    _hotelSvc.SaveDining(d);
                else
                {
                    d.Id = model.Id;
                    _hotelSvc.UpdateDining(d);
                }

                return RedirectToAction("AddFood", new { propertyId = model.PropertyId });
            }


            return View(model);
        }

      
        public ActionResult FindLatLong()
        {
            return View();
        }
        public ActionResult FindLocation()
        {
            return View();
        }

        //Delete
        public ActionResult RemoveImage(int imageId, int propertyId)
        {
            ViewBag.Property = PropertyName(propertyId);
            _hotelSvc.RemoveImage(imageId, propertyId);
            return RedirectToAction("AddImages", new { id = propertyId });
        }

        public ActionResult DeleteProperty(int id)
        {
            _hotelSvc.DeleteProperty(id);
            return RedirectToAction("PropertyList");
        }

        public ActionResult DeletePlace(int id, int propId)
        {
            _hotelSvc.DeletePlaces(id);
            return RedirectToAction("AddPlaces", new { propertyId = propId });
        }

        public ActionResult DeleteContact(int id, int propId)
        {
            _hotelSvc.DeleteContacts(id);
            return RedirectToAction("AddContacts", new { propertyId = propId });
        }

        public ActionResult DeleteMeal(int id, int propId)
        {
            _hotelSvc.DeleteMeals(id);
            return RedirectToAction("AddFood", new { propertyId = propId });
        }

        public ActionResult PropertyDetail(int id)
        {
            var model = new PropertyModel
            {
                Images = new List<ImageModel>(),
                Features = new List<Features>(),
                Places = new List<PlaceModel>(),
                Meals = new List<DiningModel>(),
                PoIs = new List<eHorakelle.Models.PointOfInterest>(),
                Translators = new List<TranslatorModel>(),
                DistrictImages = new List<ImageModel>()
            };

            var property = _hotelSvc.GetPropertyDetail(id);
            var images = _hotelSvc.Images(id);
            if (property != null)
            {
                model.Id = property.Id;
                model.LocationUrl = "/Property/GetPropertylocation?id=" + id;
                model.Name = property.Name;
                model.NoOfRooms = property.NoOfRooms;
                model.Description = property.Description;
                model.DisplayPrice = property.DisplayPrice;
                model.ClientName = "";
                model.ContactPerson1 = property.ContactPerson1;
                model.MobilePrimary = property.MobilePrimary;
                model.MobileSecondary = property.MobileSecondary;
                model.LandLinePrimary = property.LandLinePrimary;
                model.LandLineSecondary = property.LandLineSecondary;
                model.ContactPerson2 = property.ContactPerson2;
                model.Adderss = property.Adderss;
                model.Street = property.Street;
                model.City = property.City;
                model.FeatureList = property.Features;
                model.PoiList = property.Interests;
                model.Squarefeet = (decimal)property.Squarefeet;

                model.ImageName = !string.IsNullOrWhiteSpace(property.ImageName)
                                    ? "/PropertyImages/" + property.Id + "/thumbs/contact/" + property.ImageName
                                    : "/Content/img/defaultphoto.gif";

                model.MealImage = !string.IsNullOrWhiteSpace(property.MealImage)
                                    ? "/PropertyImages/MealImages/" + property.Id + "/" + property.MealImage
                                    : "";

                model.PoliceReport = !string.IsNullOrWhiteSpace(property.PoliceReport)
                                   ? "/PropertyImages/PoliceReport/" + property.Id + "/" + property.PoliceReport
                                   : "";

                model.GSReport = !string.IsNullOrWhiteSpace(property.GSReport)
                                 ? "/PropertyImages/GSReport/" + property.Id + "/" + property.GSReport
                                 : "";

                model.AboutOwner = property.AboutOwner ?? "N/A";
                var firstOrDefault = images.FirstOrDefault();
                if (firstOrDefault != null) model.DefaultImageUrl = firstOrDefault.ImagePath;
            }

            var plsColl = new List<PlaceModel>
                {
                    new PlaceModel
                        {
                            PlaceName = "Culture",
                            PoiId = 1,
                            Places=new List<PlaceModel>()
                        },
                        new PlaceModel
                        {
                            PlaceName = "Nature",
                            PoiId = 2,
                             Places=new List<PlaceModel>()
                        },
                        new PlaceModel
                        {
                            PlaceName = "Time & People",
                            PoiId = 3,
                             Places=new List<PlaceModel>()
                        }
                };

            foreach (var item in plsColl)
            {
                var places = _hotelSvc.GetPlaces(id).Where(q => q.PoiId == item.PoiId);
                foreach (var p in places)
                {
                    var travelBy = _hotelSvc.GetTravelDetail(p.TravelBy);
                    var pl = new PlaceModel
                    {
                        Id = p.Id,
                        PropertyId = p.PropertyId,
                        PlaceName = p.PlaceName,
                        Latitude = p.Lat,
                        Longitude = p.Long,
                        Distance = p.Distance,
                        TimeTake = p.TimeTake,
                        PoiId = p.PoiId,
                        TravelBy = travelBy == null ? "" : travelBy.Name,
                        Description = p.Description
                    };

                    item.Places.Add(pl);
                }
            }
            model.Places = plsColl;


            var meals = _hotelSvc.GetMeals(id);
            var cuisines = _hotelSvc.GetCuisines().OrderBy(q => q.DisplayOrder);
            foreach (var cuisine in cuisines)
            {
                var _meals = meals.Where(q => q.FoodId == cuisine.Id).ToList();
                if (_meals.Any())
                {
                    var mealMod = new DiningModel
                    {
                        Meals = new List<DiningModel>(),
                        MealType = cuisine.FoodType,
                        FoodId = cuisine.Id,
                        Imagepath = !string.IsNullOrWhiteSpace(cuisine.ImageName) ? "/PropertyImages/DiningImages/" + cuisine.Id + "/" + cuisine.ImageName : "/Content/img/dining.jpg"
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

                    model.Meals.Add(mealMod);
                }
            }


            foreach (var i in images)
            {
                model.Images.Add(new ImageModel
                {
                    Id = i.Id,
                    DefaultImage = (bool)i.DefaultImage,
                    ImageDescription = i.ImageDescription,
                    ImagePath = "/PropertyImages/" + id + "/thumbs/" + i.ImagePath,
                    PropertyId = i.PropertyId
                });
            }

            var district = property.MainCity;
            if (district != null)
            {
                var distimages = _hotelSvc.DistrictImages(district.Value);
                foreach (var i in distimages)
                {
                    model.DistrictImages.Add(new ImageModel
                    {
                        Id = i.Id,
                        ImageDescription = i.Description,
                        ImagePath = "~/DistrictImages/" + district.Value + "/" + i.ImageName,
                        PropertyId = i.DistrictId
                    });
                }
            }
            var translators = _hotelSvc.GetTranslators(id);
            foreach (var t in translators)
            {
                model.Translators.Add(
                    new TranslatorModel
                    {
                        Id = t.Id,
                        Name = t.Name,
                        Landline = t.Landline,
                        Mobile = t.Mobile,
                        Language = t.Language,
                        ImageName = !string.IsNullOrWhiteSpace(t.ImageName) ? "/PropertyImages/" + t.PropertyId + "/thumbs/translator/" + t.Id + "/" + t.ImageName : "/Content/img/defaultphoto.gif"
                    });
            }

            return View(model);
        }

        public ActionResult Approve(int id)
        {
            
            var clientId = 0;
            if (User.Identity.IsAuthenticated)
            {
                var userEmail = User.Identity.Name;
                var user = _userService.GetUser(userEmail, 1);
                if (user != null)
                {
                    _hotelSvc.PostProperty(id);

                    EmailService.SendPostPropertyEmail("", user.Email, string.Format("{0} {1}", user.FirstName, user.LastName), id);

                }
            }

          

            return RedirectToAction("PropertyList");
        }

        public ActionResult Reject(int id)
        {
            _hotelSvc.RejectProperty(id);
            return RedirectToAction("PropertyList");
        }

        public ActionResult MealTypes()
        {
            ViewBag.Meals = _hotelSvc.GetCuisines();
            //ViewBag.Meals = new SelectList(mealTypes, "Id", "FoodType");
            return View();
        }
        public ActionResult RemoveCuisine(int id)
        {
            _hotelSvc.DeleteCuisine(id);
            return RedirectToAction("MealTypes");
        }
        public ActionResult AddCuisine(int id, string name)
        {
            _hotelSvc.SaveMealType(id, name);
            return RedirectToAction("MealTypes");
        }

        public ActionResult Features()
        {
            var features = new List<FeatureList>();
            foreach (var f in _hotelSvc.GetFeatureList().ToList())
            {
                var firstOrDefault = _hotelSvc.FeatureCategories().Where(q => q.Id == f.GroupId).FirstOrDefault();
                if (firstOrDefault != null)
                    features.Add(new FeatureList
                    {
                        Id = f.Id,
                        Name = f.Name,
                        GroupName = firstOrDefault.Name ?? "",
                        DisplayOrder = f.DisplayOrder,
                        GroupId = f.GroupId
                    });
            }
            ViewBag.FeatureGroups = new SelectList(_hotelSvc.FeatureCategories().ToList(), "Id", "Name");
            //ViewBag.FeatureGroups = _hotelSvc.FeatureCategories().ToList();

             //ViewBag.Features = _hotelSvc.GetFeatureList().ToList();
            ViewBag.Features = features.ToList();
            return View();
        }

        public ActionResult RemoveFeature(int id)
        {
            _hotelSvc.DeleteFeatures(id);
            return RedirectToAction("Features");
        }

        public ActionResult AddFeature(int id, int groupId, string name)
        {
            _hotelSvc.SaveFeature(id, groupId, name);
            return RedirectToAction("Features");
        }


        public ActionResult Pois()
        {
            return View();
        }

        public ActionResult AccomodationTypes()
        {
            return View();
        }

        public ActionResult AccomodationStandards()
        {
            return View();
        }

        public ActionResult Occupations()
        {
            ViewBag.Occupations = _hotelSvc.GetDesignations();
            return View();
        }

        public ActionResult RemoveOccupation(int id)
        {
            _hotelSvc.RemoveOccupation(id);
            return RedirectToAction("Occupations");
        }

        public ActionResult AddOccupation(int id, string name)
        {
            _hotelSvc.SaveOccupation(id, name);
            return RedirectToAction("Occupations");
        }

        private string PropertyName(int id)
        {
            if (TempData["PropertyName"] == null)
            {
                var property = _hotelSvc.GetPropertyDetail(id);
                if (property != null)
                {
                    TempData["PropertyName"] = property.Name;
                    ViewBag.Property = property.Name;
                }
            }
            else
            {
                ViewBag.Property = TempData["PropertyName"];
            }

            return TempData["PropertyName"].ToString();
        }
        
        public ActionResult FeatureGroup()
        {
            ViewBag.FeatureGroups = _hotelSvc.FeatureCategories().ToList();
            return View();
        }

        public ActionResult AddFeatureGroup(int id, string name)
        {
            _hotelSvc.SaveFeatureGroup(id, name);
            return RedirectToAction("FeatureGroup");
        }

        public ActionResult RemoveFeatureGroup(int id)
        {
            _hotelSvc.RemoveFeatureGroup(id);
            return RedirectToAction("FeatureGroup");
        }
        
        private void PreLoadData()
        {
            var cities = _hotelSvc.GetLocationList();
            cities = cities.Where(q => q.Id != 0).ToList();
            ViewBag.LocationList = new SelectList(cities, "Id", "City");

            var radius = new List<NameValue>
                {
                    new NameValue
                        {
                            Id = 1,
                            Name = "This area only"
                        },
                    new NameValue
                        {
                            Id = 3,
                            Name = "Within 3 KM"
                        },
                    new NameValue
                        {
                            Id = 5,
                            Name = "Within 5 Km"
                        },
                    new NameValue
                        {
                            Id = 10,
                            Name = "Within 10 KM"
                        }
                        ,
                    new NameValue
                        {
                            Id = 15,
                            Name = "Within 15 KM"
                        }
                        ,
                    new NameValue
                        {
                            Id = 20,
                            Name = "Within 20 KM"
                        }
                        ,
                    new NameValue
                        {
                            Id = 25,
                            Name = "Within 25 KM"
                        },
                    new NameValue
                        {
                            Id = 30,
                            Name = "Within 30 KM"
                        },
                    new NameValue
                        {
                            Id = 40,
                            Name = "Within 40 KM"
                        },
                    new NameValue
                        {
                            Id = 50,
                            Name = "Within 50 KM"
                        },
                    new NameValue
                        {
                            Id = 51,
                            Name = "Above 50 KM"
                        },
                   new NameValue
                        {
                            Id = 52,
                            Name = "--- Any ---"
                        },
                };

            //string[] radiusList = new string[] { "5", "10", "15", "20" };
            SelectList list = new SelectList(radius, "Id", "Name");
            ViewBag.RadiusList = list;

            var acmTypes = _hotelSvc.GetAccomodationTypeList();
            ViewBag.AccomodationTypeList = new SelectList(acmTypes, "Id", "Name");

            var acmStandards = _hotelSvc.GetAccomodationStandardList();
            ViewBag.AccomodationStandardList = new SelectList(acmStandards, "Id", "Name");

            var designations = _hotelSvc.GetDesignations();
            ViewBag.Designations = new SelectList(designations, "Id", "Name");

            //string[] roomsList = new string[] { "1", "2", "3", "4" };
            var rooms = new List<NameValue>
                {
                   
                    new NameValue
                        {
                            Id = 1,
                            Name = "1"
                        },
                    new NameValue
                        {
                            Id = 2,
                            Name = "2"
                        },
                    new NameValue
                        {
                            Id = 3,
                            Name = "3"
                        }
                        ,
                    new NameValue
                        {
                            Id = 4,
                            Name = "4"
                        }
                        ,
                    new NameValue
                        {
                            Id = 5,
                            Name = "5"
                        }
                        ,
                    new NameValue
                        {
                            Id = 6,
                            Name = "6"
                        },
                    new NameValue
                        {
                            Id = 7,
                            Name = "7 +"
                        },
                  
                };


            ViewBag.RoomList = new SelectList(rooms, "Id", "Name");

            var poiList = _hotelSvc.GetPointOfInterestList().ToList();
            var pl = poiList.Select(item => new Models.PointOfInterest { Id = item.Id, Name = item.Name }).ToList();

            // ViewBag.POTList = new SelectList(poiList, "Id", "Name");
            ViewBag.POTList = pl;

            var featureList = _hotelSvc.GetFeatureList().ToList();
            var fl = featureList.Select(item => new Features { Id = item.Id, Name = item.Name }).ToList();

            //ViewBag.FeatureList = new SelectList(featureList, "Id", "Name");

            ViewBag.FeatureList = fl;

            var minPrice = new List<NameValue>
                {
                    new NameValue
                        {
                            Id = 0,
                            Name = "Min"
                        }
                };
            for (int i = 100; i < 50000; i = i + 100)
            {
                minPrice.Add(new NameValue
                {
                    Id = i,
                    Name = Convert.ToString(i)
                });
                //i = i + 100;
            }

            var maxPrice = new List<NameValue>
                {
                    new NameValue
                        {
                            Id = 0,
                            Name = "Max"
                        }
                };
            for (int i = 200; i < 80000; i = i + 100)
            {
                maxPrice.Add(new NameValue
                {
                    Id = i,
                    Name = Convert.ToString(i)
                });
                //i = i + 100;
            }


            ViewBag.MinPriceList = new SelectList(minPrice, "Id", "Name");
            ViewBag.MaxPiceList = new SelectList(maxPrice, "Id", "Name");

        }


        //POI order

        //culture : orage bulleting (black back ground)
        //Nature: jungle green
        //time & people :purple

    }
}
