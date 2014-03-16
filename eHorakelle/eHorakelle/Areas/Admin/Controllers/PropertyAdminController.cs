using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using eZeroOne.Common;
using eZeroOne.MailService;
using eZeroOne.Service.Customers;
using eZeroOne.Service.Property;
using eZeroOne.Service.Repository;
using eZeroOne.Domain;
using eZeroOne.Service.Users;
using eZeroOne.eHorakelle.Controllers;
using eZeroOne.eHorakelle.Models;
using PointOfInterest = eZeroOne.Domain.PointOfInterest;

namespace eZeroOne.eHorakelle.Areas.Admin.Controllers
{
    [Authorize(Roles=RoleNames.Admin)]
    public class PropertyAdminController : BaseController
    {
        //
        // GET: /Admin/
        private readonly IProperties _properties;
        private readonly IUserService _userService;
        private readonly ICustomerService _customerService;
        //
        // GET: /Property/
        public PropertyAdminController(IRepository repository, IUnitOfWork unitOfWork)
        {
            _properties = new Properties(repository, unitOfWork);
            _userService = new UserService(repository, unitOfWork);
            _customerService = new CustomerService(repository, unitOfWork);
        }

        [HttpGet]
        public ActionResult AddProperty(int? id)
        {
            var clientId = 0;
            if (User.Identity.IsAuthenticated)
            {
                var userEmail = User.Identity.Name;
                var user = _userService.GetUser(userEmail,1);
                if (user != null)
                    clientId = user.UserId;
            }

            var property = new PropertyModel();
            PreLoadData();
            if (id != null)
            {
                var model=_properties.GetProperty((int) id);

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
                    OwnerDesignation = _properties.DesignationName(model.Designation),
                    Email = model.Email,
                    VideoUrl = model.VideoUrl,
                    Website = model.Website,
                    IsActive = false,
                    IsApproved=false,
                    IsPosted=true,
                    ActiveFrom = DateTime.UtcNow,
                    CompanyId = 1,
                    ClientId = userId,
                    //ImageName = file != null ? file[0].FileName : model.ImageName,
                    //MealImage = file != null ? file[1].FileName : model.MealImage,
                    AboutOwner=model.AboutOwner,
                    //PoliceReport = file != null ? file[2].FileName : model.PoliceReport,
                    //GSReport = file != null ? file[3].FileName : model.GSReport,
                };

                p.ImageName = file != null ? file[0]!=null?file[0].FileName : model.ImageName:"";
                //p.MealImage = file != null ? file[1]!=null?file[1].FileName : model.MealImage:"";
                //p.PoliceReport = file != null ? file[2]!=null?file[2].FileName : model.PoliceReport:"";
                //p.GSReport = file != null ? file[3]!=null?file[3].FileName : model.GSReport:"";

                if (model.Id == 0)
                {
                    _properties.SaveProperty(p);
                    p.Id = p.Id;
                }
                else
                {
                    p.Id = model.Id;
                    _properties.UpdateProperty(p);
                }
                //adding photos
                if (file != null && file[0]!=null && file[0].ContentLength>0)
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

                ////adding photos
                //if (file != null && file[1] != null && file[1].ContentLength > 0)
                //{
                //    string pic = System.IO.Path.GetFileName(file[1].FileName);

                //    var photoPath = "/PropertyImages/MealImages/" + p.Id + "/";

                //    string path = System.IO.Path.Combine(Server.MapPath(photoPath), pic);

                //    bool isExists = System.IO.Directory.Exists(Server.MapPath(photoPath));
                //    if (!isExists)
                //        System.IO.Directory.CreateDirectory(Server.MapPath(photoPath));

                //    // file is uploaded
                //    file[1].SaveAs(path);
                    
                //}

                ////adding police report
                //if (file != null && file[2] != null && file[2].ContentLength > 0)
                //{
                //    string rptname = System.IO.Path.GetFileName(file[2].FileName);

                //    var pReport = "/PropertyImages/PoliceReport/" + p.Id + "/";

                //    string path = System.IO.Path.Combine(Server.MapPath(pReport), rptname);

                //    bool isExists = System.IO.Directory.Exists(Server.MapPath(pReport));
                //    if (!isExists)
                //        System.IO.Directory.CreateDirectory(Server.MapPath(pReport));

                //    // file is uploaded
                //    file[2].SaveAs(path);


                //}

                ////adding GS report
                //if (file != null && file[3] != null && file[3].ContentLength > 0)
                //{
                //    string rptname = System.IO.Path.GetFileName(file[3].FileName);

                //    var pReport = "/PropertyImages/GSReport/" + p.Id + "/";

                //    string path = System.IO.Path.Combine(Server.MapPath(pReport), rptname);

                //    bool isExists = System.IO.Directory.Exists(Server.MapPath(pReport));
                //    if (!isExists)
                //        System.IO.Directory.CreateDirectory(Server.MapPath(pReport));

                //    // file is uploaded
                //    file[3].SaveAs(path);


                //}

               return  RedirectToAction("PropertyList");
            }
            PreLoadData();
            return View(model);
        }

        public ActionResult PropertyList()
        {
            var model = new List<PropertyModel>();
            var results = _properties.GetHotelsList().Where(q=>q.IsPosted);
            foreach (var p in results)
            {
                model.Add(item: new PropertyModel
                    {
                        Id=p.Id,
                        Name=p.Name,
                        ContactPerson1=p.ContactPerson1,
                        Email="",
                        Adderss = p.Adderss,
                        Street = p.Street,
                        City = p.City,
                        IsActive=(bool) p.IsActive,
                        AddedBy = _userService.GetUser((int)p.ClientId)== null ? "Admin" : _userService.GetUser((int)p.ClientId).RoleId == 1 ? "Admin" : "Client",
                    });
            }
            return View(model);
        }
        

        [HttpGet]
        public ActionResult AddRoom(int? id)
        {
            var clientId = 0;
            if (User.Identity.IsAuthenticated)
            {
                var userEmail = User.Identity.Name;
                var user = _userService.GetUser(userEmail, 1);
                if (user != null)
                    clientId = user.UserId;
            }

            var property = new RoomModel();
            PreLoadData();
            if (id != null)
            {
                var model = _properties.GetRoom((int)id);

                if (model != null)
                {
                    property.Id = model.Id;
                    property.PropertyId = model.PropertyId;
                    property.Name = model.Name;
                    property.Description = model.Description;
                    property.DisplayPrice = model.DisplayPrice;
                    property.VideoUrl = model.VideoUrl;
                    
                }

            }

            return View(property);
        }

        [HttpPost]
        public ActionResult AddRoom(RoomModel model, HttpPostedFileBase[] file)
        {
            if (ModelState.IsValid)
            {
                var userId =1;
                if (User.Identity.IsAuthenticated)
                {
                    var userEmail = User.Identity.Name;
                    var user = _userService.GetUser(userEmail, 1);
                    if (user != null)
                        userId = user.UserId;

                }

                var p = new Room
                    {
                        Name = model.Name,
                        Description = model.Description,
                        PropertyId=model.PropertyId,
                        DisplayPrice = model.DisplayPrice,
                        Squarefeet = model.Squarefeet,
                        VideoUrl = model.VideoUrl,
                        IsActive = true,
                        
                    };

              
                if (model.Id == 0)
                {
                    _properties.SaveRoom(p);
                    p.Id = p.Id;
                }
                else
                {
                    p.Id = model.Id;
                    _properties.UpdateRoom(p);
                }
             
                return RedirectToAction("RoomList");
            }
            PreLoadData();
            return View(model);
        }

        public ActionResult RoomList()
        {
            var model = new List<RoomModel>();
            var results = _properties.GetRooms().Where(q => q.IsActive);
            foreach (var p in results)
            {
                model.Add(item: new RoomModel
                {
                    Id = p.Id,
                    PropertyId=p.PropertyId,
                    Name = p.Name,
                    AddedBy = "Admin" ,
                });
            }
            return View(model);
        }
     

        [HttpGet]
        public ActionResult AddImages(int id)
        {
            ViewBag.Property = PropertyName(id);
            var model = new ImageViewModel {ImageList = new List<ImageModel>()};
            var results = _properties.Images(id);
            foreach (var p in results)
            {
                model.ImageList.Add(new ImageModel
                    {
                        Id=p.Id,
                        ImagePath=p.ImagePath,
                        ImageDescription=p.ImageDescription,
                        PropertyId=p.PropertyId,
                        DefaultImage=(bool) p.DefaultImage
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
                    
                    _properties.AddIImage(model.Id, fileName, model.ImageDescription, model.DefaultImage);
                }
                catch (Exception ex)
                {
                    //throw new Exception(ex.Message);
                }
        
            }

            return RedirectToAction("AddImages", new { id = model.Id });
        }

        [HttpGet]
        public ActionResult AddRoomImages(int id)
        {
            ViewBag.Property = RoomName(id);
            var model = new ImageViewModel { ImageList = new List<ImageModel>() };
            var results = _properties.RoomImages(id);
            foreach (var p in results)
            {
                model.ImageList.Add(new ImageModel
                {
                    Id = p.Id,
                    ImagePath = p.ImagePath,
                    ImageDescription = p.ImageDescription,
                    PropertyId = p.RoomId,
                    DefaultImage = (bool)p.DefaultImage
                });

            }
            model.Id = id;
            return View(model);
        }

        [HttpPost]
        public ActionResult UploadRoomImage(ImageViewModel model, HttpPostedFileBase file)
        {
            if (file == null)
            {
                return RedirectToAction("AddRoomImages", new { id = model.Id });
            }
            if (file.ContentLength > 0)
            {
                try
                {
                    // var path = Path.Combine(Server.MapPath("~/Content/ItemImages"), fileName);
                    var fileName = Path.GetFileName(file.FileName);
                    
                    var path = Path.Combine(Server.MapPath("~/RoomImages/" + model.Id + "/thumbs"), fileName);

                    //large&thumps images
                    bool isExists = System.IO.Directory.Exists(Server.MapPath("~/RoomImages/" + model.Id + "/thumbs"));
                    if (!isExists)
                        System.IO.Directory.CreateDirectory(Server.MapPath("~/RoomImages/" + model.Id + "/thumbs"));

                    file.SaveAs(path);

                    _properties.AddRoomImage(model.Id, fileName, model.ImageDescription, model.DefaultImage);
                }
                catch (Exception ex)
                {
                    //throw new Exception(ex.Message);
                }

            }

            return RedirectToAction("AddRoomImages", new { id = model.Id });
        }
    
        [HttpGet]
        public ActionResult DistrictImages(int id)
        {
            ViewBag.Property = _properties.GetDistrict(id).City;
            var model = new ImageViewModel { ImageList = new List<ImageModel>() };
            var results = _properties.DistrictImages(id);
            foreach (var p in results)
            {
                model.ImageList.Add(new ImageModel
                {
                    Id = p.Id,
                    ImagePath = p.ImageName,
                    ImageDescription = p.Description,
                    PropertyId = p.DistrictId,
                    
                });

            }
            model.Id = id;
            return View(model);


        }

        [HttpPost]
        public ActionResult UploadDistrictImage(ImageViewModel model,HttpPostedFileBase file)
        {
            if (file == null)
            {
                return RedirectToAction("DistrictImages", new { id = model.Id });
            }
            if (file.ContentLength > 0)
            {
                try
                {
                    
                    var fileName = Path.GetFileName(file.FileName);
                    var path = Path.Combine(Server.MapPath("~/DistrictImages/" + model.Id ), fileName);

                   
                    bool isExists = System.IO.Directory.Exists(Server.MapPath("~/DistrictImages/" + model.Id));
                    if (!isExists)
                        System.IO.Directory.CreateDirectory(Server.MapPath("~/DistrictImages/" + model.Id ));

                    file.SaveAs(path);

                    _properties.AddDistrictImage(model.Id, fileName, model.ImageDescription);
                }
                catch (Exception ex)
                {
                    //throw new Exception(ex.Message);
                }

            }

            return RedirectToAction("DistrictImages", new { id = model.Id });
          
        }

        //Delete
        public ActionResult RemoveDistrictImage(int imageId, int districtId)
        {

            _properties.RemoveDistrictImage(imageId, districtId);
            return RedirectToAction("DistrictImages", new { id = districtId });
        }

        public ActionResult AddPoI(int id)
        {
            ViewBag.Property = PropertyName(id);
            var poiList = _properties.GetPointOfInterestList().ToList();
            var pl = poiList.Select(item => new Models.PointOfInterest { Id = item.Id, Name = item.Name,IsChecked=false }).ToList();
            // ViewBag.POTList = new SelectList(poiList, "Id", "Name");
            var poi = new List<Models.PointOfInterest>();
            var feature = _properties.GetPropertyDetail(id);
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

            ViewBag.POTList = pl.OrderBy(o=>o.Name).ToList();

            return View();
        }

        public ActionResult SavePois(string poiList, int propertyId)
        {
            _properties.UpdatePois(propertyId, poiList);

            return RedirectToAction("AddPoI", new { id = propertyId });
        }
       
        public ActionResult AddFeatures(int id)
        {
            var featureList = _properties.GetFeatureList().ToList();
            var fl = featureList.Select(item => new Features { Id = item.Id, Name = item.Name,IsChecked =false,GroupId=item.GroupId }).ToList();
            
            var pF = new List<Features>();
            var feature = _properties.GetPropertyDetail(id);
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
                        ViewBag.FeatureList = fl.OrderBy(o=>o.Name).ToList();


            //FeatureGroup
            var featureGroup = new List<FeatureGroup>();
            var groups = _properties.FeatureCategories().OrderBy(o => o.Name).ToList();
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
                        IsChecked=fea.IsChecked,
                        GroupId=fea.GroupId
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
            _properties.UpdateFeatures(propertyId, featureList);

            return RedirectToAction("AddFeatures", new { id = propertyId });
        }
        [HttpGet]
        public ActionResult AddContacts(int propertyId,int? id)
        {
            ViewBag.Property = PropertyName(propertyId);
            var model = new TranslatorModel { Translators = new List<TranslatorModel>() 
           ,PropertyId=propertyId};
            if (id != null)
            {
                var contact = _properties.GetTranslatorById((int) id);
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
            var results = _properties.GetTranslators(propertyId);
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
                        ImageName = !string.IsNullOrWhiteSpace(t.ImageName)?"/PropertyImages/" + t.PropertyId + "/thumbs/translator/" + t.Id + "/"+t.ImageName:"/Content/img/defaultphoto.gif"
                    });

            }
            return View(model);
        }
        [HttpPost]
        public ActionResult AddContacts(TranslatorModel model,HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {

                var img = file!=null ? file.FileName : null;
                var translator = new Translator
                    {
                        Name = model.Name,
                        Language=model.Language,
                        Landline=model.Landline,
                        Mobile=model.Mobile,
                        IsActive=true,
                        PropertyId=model.PropertyId,
                        ImageName = file != null ? file.FileName : model.ImageName
                    };
                if (model.Id == 0)
                {
                    _properties.SaveTranslator(translator);
                    translator.Id = translator.Id;
                }
                else
                {
                    translator.Id = model.Id;
                    _properties.UpdateTranslator(translator);
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
            var travelBy = _properties.GetTravelBy();
            ViewBag.TravelBy = new SelectList(travelBy, "Id", "Name");

            var poiList = _properties.GetPointOfInterestList().ToList();
            ViewBag.POTList = new SelectList(poiList, "Id", "Name");
            
            var model = new PlaceModel { Places = new List<PlaceModel>(), PropertyId = propertyId };
            if (id != null)
            {
                var p = _properties.GetPlace((int)id);
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
                    model.Description = p.Description;
                }
            }
            var results = _properties.GetPlaces(propertyId);
            foreach (var p in results)
            {
               model.Places.Add(new PlaceModel
                   {
                       Id=p.Id,
                       PropertyId=p.PropertyId,
                       PlaceName=p.PlaceName +" (" + GetPoiName(p.PoiId)+ ")",
                       TimeTake=p.TimeTake,
                       Distance=p.Distance,
                       Travel = p.TravelBy,
                       TravelBy = _properties.TravelByName(p.TravelBy),
                       Description=p.Description

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
                    Distance=model.Distance,
                    TimeTake = model.TimeTake,
                    TravelBy = model.Travel,
                    PoiId=model.PoiId,
                    Description=model.Description,
                };
                if (model.Id==0)
                _properties.SaveNearetPlaces(p);
                else
                {
                    p.Id = model.Id;
                    p.PropertyId = model.PropertyId;
                    p.PoiId = model.PoiId;
                    _properties.UpdateNearetPlaces(p);
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
            var mealTypes = _properties.GetCuisines();
            ViewBag.Meals = new SelectList(mealTypes, "Id", "FoodType");

            if (id != null)
            {
                var f = _properties.GetFood((int)id);
                model.Id = f.Id;
                model.FoodId = f.FoodId;
                model.Price = f.Price;
                model.PropertyId = f.PropertyId;
                model.MealType = f.MealType;
            }
            var results = _properties.GetMeals(propertyId);
            foreach (var r in results)
            {
                model.Meals.Add(new DiningModel
                    {
                        Id=r.Id,
                        Food = _properties.GetMealDetail(r.FoodId) == null ? "" : _properties.GetMealDetail(r.FoodId).FoodType,
                        PropertyId=r.PropertyId,
                        Price=r.Price,
                        MealType=r.MealType,
                    });
            }

            return View(model);
        }
        [HttpPost]
        public ActionResult AddFood(DiningModel model)
        {
            ViewBag.Property = "House" + "( house name )";
            
            var mealTypes = _properties.GetCuisines();
            ViewBag.Meals = new SelectList(mealTypes, "Id", "FoodType");

            var d = new Dining
                {
                    FoodId = model.FoodId,
                    MealType=model.MealType,
                    PropertyId=model.PropertyId,
                    Price=model.Price,
                };

            if (ModelState.IsValid)
            {
                if (model.Id == 0)
                _properties.SaveDining(d);
                else
                {
                    d.Id = model.Id;
                    _properties.UpdateDining(d);
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
            _properties.RemoveImage(imageId, propertyId);
            return RedirectToAction("AddImages", new { id = propertyId });
        }

        public ActionResult RemoveRoomImage(int imageId, int roomId)
        {
            ViewBag.Property = RoomName(roomId);
            _properties.RemoveRoomImage(imageId, roomId);
            return RedirectToAction("AddRoomImages", new { id = roomId });
        }

        public ActionResult DeleteProperty(int id)
        {
            _properties.DeleteProperty(id);
            return RedirectToAction("PropertyList");
        }

        public ActionResult DeleteRoom(int id)
        {
            _properties.DeleteProperty(id);
            return RedirectToAction("RoomList");
        }

        public ActionResult DeletePlace(int id, int propId)
        {
            _properties.DeletePlaces(id);
            return RedirectToAction("AddPlaces", new { propertyId = propId });
        }

        public ActionResult DeleteContact(int id, int propId)
        {
            _properties.DeleteContacts(id);
            return RedirectToAction("AddContacts", new { propertyId = propId });
        }

        public ActionResult DeleteMeal(int id,int propId)
        {
            _properties.DeleteMeals(id);
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

            var property = _properties.GetPropertyDetail(id);
            var images = _properties.Images(id);
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
                var places = _properties.GetPlaces(id).Where(q => q.PoiId == item.PoiId);
                foreach (var p in places)
                {
                    var travelBy = _properties.GetTravelDetail(p.TravelBy);
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


            var meals = _properties.GetMeals(id);
            var cuisines = _properties.GetCuisines().OrderBy(q => q.DisplayOrder);
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
                var distimages = _properties.DistrictImages(district.Value);
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
            var translators = _properties.GetTranslators(id);
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

        public ActionResult RoomDetail(int id)
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

            var property = _properties.GetRoom(id);
            var images = _properties.Images(id);
            if (property != null)
            {
                model.Id = property.Id;
                model.LocationUrl = "/Property/GetPropertylocation?id=" + id;
                model.Name = property.Name;
                model.Description = property.Description;
                model.DisplayPrice = property.DisplayPrice;
                model.ClientName = "";
                model.Squarefeet = (decimal)property.Squarefeet;

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
                var places = _properties.GetPlaces(id).Where(q => q.PoiId == item.PoiId);
                foreach (var p in places)
                {
                    var travelBy = _properties.GetTravelDetail(p.TravelBy);
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

           

            return View(model);
        }

        public ActionResult Approve(int id)
        {
            var approved= _properties.ApproveProperty(id);
            if (approved)
            {
                try
                {
                    var property = _properties.GetPropertyDetail(id);
                    if (property != null)
                    {
                        var client = _userService.GetClient((int)property.ClientId);
                        if (client != null)
                        EmailService.SendApprovalEmail("", client.Email, string.Format("{0} {1}", client.FirstName, client.LastName),id);

                        var user = _userService.GetUser((int)property.ClientId);
                        if (user != null)
                            EmailService.SendApprovalEmail("", user.Email, string.Format("{0} {1}", user.FirstName, user.LastName), id);

                    }
                  
                }
                catch (Exception)
                {

                }
                         
            }
            return RedirectToAction("PropertyList");
        }

        public ActionResult Reject(int id,string reason)
        {
            var rejectetd=_properties.RejectProperty(id);
            if (rejectetd)
            {
                try
                {
                    var property = _properties.GetPropertyDetail(id);
                    if (property != null)
                    {
                        var client = _userService.GetClient((int)property.ClientId);
                        if (client!=null)
                            EmailService.SendRejectEmail("", client.Email, string.Format("{0} {1}", client.FirstName, client.LastName), reason, id);

                        var user = _userService.GetUser((int)property.ClientId);
                        if (user != null)
                            EmailService.SendRejectEmail("", user.Email, string.Format("{0} {1}", user.FirstName, user.LastName), reason, id);

                    }

                }
                catch (Exception)
                {

                }
            }
            return RedirectToAction("PropertyList");
        }

        public ActionResult MealTypes()
        {
            ViewBag.Meals = _properties.GetCuisines().OrderBy(q=>q.DisplayOrder).ToList();
            //ViewBag.Meals = new SelectList(mealTypes, "Id", "FoodType");
            return View();
        }

        public ActionResult AddYoutubeUrl(int? id)
        {
            var model = new YoutubeUrlModel { Urls = new List<YoutubeUrlModel>() };
            //if (id != null)
            //{
            //    var p = _hotelSvc.ge((int)id);
            //    if (p != null)
            //    {
            //        model.Id = p.Id;
            //        model.PlaceName = p.PlaceName;
            //       model.Url=p.u
            //    }
            //}

            var results = _properties.GetYoutubeUrls();
            foreach (var p in results)
            {
                model.Urls.Add(new YoutubeUrlModel
                {
                    Id = p.Id,
                    ImageName = p.FileName,
                    Url = p.Url,
                    

                });
            }
            return View(model);
        }

        public ActionResult RemoveCuisine(int id)
        {
            _properties.DeleteCuisine(id);
            return RedirectToAction("MealTypes");
        }
        public ActionResult AddCuisine(int id,string name)
        {
            _properties.SaveMealType(id, name);
            return RedirectToAction("MealTypes");
        }

        public ActionResult Features()
        {
            var features = new List<FeatureList>();
            foreach (var f in _properties.GetFeatureList().ToList())
            {
                var firstOrDefault = _properties.FeatureCategories().Where(q => q.Id == f.GroupId).FirstOrDefault();
                if (firstOrDefault != null)
                    features.Add(new FeatureList
                        {
                            Id=f.Id,
                            Name=f.Name,
                            GroupName=firstOrDefault.Name??"",
                            DisplayOrder=f.DisplayOrder,
                            GroupId=f.GroupId
                        });
            }
            ViewBag.FeatureGroups = new SelectList(_properties.FeatureCategories().ToList(), "Id", "Name");
            //ViewBag.FeatureGroups = _hotelSvc.FeatureCategories().ToList();

            ViewBag.Features = features.ToList();
            return View();
        }
        public ActionResult FeatureGroup()
        {
            ViewBag.FeatureGroups = _properties.FeatureCategories().ToList();
            return View();
        }

        public ActionResult RemoveFeature(int id)
        {
            _properties.DeleteFeatures(id);
            return RedirectToAction("Features");
        }

        public ActionResult AddFeature(int id,int groupId, string name)
        {
            _properties.SaveFeature(id, groupId,name);
            return RedirectToAction("Features");
        }

        public ActionResult AddAccomodationType(int id, string name)
        {
            _properties.SaveAccomodationType(id, name);
            return RedirectToAction("AccomodationTypes");
        }
        public ActionResult AddAccomodationStandard(int id, string name)
        {
            _properties.SaveAccomodationStandard(id, name);
            return RedirectToAction("AccomodationStandards");
        }

        public ActionResult AddFeatureGroup(int id, string name)
        {
            _properties.SaveFeatureGroup(id, name);
            return RedirectToAction("FeatureGroup");
        }

        public ActionResult RemoveFeatureGroup(int id)
        {
            _properties.RemoveFeatureGroup(id);
            return RedirectToAction("FeatureGroup");
        }


        public ActionResult Pois()
        {
            return View();
        }

        public ActionResult AccomodationTypes()
        {

            var acmTypes = _properties.GetAccomodationTypeList().ToList();
            acmTypes.RemoveAt(0);

            ViewBag.AccomodationTypeList = acmTypes;// new SelectList(acmTypes, "Id", "Name");

           
            return View();
        }

        public ActionResult RemoveAccomodationType(int id)
        {
            _properties.RemoveAccomodationType(id);
            return RedirectToAction("AccomodationTypes");
        }

        public ActionResult TravelBy()
        {
            var travelBy = _properties.GetTravelBy();
            ViewBag.TravelBy = travelBy;// new SelectList(travelBy, "Id", "Name");

            return View();
        }

        public ActionResult AddTravelBy(int id, string name)
        {
            _properties.SaveTravelBy(id, name);
            return RedirectToAction("TravelBy");
        }

        public ActionResult RemoveTravelBy(int id)
        {
            _properties.RemoveTravelBy(id);
            return RedirectToAction("TravelBy");
        }

        public ActionResult AccomodationStandards()
        {
            var acmStandards = _properties.GetAccomodationStandardList().ToList();
            acmStandards.RemoveAt(0);

            ViewBag.AccomodationStandardList = acmStandards;
            return View();
        }

        public ActionResult RemoveAccomodationStandard(int id)
        {
            _properties.RemoveAccomodationStandard(id);
            return RedirectToAction("AccomodationStandards");
        }

        public ActionResult Occupations()
        {
            ViewBag.Occupations= _properties.GetDesignations();
            return View();
        }

        public ActionResult RemoveOccupation(int id)
        {
            _properties.RemoveOccupation(id);
            return RedirectToAction("Occupations");
        }

        public ActionResult AddOccupation(int id,string name)
        {
            _properties.SaveOccupation(id,name);
            return RedirectToAction("Occupations");
        }

        public ActionResult OrderFeature(int id, int orderId)
        {
            _properties.OrderFeature(id, orderId);
            return RedirectToAction("Features");
        }

        public ActionResult OrderFeatureGroup(int id, int orderId)
        {
            _properties.OrderFeatureGroup(id, orderId);
            return RedirectToAction("FeatureGroup");
        }

        public ActionResult OrderOccupation(int id, int orderId)
        {
            _properties.OrderOccupation(id, orderId);
            return RedirectToAction("Occupations");
        }

        public ActionResult OrderTravelBy(int id, int orderId)
        {
            _properties.OrderTravelBy(id, orderId);
            return RedirectToAction("TravelBy");
        }


        public ActionResult OrderAccomodationType(int id, int orderId)
        {
            _properties.OrderAccomodationtype(id, orderId);
            return RedirectToAction("AccomodationTypes");
        }
        public ActionResult OrderAccomodationStandard(int id, int orderId)
        {
            _properties.OrderAccomodationStandard(id, orderId);
            return RedirectToAction("AccomodationStandards");
        }

        public ActionResult OrderMealType(int id, int orderId)
        {
            _properties.OrderMealType(id, orderId);
            return RedirectToAction("MealTypes");
        }

        public ActionResult DistrictInfo()
        {
            ViewBag.MainCities = _properties.GetLocationList().Where(q=>q.Id!=0).ToList();
            return View();
        }

        public ActionResult AddDistrictInfo(int id, string name)
        {
            _properties.SaveDistrictInfo(id, name);
            return RedirectToAction("DistrictInfo");
        }
        
        [HttpGet]
        public ActionResult AddSliderImage(int? id)
        {
            var model = new SliderModel { Sliders = new List<SliderModel>() };
            if (id != null)
            {
                var p = _properties.GetSliderImage((int)id);
                if (p != null)
                {
                    model.Id = p.Id;
                    model.PlaceName = p.PlaceName;
                    model.Location = p.Location;
                    model.Latitude = p.Lat;
                    model.Longitude = p.Lon;
                    model.Distance = p.Distance;
                    model.PlaceUrl = p.PlaceUrl;
                    model.ImageDescription = p.ImageDescription;
                    model.ImageName = p.ImageName;
                    model.DisplayOrder = p.DisplayOrder;
                }
            }

            var results = _properties.GetSliderImages().OrderBy(o=>o.DisplayOrder).ToList();
            foreach (var p in results)
            {
                model.Sliders.Add(new SliderModel
                {
                    Id = p.Id,
                    PlaceName = p.PlaceName,
                    Location = p.Location,
                    Latitude = p.Lat,
                    Longitude = p.Lon,
                    Distance = p.Distance,
                    PlaceUrl = p.PlaceUrl,
                    ImageDescription = p.ImageDescription,
                    ImageName=p.ImageName,
                    DisplayOrder=p.DisplayOrder,

                });
            }
            return View(model);

           
        }

        [HttpPost]
        public ActionResult SaveSliderImage(SliderModel model, HttpPostedFileBase file)
        {
            if (file == null && model.Id==0)
            {
                return RedirectToAction("AddSliderImage");
            }
            if (file != null&& file.ContentLength > 0)
            {
                try
                {
                    var fileName = Path.GetFileName(file.FileName);
                    var path = Path.Combine(Server.MapPath("~/PropertyImages/SliderImages"), fileName);

                    //large&thumps images
                    bool isExists = System.IO.Directory.Exists(Server.MapPath("~/PropertyImages/SliderImages"));
                    if (!isExists)
                        System.IO.Directory.CreateDirectory(Server.MapPath("~/PropertyImages/SliderImages"));

                    file.SaveAs(path);
                    if (model.Id==0)
                    _properties.AddBannerImage(fileName,model.PlaceName, model.ImageDescription, model.Location,model.Latitude,model.Longitude);
                    else
                    {
                        _properties.UpdateBannerImage(model.Id,fileName, model.PlaceName, model.ImageDescription, model.Location, model.Latitude, model.Longitude);
                    }

                }
                catch (Exception ex)
                {
                    //throw new Exception(ex.Message);
                }

            }
            else
            {
               if (model.Id > 0)
               {
                   _properties.UpdateBannerImage(model.Id, string.Empty, model.PlaceName, model.ImageDescription, model.Location, model.Latitude, model.Longitude);
               }
            }

            return RedirectToAction("AddSliderImage");
        }

        public ActionResult OrderSliderImage(int id, int orderId)
        {
            _properties.OrderSliderImage(id, orderId);
            return RedirectToAction("AddSliderImage");
        }

        [HttpGet]
        public ActionResult AddRecommandation(int? id)
        {
            var model = new RecommendationModel { RecommendationList = new List<RecommendationModel>() };
            if (id != null)
            {
                var p = _properties.GetRecommandation((int)id);
                if (p != null)
                {
                    model.Id = p.Id;
                    model.Name = p.Name;
                    model.PhotoUrl = p.PhotoUrl;
                    model.Comments = p.Comments;
                    model.Email = p.Email;
                    model.Profession = p.Profession;
                }
            }

            var results = _properties.GetRecommandations().ToList();
            foreach (var p in results)
            {
                model.RecommendationList.Add(new RecommendationModel
                {
                    Id = p.Id,
                    Name = p.Name,
                    PhotoUrl = p.PhotoUrl,
                    Comments = p.Comments,
                  Email=p.Email,
                  Profession=p.Profession,

                });
            }
            return View(model);


        }

        [HttpPost]
        public ActionResult SaveRecommandation(RecommendationModel model, HttpPostedFileBase file)
        {
            if (file == null && model.Id == 0)
            {
                return RedirectToAction("AddRecommandation");
            }
            if (file != null && file.ContentLength > 0)
            {
                try
                {
                    var fileName = Path.GetFileName(file.FileName);
                    var path = Path.Combine(Server.MapPath("~/PropertyImages/Recommandation"), fileName);

                    //large&thumps images
                    bool isExists = System.IO.Directory.Exists(Server.MapPath("~/PropertyImages/Recommandation"));
                    if (!isExists)
                        System.IO.Directory.CreateDirectory(Server.MapPath("~/PropertyImages/Recommandation"));

                    file.SaveAs(path);
                    if (model.Id == 0)
                        _properties.AddRecommandation(fileName, model.Name, model.Comments,model.Email,model.Profession);
                    else
                    {
                        _properties.UpdateRecommandation(model.Id, fileName, model.Name, model.Comments, model.Email, model.Profession);
                    }

                }
                catch (Exception ex)
                {
                    //throw new Exception(ex.Message);
                }

            }
            else
            {
                if (model.Id > 0)
                {
                    _properties.UpdateRecommandation(model.Id, string.Empty, model.Name, model.Comments, model.Email, model.Profession);
                }
            }

            return RedirectToAction("AddRecommandation");
        }

        public ActionResult OrderRecommandation(int id, int orderId)
        {
            _properties.OrderSliderImage(id, orderId);
            return RedirectToAction("AddRecommandation");
        }
        public ActionResult RemoveRecommandation(int id)
        {
            _properties.RemoveBannerImage(id);
            return RedirectToAction("AddRecommandation");
        }

        [HttpPost]
        public ActionResult SaveYoutubeUrl(YoutubeUrlModel model, HttpPostedFileBase file)
        {
            if (file == null)
            {
                return RedirectToAction("AddSliderImage");
            }
            if (file.ContentLength > 0)
            {
                try
                {
                    var fileName = Path.GetFileName(file.FileName);
                    var id=_properties.AddYoutubeUrl(fileName, model.Url);

                    
                    fileName = fileName.ToLower().Replace(" ", "-");
                    var path = Path.Combine(Server.MapPath("~/PropertyImages/" + id + "/"), fileName);

                    //large&thumps images
                    bool isExists = System.IO.Directory.Exists(Server.MapPath("~/PropertyImages/" + id + "/"));
                    if (!isExists)
                        System.IO.Directory.CreateDirectory(Server.MapPath("~/PropertyImages/" + id + "/"));

                    file.SaveAs(path);
                }
                catch (Exception ex)
                {
                    //throw new Exception(ex.Message);
                }

            }
            return RedirectToAction("AddYoutubeUrl");
        }


        [HttpPost]
        public ActionResult SaveDiningImage(string Id,HttpPostedFileBase file)
        {
            if (file == null)
            {
                return RedirectToAction("MealTypes");
            }
            if (file.ContentLength > 0)
            {
                try
                {

                    var fileName = Path.GetFileName(file.FileName);
                    var path = Path.Combine(Server.MapPath("~/PropertyImages/DiningImages/" + Id.ToString()), fileName);

                   //images
                    bool isExists = System.IO.Directory.Exists(Server.MapPath("~/PropertyImages/DiningImages/" + Id.ToString()));
                    if (!isExists)
                        System.IO.Directory.CreateDirectory(Server.MapPath("~/PropertyImages/DiningImages/" + Id.ToString()));

                    file.SaveAs(path);
                    _properties.AddDiningImage(fileName, Convert.ToInt16(Id));

                }
                catch (Exception ex)
                {
                    //throw new Exception(ex.Message);
                }

            }
            return RedirectToAction("MealTypes");
        }


        public ActionResult RemoveSliderImage(int id)
        {
            _properties.RemoveBannerImage(id);
            return RedirectToAction("AddSliderImage");
        }

        public ActionResult RemoveYoutubeUrl(int id)
        {
            _properties.RemoveYoutubeUrl(id);
            return RedirectToAction("AddYoutubeUrl");
        }

         [HttpGet]
        public ActionResult Beds(int? bedId)
        {
            var bed = new BedModel { Beds = new List<BedModel>() };
             if (bedId != null)
             {
                 var data = _properties.GetBed((int) bedId);
                 if (data != null)
                 {
                     bed.Id = data.Id;
                     bed.BedName = data.BedName;
                     bed.Rate = data.Rate;
                     bed.Occupancy = data.Occupancy;
                     bed.ChildOccupancy = data.ChildOccupancy;
                 }                     

             }
       
            var results = _properties.GetBeds();
            foreach (var p in results)
            {
                bed.Beds.Add(item: new BedModel
                {
                    Id = p.Id,
                    BedName=p.BedName,
                    Rate=p.Rate,
                    Occupancy=p.Occupancy,
                    ChildOccupancy=p.ChildOccupancy,
                });
            }
            return View(bed);
        }

        [HttpPost]
        public ActionResult Beds(BedModel model)
         {
             if (ModelState.IsValid)
             {
                 var bed = new Bed
                     {
                         BedName = model.BedName,
                         Rate = model.Rate,
                         Occupancy = model.Occupancy,
                         ChildOccupancy = model.ChildOccupancy
                     };

                 if (model.Id == 0)
                 {
                     _properties.SaveBed(bed);
                     bed.Id = bed.Id;
                 }
                 else
                 {
                     bed.Id = model.Id;
                     _properties.UpdateBed(bed);
                 }
             }
             return RedirectToAction("Beds");//, new { id = model.Id });
        }

        public ActionResult DeleteBed(int id)
        {
            _properties.DeleteBed(id);
            return RedirectToAction("Beds");
        }

        public ActionResult BedForRoom(int roomId)
        {
            ViewBag.RoomId = roomId;
            var model = new List<BedRoomModel>();
            var bedRooms = _properties.GetBedRooms(roomId).AsEnumerable();
            var beds = _properties.GetBeds();
            foreach (var bed in beds)
            {
                var m = new BedRoomModel
                    {
                        Rate=bed.Rate,
                        RoomId = roomId,
                        BedId = bed.Id,
                        IsAllowed=false,
                        Bed=bed.BedName,
                        
                    };

                if (bedRooms.Any())
                {
                    var match = bedRooms.Where(q => q.BedId == bed.Id && q.RoomId == roomId).FirstOrDefault();
                    if (match != null)
                        m.IsAllowed = true;
                }
                model.Add(m);
            }
            return View(model);
        }
        public ActionResult SaveBedForRoom(string featureList, int roomId)
        {
            var ids = featureList.Split(',');

            _properties.DeleteBedsForRoom(roomId);
            
            foreach (var id in ids)
            {
                var r = new BedRoom
                    {
                        RoomId=roomId,
                        BedId=Convert.ToInt16(id),
                    };
                _properties.SaveBedForRoom(r);

            }
         
            return RedirectToAction("BedForRoom", new { roomId = roomId });
        }


        [HttpGet]
        public ActionResult AddActivity(int propertyId, int? id)
        {
            ViewBag.Property = PropertyName(propertyId);
            var model = new ActivityModel { Activities = new List<ActivityModel>(), PropertyId = propertyId };
           
            if (id != null)
            {
                var f = _properties.GetActivity((int)id);
                model.Id = f.Id;
                model.Name = f.Name;
                model.Description = f.Description;
                model.Rate = f.Rate;
                model.ChildRate = f.ChildRate;
                model.PropertyId = f.PropertyId;
            }
            var results = _properties.GetActivities(propertyId);
            foreach (var r in results)
            {
                model.Activities.Add(new ActivityModel
                {
                    Id = r.Id,
                    Name  = r.Name,
                    Description=r.Description,
                    PropertyId = r.PropertyId,
                   Rate=r.Rate,
                   ChildRate=r.ChildRate
                });
            }

            return View(model);
        }
        [HttpPost]
        public ActionResult AddActivity(ActivityModel model)
        {
            ViewBag.Property = PropertyName(model.PropertyId);
           
            var d = new Activity
            {
                Name=model.Name,
                Description=model.Description,
                PropertyId = model.PropertyId,
                Rate = model.Rate,
                ChildRate=model.ChildRate
            };

            if (ModelState.IsValid)
            {
                if (model.Id == 0)
                    _properties.SaveActivity(d);
                else
                {
                    d.Id = model.Id;
                    _properties.UpdateActivity(d);
                }

                return RedirectToAction("AddActivity", new { propertyId = model.PropertyId });
            }


            return View(model);
        }

        public ActionResult DeleteActivity(int id, int propId)
        {
            _properties.DeleteActivity(id);
            return RedirectToAction("AddActivity", new { propertyId = propId });
        }


        [HttpGet]
        public ActionResult Dinings(int? id)
        {
            var dining = new DiningRateModel { DiningRates = new List<DiningRateModel>() };
            if ( id!= null)
            {
                var data = _properties.GetDiningRate((int)id);
                if (data != null)
                {
                    dining.Id = data.Id;
                    dining.Name = data.Name;
                    dining.Rate = data.Rate;
                    dining.ChildRate = data.ChildRate;
                }

            }

            var results = _properties.GetDiningRates();
            foreach (var p in results)
            {
                dining.DiningRates.Add(item: new DiningRateModel
                {
                    Id = p.Id,
                    Name = p.Name,
                    Rate = p.Rate,
                    ChildRate = p.ChildRate,
                });
            }
            return View(dining);
        }

        [HttpPost]
        public ActionResult Dinings(DiningRateModel model)
        {
            if (ModelState.IsValid)
            {
                var dining = new DiningRate
                {
                    Name = model.Name,
                    Rate = model.Rate,
                    ChildRate = model.ChildRate
                };

                if (model.Id == 0)
                {
                    _properties.SaveDiningRate(dining);
                    dining.Id = dining.Id;
                }
                else
                {
                    dining.Id = model.Id;
                    _properties.UpdateDiningRate(dining);
                }
            }
            return RedirectToAction("Dinings");//, new { id = model.Id });
        }

        public ActionResult DeleteDining(int id)
        {
            _properties.DeleteDiningRate(id);
            return RedirectToAction("Dinings");
        }



        [HttpGet]
        public ActionResult Transport(int? id)
        {
            var transport = new TransportModel { Transports = new List<TransportModel>() };
            if (id != null)
            {
                var data = _properties.GetTransport((int)id);
                if (data != null)
                {
                    transport.Id = data.Id;
                    transport.Name = data.Name;
                    transport.Rate = data.Rate;
                    
                }

            }

            var results = _properties.GetTransports();
            foreach (var p in results)
            {
                transport.Transports.Add(item: new TransportModel
                {
                    Id = p.Id,
                    Name = p.Name,
                    Rate = p.Rate,
                    
                });
            }
            return View(transport);
        }

        [HttpPost]
        public ActionResult Transport(TransportModel model)
        {
            if (ModelState.IsValid)
            {
                var transport = new Transport
                {
                    Name = model.Name,
                    Rate = model.Rate,
                    
                };

                if (model.Id == 0)
                {
                    _properties.SaveTransport(transport);
                    transport.Id = transport.Id;
                }
                else
                {
                    transport.Id = model.Id;
                    _properties.UpdateTransport(transport);
                }
            }
            return RedirectToAction("Transport");//, new { id = model.Id });
        }

        public ActionResult DeleteTransport(int id)
        {
            _properties.DeleteTransport(id);
            return RedirectToAction("Transport");
        }

       public ActionResult Clients()
        {
            var model = (from c in _customerService.GetClients()
                         select new ClientViewModel
                             {
                                 ClientId=c.ClientId,
                                 Name=c.FirstName +" " +c.LastName,
                                 //IsActive=(bool)c.Active,
                                 Discount=c.Discount

                             }).AsEnumerable();


            return View(model);
        }

        public JsonResult GetDiscount(int id)
        {
            var discount = 0m;
            var client = _customerService.GetClient(id);
            if (client != null)
                discount = client.Discount;

            return Json(discount, JsonRequestBehavior.AllowGet);
        }

        public JsonResult UpadteDiscount(int id, decimal discount)
        {
            var client = _customerService.GetClient(id);
            if (client != null)
            {
                client.Discount = discount;
                _customerService.UpdateClient(client);
            }
            return Json("", JsonRequestBehavior.AllowGet);
        }
        #region private
        private string PropertyName(int id)
        {
            if (TempData["PropertyName"]==null)
            {
                var property = _properties.GetPropertyDetail(id);
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

        private string RoomName(int id)
        {
            if (TempData["RoomName"] == null)
            {
                var property = _properties.GetRoom(id);
                if (property != null)
                {
                    TempData["RoomName"] = property.Name;
                    ViewBag.Property = property.Name;
                }
            }
            else
            {
                ViewBag.Property = TempData["RoomName"];
            }

            return TempData["RoomName"].ToString();
        }
        private void PreLoadData()
        {
            var properties = _properties.GetHotelsList();
            properties = properties.Where(q => q.Id != 0).ToList();
            ViewBag.Properties = new SelectList(properties, "Id", "Name");
        }
        #endregion

    }
}
