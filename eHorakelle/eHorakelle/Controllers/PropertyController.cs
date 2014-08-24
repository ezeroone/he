using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web.Mvc;
using System.Web.Security;
using eZeroOne.Common;
using eZeroOne.Domain;
using eZeroOne.MailService;
using eZeroOne.Service.Customers;
using eZeroOne.Service.Property;
using eZeroOne.Service.Visitors;
using eZeroOne.Service.Repository;
using eZeroOne.Service.Users;
using eZeroOne.eHorakelle.Models;
using PointOfInterest = eZeroOne.eHorakelle.Models.PointOfInterest;

namespace eZeroOne.eHorakelle.Controllers
{
    public class PropertyController : BaseController
    {
        private readonly IProperties _properties;
        private readonly IUserService _userService;
        private readonly ICustomerService _customerService;
        private readonly IVisitorService _visitor;

        // GET: /Property/
        public PropertyController(IRepository repository, IUnitOfWork unitOfWork)
        {
            _properties = new Properties(repository, unitOfWork);
            _userService = new UserService(repository, unitOfWork);
            _customerService = new CustomerService(repository, unitOfWork);
            _visitor = new VisitorService(repository, unitOfWork);
        }

        public ActionResult Search()
        {
            PreLoadData();
            return View();
        }
        public ActionResult SearchResults()
        {
            return View();
        }
        public ActionResult Properties()
        {
            return View();
        }
        public ActionResult PropertyDetail(int id)
        {
            var model = new PropertyModel
                {
                    Images = new List<ImageModel>(),
                    Features = new List<Features>(),
                    Places = new List<PlaceModel>(),
                    Meals=new List<DiningModel>(),
                    PoIs=new List<PointOfInterest>(),
                    Translators=new List<TranslatorModel>(),
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
                model.MainCityName = _properties.GetDistrict((int)property.MainCity).City;

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

                model.AboutOwner = property.AboutOwner??"N/A";
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
                        Description=p.Description
                    };

                    item.Places.Add(pl);
                }
            }
            model.Places = plsColl;

        
            var meals = _properties.GetMeals(id);
            var cuisines = _properties.GetCuisines().OrderBy(q=>q.DisplayOrder);
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
                        DefaultImage = (bool) i.DefaultImage,
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
                            Id=t.Id,
                            Name=t.Name,
                            Landline=t.Landline,
                            Mobile=t.Mobile,
                            Language=t.Language,
                            ImageName = !string.IsNullOrWhiteSpace(t.ImageName) ? "/PropertyImages/" + t.PropertyId + "/thumbs/translator/" + t.Id + "/" + t.ImageName : "/Content/img/defaultphoto.gif"
                        });
            }

            ViewBag.ReviewComments = GetReviewComments(id);

            return View(model);
        }

        public ActionResult SearchHotels()
        {
            var cities = _properties.GetLocationList();
            ViewBag.LocationList = new SelectList(cities, "Id", "City");

            string[] radiusList = new string[] { "5", "10", "15", "20" };
            SelectList list = new SelectList(radiusList);
            ViewBag.RadiusList = list;

            var acmTypes = _properties.GetAccomodationTypeList();
            ViewBag.AccomodationTypeList = new SelectList(acmTypes, "Id", "Name");

            var acmStandards = _properties.GetAccomodationStandardList();
            ViewBag.AccomodationStandardList = new SelectList(acmStandards, "Id", "Name");

            string[] roomsList = new string[] { "1", "2", "3", "4" };
            ViewBag.RoomList = new SelectList(roomsList);

            var poiList = _properties.GetPointOfInterestList().ToList();
            var pl = poiList.Select(item => new PointOfInterest {Id = item.Id, Name = item.Name}).ToList();

            ViewBag.POTList = pl;

            var featureList = _properties.GetFeatureList().ToList();
            var fl = featureList.Select(item => new Features {Id = item.Id, Name = item.Name}).ToList();
            ViewBag.FeatureList = fl;

            return View("SearchHotels");
        }

        public ActionResult GetFilteredHotelData(HotelSearchModel filter,string poiList,string featureList)
       {
           var result = new List<Property>();
           var query = filter.Location;
            if (!string.IsNullOrWhiteSpace(query))
                query = query.ToLower();

           var desig = _properties.GetDesignation(filter.DesignationId);
           
           result = _properties.GetHotelsList().ToList().Where(q=>q.IsApproved).ToList();

           if (filter.AccomodationTypeId > 0)
               result = result.Where(q => q.AccommodationType == filter.AccomodationTypeId).ToList();

           if (filter.AccomodationStandardId > 0)
               result = result.Where(q => q.AccommodationStandard == filter.AccomodationStandardId
                      ).ToList();
            
           if (!string.IsNullOrWhiteSpace(query))
               result = result.Where(q => (q.Description != null && q.Description.ToLower().ToLower().Contains(query))
                   || (q.Name != null && q.Name.ToLower().Contains(query))
                   || (q.Adderss != null && q.Adderss.ToLower().Contains(query))
                   || (q.Street != null && q.Street.ToLower().Contains(query))
                   || (q.City != null && q.City.ToLower().Contains(query))).ToList();


           if (desig != null)
           {
               result = result.Where(q => (q.OwnerDesignation != null && q.OwnerDesignation.Contains(desig.Name))).ToList();
           }
           if (filter.LocationId > 0)
               result = result.Where(q => q.MainCity == filter.LocationId).ToList();

           if (filter.No_ofRooms > 0)
               result = result.Where(q => q.NoOfRooms >= filter.No_ofRooms
            ).ToList();


           if (filter.PriceTo != 0)
               result = result.Where(q => (q.DisplayPrice >= filter.PriceFrom && q.DisplayPrice <= filter.PriceTo)).ToList();
         

           var result1 = result;

           string[] pois = poiList.Split(',');
           int flag1 = 0;
           //for (int i = 0; i < pois.Count(); i++)
           //{
           //    var poiresult = result1.Where(q => q.Interests.Contains(pois[i].ToLower())).ToList();
           //    if (poiresult.Any())
           //    {
           //        result1 = poiresult;
           //        flag1 = flag1 + 1;
           //    }
           //}

           //result = flag1 == pois.Count() ? result1 : new List<Property>();

           var result2 = result;

           string[] features = featureList.Split(',');
           int flag2 = 0;
           for (int k = 0; k < features.Count(); k++)
           {
               if (!string.IsNullOrWhiteSpace(features[k]))
               {
                   var ftresult = result2.Where(q => q.Features.Contains(features[k].ToLower())).ToList();
                   if (ftresult.Any())
                   {
                       result2 = ftresult;
                       flag2 = flag2 + 1;
                   }
               }
              
           }

            result = result2;// flag2 == features.Count() ? result2 : new List<Property>(); 

            var cityObj = _properties.GetLocationList().Where(x => x.Id == filter.LocationId).FirstOrDefault();

            //use this for load the result partial view
            TempData["FilteredResults"] = result;
            return Json(new { city = cityObj, hotels = result, radius = filter.Radius == 52 ? 100 : filter.Radius });
        }
        public ActionResult GetPropertylocation(int propertId)
        {
            var result = new List<PlaceModel>();

            var places = _properties.GetPlaces(propertId);
            foreach (var p in places)
            {
                result.Add(new PlaceModel
                {
                    Id = p.Id,
                    PropertyId = p.PropertyId,
                    PlaceName = p.PlaceName,
                    Latitude = p.Lat,
                    Longitude = p.Long,
                    Distance = p.Distance,
                    TimeTake = p.TimeTake,
                    TravelBy = ""//p.TravelBy

                });
            }

            var property = _properties.GetPropertyDetail(propertId);
            var cityObj = new LatLong
                {
                    Latitude = (decimal) property.Latitude,
                    Name=property.Name,
                    VideoUrl=!string.IsNullOrWhiteSpace(property.VideoUrl)?property.VideoUrl:"",
                    Longitude=(decimal) property.Longitude
                };

            var mainCity = _properties.GetMainCity((int) property.MainCity);
            var districtObj = new LatLong
            {
                Latitude = mainCity!=null?(decimal) mainCity.Latitude:0,
                Name = mainCity != null ? mainCity.City : property.Name,
                Longitude = mainCity!=null?(decimal)mainCity.Longitude:0
            };

            return Json(new { city = cityObj, hotels = result, radius = 5, district = districtObj });
        }

        private void PreLoadData()
        {
            var cities = _properties.GetLocationList();
            ViewBag.LocationList = new SelectList(cities, "Id", "City");

            var designation = _properties.GetDesignationList();
            ViewBag.Designations = new SelectList(designation, "Id", "Name");


            var radius = new List<NameValue>
                {
                    new NameValue
                        {
                            Id = 0,
                            Name = "This area only"
                        },
                     new NameValue
                        {
                            Id = 1,
                            Name = "Within 1 Km"
                        },
                  new NameValue
                        {
                            Id = 2,
                            Name = "Within 2 Km"
                        },
                    new NameValue
                        {
                            Id = 3,
                            Name = "Within 3 Km"
                        },
                   new NameValue
                        {
                            Id = 4,
                            Name = "Within 4 Km"
                        },
                    new NameValue
                        {
                            Id = 5,
                            Name = "Within 5 Km"
                        },
                    new NameValue
                        {
                            Id = 10,
                            Name = "Within 10 Km"
                        }
                        ,
                    new NameValue
                        {
                            Id = 15,
                            Name = "Within 15 Km"
                        }
                        ,
                    new NameValue
                        {
                            Id = 20,
                            Name = "Within 20 Km"
                        }
                        ,
                    new NameValue
                        {
                            Id = 25,
                            Name = "Within 25 Km"
                        },
                    new NameValue
                        {
                            Id = 30,
                            Name = "Within 30 Km"
                        },
                    new NameValue
                        {
                            Id = 40,
                            Name = "Within 40 Km"
                        },
                    new NameValue
                        {
                            Id = 50,
                            Name = "Within 50 Km"
                        },
                    new NameValue
                        {
                            Id = 51,
                            Name = "Above 50 Km"
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

            var properties = _properties.GetHotelsList().ToList().Where(q => q.IsApproved).ToList();
            var acmTypes = _properties.GetAccomodationTypeList();

            var accTypelist = new List<AccommodationType>();

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

            ViewBag.AccomodationTypeList = new SelectList(accTypelist, "Id", "Name");

            //count based on district
            var mainCitylist = new List<MainCity>();

            foreach (var t in cities)
            {
                if (t.Id != 0)
                {
                    var count = properties.Count(q => q.MainCity == t.Id);
                    var name = t.City + " (" + count + ")";
                    mainCitylist.Add(new MainCity
                    {
                        Id = t.Id,
                        City = name
                    });
                }
                //else
                //{
                //    var name = t.City;
                //    mainCitylist.Add(new MainCity
                //    {
                //        Id = t.Id,
                //        City = name
                //    });
                //}

            }

            mainCitylist = mainCitylist.OrderBy(o => o.City).ToList();
            var city = new MainCity
            {
                Id = 0,
                City = " Select the location"

            };
            mainCitylist.Insert(0, city);

            ViewBag.LocationList = new SelectList(mainCitylist, "Id", "City");

            var acmStandards = _properties.GetAccomodationStandardList();
            ViewBag.AccomodationStandardList = new SelectList(acmStandards, "Id", "Name");

            //string[] roomsList = new string[] { "1", "2", "3", "4" };
            var rooms = new List<NameValue>
                {
                    new NameValue
                        {
                            Id = 0,
                            Name = "---Any---"
                        },
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

            var poiList = _properties.GetPointOfInterestList().ToList();
            var pl = poiList.Select(item => new PointOfInterest { Id = item.Id, Name = item.Name }).ToList();

           // ViewBag.POTList = new SelectList(poiList, "Id", "Name");
            ViewBag.POTList = pl;

            var featureList = _properties.GetFeatureList().ToList();
            var fl = featureList.Select(item => new Features { Id = item.Id, Name = item.Name }).ToList();

           //FeatureGroup

            var featureGroup = new List<FeatureGroup>();

            var groups = _properties.FeatureCategories().OrderBy(o=>o.Name).ToList();
            foreach (var featureCategory in groups)
            {
                var feaList = new FeatureGroup
                    {
                        Features = new List<Features>(),
                        Id = featureCategory.Id,
                        GroupName = featureCategory.Name
                    };

                var _features=new List<Features>();
                foreach (var fea in featureList.Where(q=>q.GroupId==featureCategory.Id))
                {
                    _features.Add(new Features
                        {
                            Id=fea.Id,
                            Name=fea.Name,
                            IsChecked = false
                        });
                }

                feaList.Features = _features;
                featureGroup.Add(feaList);
                
            }
            //ViewBag.FeatureList = new SelectList(featureList, "Id", "Name");

            ViewBag.FeatureGroup = featureGroup;
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

        public ActionResult SearchResult(int? page)
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
                            PropertyUrl = string.Format("/{0}/{1}", "Property", "PropertyDetail?id=" + p.Id),
                            Images = new List<ImageModel>(),
                            Features = new List<Features>(),
                            Places = new List<PlaceModel>(),
                            Meals = new List<DiningModel>(),
                            PoIs = new List<PointOfInterest>(),
                            ContactPerson1 = p.ContactPerson1,
                            MobilePrimary = p.MobilePrimary,
                            MobileSecondary = p.MobileSecondary,
                            LandLinePrimary = p.LandLinePrimary,
                            LandLineSecondary = p.LandLineSecondary,
                            ContactPerson2 = p.ContactPerson2,
                            Adderss = p.Adderss,
                            Street = p.Street,
                            City = p.City,
                            Squarefeet = (decimal)p.Squarefeet,
                            FeatureList=p.Features,
                            PoiList=p.Interests,
                            MainCityName = _properties.GetDistrict((int)p.MainCity).City
                        };

                        var images = _properties.Images(p.Id).FirstOrDefault();
                        property.DefaultImageUrl = "/Content/img/demo/apt/apt1.jpg";
                        if (images != null)
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

        public ActionResult Booking(int propertyId)
        {
            var model = new BookingModel();
            var property = _properties.GetPropertyDetail(propertyId);
            var visitorId = 0;
            if (User.Identity.IsAuthenticated)
            {
                var user = _userService.GetUser(User.Identity.Name, 1);
                if (user != null)
                    visitorId = user.UserId;
            }
            if (property != null)
            {
                model.PropertyId = property.Id;
                model.ClientId = (int) property.ClientId;
                model.VisitorId = visitorId;

                model.Name = property.Name;
                model.NoOfRooms = property.NoOfRooms;
                model.Description = property.Description;
                model.DisplayPrice = property.DisplayPrice;
                
                model.ContactPerson1 = property.ContactPerson1;
                model.MobilePrimary = property.MobilePrimary;
                model.MobileSecondary = property.MobileSecondary;
                model.LandLinePrimary = property.LandLinePrimary;
                model.LandLineSecondary = property.LandLineSecondary;
                model.ContactPerson2 = property.ContactPerson2;
                model.Adderss = property.Adderss;
                model.Street = property.Street;
                model.City = property.City;
                model.Latitude = (decimal) property.Latitude;
                model.Longitude = (decimal) property.Longitude;
                model.Squarefeet = (decimal)property.Squarefeet;
                model.BookingFrom = DateTime.Now.ToString("dd/MM/yyyy");
                model.BookingTo = DateTime.Now.AddDays(1).ToString("dd/MM/yyyy");
            }
            return View(model);
        }

        public JsonResult Book(int propertyId, string  frmDate, string toDate,decimal price,int days)
        {
            var property = _properties.GetPropertyDetail(propertyId);
            var visitorId = 0;
            if (User.Identity.IsAuthenticated)
            {
                var user = _userService.GetUser(User.Identity.Name, 1);
                if (user != null)
                {
                    visitorId = user.UserId;
                    if (property != null && visitorId > 0)
                    {
                        var booking = new Booking
                        {
                            PropertyId = propertyId,
                            VisitorId = visitorId,
                            CustomerId = (int)property.ClientId,
                            DateFrom = Convert.ToDateTime(frmDate),
                            DateTo = Convert.ToDateTime(toDate),
                            Amount = price,
                            Discount = 0,
                            Tax = 0

                        };

                        var booked = _properties.MakeBooking(booking);
                        if (booked)
                        {
                            var url = "";
                            try
                            {
                                var clientName = _userService.GetUser((int)property.ClientId).FirstName;

                                EmailService.SendbookingEmail(url, user.Email, string.Format("{0} {1}", user.FirstName, user.LastName), clientName, propertyId, frmDate,toDate,days,price.ToString());

                            }
                            catch (Exception)
                            {
                                
                            }
                         
                        }

                    }
                }

            }
           
            return Json("", JsonRequestBehavior.AllowGet);
        }

        public JsonResult PreBook(int propertyId, string frmDate, string toDate)
        {
            var property = _properties.GetPropertyDetail(propertyId);
            var retString = "proceed";
            if (User.Identity.IsAuthenticated)
            {
                var user = _userService.GetUser(User.Identity.Name, 1);
                if (user != null)
                {
                    if (property != null && user.UserId > 0)
                    {
                        var r = _properties.CheckBookingDates(propertyId, Convert.ToDateTime(frmDate), Convert.ToDateTime(toDate));
                        if (r)
                        {
                            var room = _properties.GetRoom(propertyId);
                            if (room!=null)
                            retString = room.Name +" is already booked";

                        }
                           
                    }

                }

            }
            else
            {
                retString = "login";
            }

            return Json(retString, JsonRequestBehavior.AllowGet);
        }

        public ActionResult BookingSuccess()
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
                        var count = properties.Count(q => q.MainCity == distriictId && q.AccommodationType == t.Id);
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

        public JsonResult GetFileredAccomodationStandard(int distriictId, int accoType)
        {
            var properties = _properties.GetHotelsList().ToList().Where(q => q.IsApproved).ToList();
            
            var acmStandards = _properties.GetAccomodationStandardList();
            var acmStandardlist = new List<AccommodationStandard>();

            if (distriictId == 0 && accoType > 0)
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

        public JsonResult GetFileredOccupation(int distriictId)
        {
            var properties = _properties.GetHotelsList().ToList().Where(q => q.IsApproved && q.MainCity == distriictId).ToList();
            var designations = _properties.GetDesignationList();
           
            var desic = new Designation
            {
                Id = 0,
                Name = "--- Any --- "

            };
            
            var enumerable = designations as Designation[] ?? designations.ToArray();
            if (distriictId > 0)

            {
                var desigs = (from d in enumerable
                              join p in properties on d.Name equals p.OwnerDesignation
                              select d).Distinct().ToList();

                var l = desigs.OrderBy(o => o.Name).ToList();
                l.Insert(0, desic);
                return Json(l, JsonRequestBehavior.AllowGet);
            }
                
            return Json(enumerable.OrderBy(o => o.Name).ToList(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddReviewComment(string userName,string email,string comment,int propertyId)
        {
            if (User.Identity.IsAuthenticated)
            {
                var userEmail = User.Identity.Name;
                var user = _userService.GetUser(userEmail, 1);
                if (user != null)
                {
                    _properties.AddReviewComments(user.UserId, comment, propertyId);
                }
            }
            
            return Json("", JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetReviewComment(int id)
        {
            var r = new ReviewModel();
            var result = _properties.GetReview(id);
            if (result != null)
            {
                var user = _userService.GetUser(result.VisitorId);
                if (user != null)
                {
                    r = new ReviewModel
                    {
                        Id = result.Id,
                        Name = string.Format("{0} {1}", user.FirstName, user.LastName),
                        Email = user.Email,
                        Comment = result.Comments
                    };

                }
            }
            
            return Json(r, JsonRequestBehavior.AllowGet);
        }

        public IEnumerable<ReviewModel> GetReviewComments(int propertyId)
       {
           var comments = new List<ReviewModel>();

           var results = _properties.GetReviewComments(propertyId);
           foreach (var visitorReview in results)
           {
               var user = _userService.GetUser(visitorReview.VisitorId);
               if(user!=null)
               {
                   var r = new ReviewModel
                   {
                       Id =visitorReview.Id,
                       Name= string.Format("{0} {1}",user.FirstName,user.LastName),
                       Email=user.Email,
                       Comment=visitorReview.Comments
                   };
                   comments.Add(r);
               }
            
           }
           return comments;
       }
       
        //Booking Steps
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChooseDate()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult ChooseDate(BookingModel model)
        {
         
            return  RedirectToAction("ChooseRoom");
            //return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChooseRoom(string checkIn,string checkOut,int adult,int child,int yrsbelow)
        {
            var chkDate = string.IsNullOrWhiteSpace(checkIn) ? DateTime.Now : Convert.ToDateTime(checkIn);
            var chkOutDate = string.IsNullOrWhiteSpace(checkOut) ? DateTime.Now.AddDays(1) : Convert.ToDateTime(checkOut);

           
            var availableRooms = new BookingRoomModel
                 {
                     CheckIn=chkDate,
                     CheckOut=chkOutDate,
                     Adult=adult,
                     Children= child,
                     Below6Yrs= yrsbelow,
                     Rooms = new List<RoomModel>()
                 };

            var results = _properties.GetAvailableRooms(checkIn, checkOut, adult, child, yrsbelow).Distinct();
            foreach (var r in results)
            {
                 var imgUrl = "";
                 var img = r.RoomImages.FirstOrDefault();
                 if (img != null)
                     imgUrl = "/RoomImages/" + r.Id + "/thumbs/" + img.ImagePath;

                 var m = new RoomModel
                     {
                         Id=r.Id,
                         Name=r.Name,
                         Description=r.Description,
                         DisplayPrice=r.DisplayPrice,
                         Squarefeet=r.Squarefeet,
                         DefaultImageUrl = imgUrl,
                         Beds=new List<BedModel>()

                     };

                 foreach (var b in r.BedRooms)
                 {
                     var bed = new BedModel
                     {
                         Id=b.Bed.Id,
                         BedName=b.Bed.BedName,
                         Occupancy=b.Bed.Occupancy,
                         ChildOccupancy=b.Bed.ChildOccupancy,
                         Rate=b.Bed.Rate

                     };
                     m.Beds.Add(bed);
                 }
                 var defaultRate = m.Beds.OrderBy(o => o.Rate).FirstOrDefault();
                 if (defaultRate != null)
                 {
                     m.DisplayPrice = defaultRate.Rate;
                     m.Occupancy = defaultRate.Occupancy;
                     m.ChildOccupancy = defaultRate.ChildOccupancy;
                 }
                availableRooms.Rooms.Add(m);
             }

            return View(availableRooms);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult ChooseRoom(BookingModel model)
         {
            // return View();
             return RedirectToAction("Payment");
         }

        public ActionResult BookingConfirmation()
        {
            var model = new BookingFlowModel();
            ViewBag.TempData = null;
            ViewBag.PriceBreakDowns = null;
            var booingModel = new TempBooking();
            if (TempData["BookingData"] != null)
            {
                var tempData = (TempBooking)TempData["BookingData"];
                booingModel = tempData;
                ViewBag.TempData = TempData["BookingData"];
            }
            else
            {
                if (HttpContext.Session != null)
                {
                    var temp = HttpContext.Session["TempData"];
                    var tempData = (TempBooking)temp;
                    booingModel = tempData;
                    TempData["BookingData"] = tempData;
                    ViewBag.TempData = tempData;
                }

            }

            if (booingModel.Rooms.Any())
            {
                ViewBag.PriceBreakDowns = GetPriceBreakDowns(booingModel.CheckIn.ToShortDateString(),
                                                               booingModel.CheckOut.ToShortDateString(),
                                                               booingModel.Adult, booingModel.Children,
                                                               booingModel.Below6Yrs, booingModel.Rooms,
                                                               booingModel.ExtraBeds, booingModel.DiningsByDays,
                                                               booingModel.ActivitiesByDays, booingModel.Transports);

            }
           return View();
        }
        
        public ActionResult Dinings(string checkIn, string checkOut, int adult, int child, int yrsbelow)//,string [] rooms,string []extra)
        {
            ViewBag.TempData = null;
            if (TempData["BookingData"] != null)
            {
                var tempData = (TempBooking) TempData["BookingData"];
                ViewBag.TempData = TempData["BookingData"];
            }
            else
            {
                if (HttpContext.Session != null)
                {
                    var temp = HttpContext.Session["TempData"];
                    var tempData = (TempBooking)temp;
                    TempData["BookingData"] = tempData;
                    ViewBag.TempData = tempData;
                }
               
            }

            var estate = _properties.GetHotelsList().FirstOrDefault();
            var cuisines = _properties.GetCuisines().OrderBy(q => q.DisplayOrder);
            var dinings = new List<DiningModel>();
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

                  dinings.Add(mealMod);
                }
            }


            var diningColls = _properties.GetDiningRates();
            var diningModel = new List<DiningModel>();
            foreach (var d in diningColls)
            {
                var mdl = new DiningModel
                {
                    Id = d.Id,
                    MealType = d.Name,
                    Price = d.Rate,
                    ChildPrice = d.ChildRate
                };

                diningModel.Add(mdl);

            }
            ViewBag.Dinings = diningModel;
            return View(dinings);
        }

        public ActionResult Activities(string checkIn, string checkOut, int adult, int child, int yrsbelow)//,string [] rooms,string []extra)
        {
            ViewBag.TempData = null;
            if (TempData["BookingData"] != null)
            {
                var tempData = (TempBooking)TempData["BookingData"];
                ViewBag.TempData = TempData["BookingData"];
            }
            else
            {
                if (HttpContext.Session != null)
                {
                    var temp = HttpContext.Session["TempData"];
                    var tempData = (TempBooking)temp;
                    TempData["BookingData"] = tempData;
                    ViewBag.TempData = tempData;
                }

            }

            var estate = _properties.GetHotelsList().FirstOrDefault();
            var activities = new List<ActivityModel>();
            if (estate != null)
            {
                foreach (var a in estate.Activities)
                {
                    var act = new ActivityModel
                    {
                        Id = a.Id,
                        Name = a.Name,
                        Description = a.Description,
                        PropertyId = a.PropertyId,
                        Rate = a.Rate,
                        ChildRate = a.ChildRate
                    };
                    activities.Add(act);
                }
            }

            var dinings = _properties.GetDiningRates();
            var diningModel = new List<DiningModel>();
            foreach (var d in dinings)
            {
                var mdl = new DiningModel
                    {
                        Id=d.Id,
                        MealType = d.Name,
                        Price = d.Rate,
                        ChildPrice=d.ChildRate
                    };

                diningModel.Add(mdl);

            }
            ViewBag.Dinings = diningModel;

            var transports = _properties.GetTransports();
            var transModel = new List<TransportModel>();
            foreach (var t in transports)
            {
                var trans = new TransportModel
                {
                    Id =t.Id,
                    Name=t.Name,
                    Rate=t.Rate
                };

                transModel.Add(trans);

            }
            ViewBag.Transports = transModel;
            return View(activities);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Payment(string checkIn, string checkOut, int adult, int child, int yrsbelow)
        {
            var model = new BookingFlowModel();

            ViewBag.TempData = null;
            ViewBag.PriceBreakDowns = null;
            var booingModel = new TempBooking();
            if (TempData["BookingData"] != null)
            {
                var tempData = (TempBooking)TempData["BookingData"];
                booingModel = tempData;
                ViewBag.TempData = TempData["BookingData"];
            }
            else
            {
                if (HttpContext.Session != null)
                {
                    var temp = HttpContext.Session["TempData"];
                    var tempData = (TempBooking)temp;
                    booingModel = tempData;
                    TempData["BookingData"] = tempData;
                    ViewBag.TempData = tempData;
                }

            }

            if (booingModel.Rooms.Any())
            {
                ViewBag.PriceBreakDowns = GetPriceBreakDowns(checkIn, checkOut, adult, child, yrsbelow, booingModel.Rooms, booingModel.ExtraBeds, booingModel.DiningsByDays,
                                              booingModel.ActivitiesByDays,booingModel.Transports);

                var totPrice = ViewBag.TotalPrice;
                var afterDicount = ViewBag.AfterDiscountPrice;
                model.TotalAmount = (decimal)totPrice;
                model.DiscountAmount = (decimal)totPrice - (decimal)afterDicount;

                if (User.Identity.IsAuthenticated)
                {
                    // get user information
                    model.UserId = GetUserId(User.Identity.Name);
                    var user = _userService.GetUser(model.UserId);
                    model.RoleId = user.RoleId;

                    #region Getting Quest information

                    // client
                    if(user.RoleId == 2)
                    {
                        var client = _customerService.GetClientUserId(user.UserId);
                        if (client == null) { client = new Client(); }
                        model.FirstName = client.FirstName;
                        model.LastName = client.LastName;
                        model.Email = client.Email;
                        model.Phone = client.Phone;
                        model.Adderss = client.Address;
                        model.City = client.City;
                        model.Street = client.Street;
                        model.Country = "Sri Lanka";
                        model.ZipCode = client.Zip;
                    } 
                    else if (user.RoleId == 3)
                    {
                        var visitor = _visitor.GetVisitorbyUser(user.UserId);
                        if (visitor == null) { visitor = new Visitor(); }
                        model.FirstName = visitor.FirstName;
                        model.LastName = visitor.LastName;
                        model.Email = visitor.Email;
                        model.Phone = visitor.Phone;
                        model.Adderss = visitor.Address;
                        model.City = visitor.City;
                        model.Street = visitor.Street;
                        model.Country = "Sri Lanka";
                        model.ZipCode = visitor.Zip;
                    }

                    #endregion
                }
                
                model.ItemDescription=GetUserName()+" has booked room(s) at horakelle estate from " + checkIn + " to " + checkOut;
            }
            return View(model);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Payment(BookingFlowModel model)
        {
            TempData["ErroMsg"] = string.Empty;
            var booingModel = new TempBooking();
            if (TempData["BookingData"] != null)
            {
                var tempData = (TempBooking)TempData["BookingData"];
                booingModel = tempData;
                ViewBag.TempData = TempData["BookingData"];
            }
            else
            {
                if (HttpContext.Session != null)
                {
                    var temp = HttpContext.Session["TempData"];
                    var tempData = (TempBooking)temp;
                    booingModel = tempData;
                    TempData["BookingData"] = tempData;
                    ViewBag.TempData = tempData;
                }

            }

            if (model.UserId > 0)
            {

                #region Save quest information

                if (model.RoleId == 2) { _customerService.UpdateClient(model.GetClientInfo(_customerService.GetClientUserId(model.UserId))); }
                else if (model.RoleId == 3) { _visitor.SaveVisitor(model.GetVisitorInfo(_visitor.GetVisitorbyUser(model.UserId))); }

                #endregion


                if (booingModel.Rooms.Any())
                {

                     ViewBag.PriceBreakDowns = GetPriceBreakDowns(booingModel.CheckIn.ToShortDateString(),
                                                                booingModel.CheckOut.ToShortDateString(),
                                                                booingModel.Adult, booingModel.Children,
                                                                booingModel.Below6Yrs, booingModel.Rooms,
                                                                booingModel.ExtraBeds, booingModel.DiningsByDays,
                                                                booingModel.ActivitiesByDays, booingModel.Transports);

                    if (booingModel.Rooms.Any())
                    {
                        var totPrice = ViewBag.TotalPrice;
                        var payingAmount = ViewBag.AfterDiscountPrice;
                        var discountAmount = totPrice - payingAmount;

                        model.TotalAmount = (decimal)totPrice;
                        model.DiscountAmount = (decimal)discountAmount;

                        var invoice = new Invoice();
                        var paidAmount = model.PayFull?totPrice:payingAmount;

                       var booked= Booking(booingModel.CheckIn.ToShortDateString(), booingModel.CheckOut.ToShortDateString(),
                                booingModel.Adult, booingModel.Children, booingModel.Below6Yrs,
                                booingModel.Rooms.Count(), totPrice, payingAmount, discountAmount, 0, 2, out invoice);

                       if (booked && invoice.Id> 0)
                        {
                            foreach (var r in booingModel.Rooms)
                            {
                                var arry = r.Split('-');
                                var roomId = Convert.ToInt16(arry[0]);
                                BookRooms(roomId, 1, model.UserId, booingModel.CheckIn, booingModel.CheckOut, invoice);

                            }
                    
                        }

                       // Email user invoice, before goging to payment

                       #region Email Invoice

                       var emailInvoice = new EmailInvoiceDetails();
                       emailInvoice.CustomerName = model.FirstName + " " + model.LastName;
                       emailInvoice.Email = model.Email;
                       emailInvoice.InvoiceId = invoice.Id.ToString();
                       emailInvoice.InvoicedDate = DateTime.Now;
                       emailInvoice.TotalAmount = invoice.TotalAmount;
                       emailInvoice.TotalDiscount = invoice.Discount;
                       emailInvoice.TotalTax = invoice.Tax;
                       emailInvoice.BillAmount = invoice.BillAmount;

                       var daywisebilling = (List<DayWiseRate>)ViewBag.PriceBreakDowns;
                       foreach (var dayitem in daywisebilling)
                       {
                           var newItem = new ItemDetails()
                           {
                               Discount = 0,
                               ItemName = dayitem.Date.ToShortDateString(),
                               Price = dayitem.Rate,
                               Qty = 1,
                               Tax = 0,
                               Total = dayitem.Rate
                           };

                           emailInvoice.ItemDetails.Add(newItem);
                       }

                       EmailService.SendInvoiceDetails(emailInvoice);

                       #endregion

                        return RedirectToAction("PayPalPayment", new { checkIn = booingModel.CheckIn.ToShortDateString(), checkOut = booingModel.CheckOut.ToShortDateString(), userName = model.ItemDescription, amount = model.TotalAmount,companyId=1, invoiceId = invoice.Id });
         
                    }
                    
                }
            }

            TempData["ErroMsg"] = "Invalid User, Booking process cancelled.";
            //ModelState.AddModelError("Invalid", "E-mail is already existing...");
            //return View(model);

            //return RedirectToAction("Main", new RouteValueDictionary(new { controller = controllerName, action = "Main", Id = Id }));
            return RedirectToAction("BookingConfirmation");
        }

        public JsonResult BookingData(string checkIn, string checkOut, int adult, int child, int yrsbelow, List<string> rooms, List<string> extra)
        {
            var sessionId = string.Empty;
            var valStr = "stored";
            if (HttpContext.Session != null)
            {
                sessionId=HttpContext.Session.SessionID;
            }
            var temp = new TempBooking
                {
                    SessionId=sessionId,
                    CheckIn=Convert.ToDateTime(checkIn),
                    CheckOut=Convert.ToDateTime(checkOut),
                    Adult=adult,
                    Children=child,
                    Below6Yrs=yrsbelow,
                    Rooms=rooms,
                    ExtraBeds = extra
                };

           
            //var totAdults = 0;
            //var totChilds = 0;
            //var totKids = 0;

            if (rooms != null)
                foreach (var r in rooms)
                {
                    //var arry = r.Split('-');
                    //var roomId = Convert.ToInt16(arry[0]);
                    //var exist= _properties.CheckBookingDates(roomId, Convert.ToDateTime(checkIn), Convert.ToDateTime(checkOut));
                    //if (exist)
                    //{
                    //    var room = _properties.GetRoom(roomId);
                    //    if (room != null)
                    //    {
                    //        if (string.IsNullOrWhiteSpace(valStr))
                    //        valStr = room.Name + " is already booked";
                    //        else
                    //        {
                    //            valStr =valStr +", " + room.Name + " is already booked";
                    //        }

                    //    }
                       
                    //}


                }

            TempData["BookingData"] = temp;
            
            if (HttpContext.Session != null)
            HttpContext.Session.Add("TempData", temp);

            return Json(valStr, JsonRequestBehavior.AllowGet);
        }

        public JsonResult BookingDiningData(string checkIn, string checkOut, int adult, int child, int yrsbelow, List<string> dinings)
        {
            ViewBag.TempData = null;
            if (TempData["BookingData"] != null)
            {
                var tempData = (TempBooking)TempData["BookingData"];
                tempData.DiningsByDays = dinings;
                ViewBag.TempData = TempData["BookingData"];
            }
            else
            {
                if (HttpContext.Session != null)
                {
                    var temp = HttpContext.Session["TempData"];
                    var tempData = (TempBooking)temp;
                    tempData.DiningsByDays = dinings;
                    TempData["BookingData"] = tempData;
                    ViewBag.TempData = tempData;
                }

            }

            return Json("stored", JsonRequestBehavior.AllowGet);
        }

        public JsonResult BookingActivityData(string checkIn, string checkOut, int adult, int child, int yrsbelow, List<string> activities, List<string> transports)
        {
            ViewBag.TempData = null;
            if (TempData["BookingData"] != null)
            {
                var tempData = (TempBooking)TempData["BookingData"];
                tempData.ActivitiesByDays = activities;
                tempData.Transports = transports;
                ViewBag.TempData = TempData["BookingData"];
            }
            else
            {
                if (HttpContext.Session != null)
                {
                    var temp = HttpContext.Session["TempData"];
                    var tempData = (TempBooking)temp;
                    tempData.ActivitiesByDays = activities;
                    tempData.Transports = transports;
                    TempData["BookingData"] = tempData;
                    ViewBag.TempData = tempData;
                }

            }

            return Json("stored", JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetPaymentBreakDown(string checkIn, string checkOut, int adult, int child, int yrsbelow)
        {
            ViewBag.TempData = null;
            if (TempData["BookingData"] != null)
            {
                var tempData = (TempBooking)TempData["BookingData"];
                ViewBag.TempData = TempData["BookingData"];
            }
            else
            {
                if (HttpContext.Session != null)
                {
                    var temp = HttpContext.Session["TempData"];
                    var tempData = (TempBooking)temp;
                    TempData["BookingData"] = tempData;
                    ViewBag.TempData = tempData;
                }

            }
            var model = new List<PriceBreakDown>();

            return PartialView("_PaymentBreakDown");
        }

        private List<DayWiseRate> GetPriceBreakDowns(string checkIn, string checkOut, int adult, int child, int yrsbelow, List<string> rooms, List<string> extra, List<string> dinings, List<string> activities, List<string> transports)
        {
            var model = new List<DayWiseRate>();
            var transportsByDays = new List<string>();
            var totalDays = new List<DateTime>();
            decimal totalPrice = 0;
            var dayWisePrices = new List<DateWisePrice>();
            var totAdults = adult + child;
            
            var chkIn = Convert.ToDateTime(checkIn);
            for (var i = chkIn; i < Convert.ToDateTime(checkOut); i = i.AddDays(1))
            {
                var dayByDay = new DayWiseRate
                {
                    Rooms = new List<DayRate>(),
                    Activities = new List<DayRate>(),
                    Dinings = new List<DayRate>(),
                    Transports = new List<DayRate>(),
                };

                if (rooms != null)
                    foreach (var r in rooms)
                    {
                        var arry = r.Split('-');
                        var roomId = Convert.ToInt16(arry[0]);
                        var bedId = Convert.ToInt16(arry[1]);
                        var room = _properties.GetRoom(roomId);
                        var bed = _properties.GetBed(bedId);

                        if (bed != null && room != null)
                        {

                            var roomrate = bed.Rate;

                            dayByDay.Date = i;
                            dayByDay.Rate = dayByDay.Rate + roomrate;
                            totalPrice = totalPrice + roomrate;
                            dayByDay.Rooms.Add(new DayRate
                            {
                                Name = room.Name,
                                Rate = roomrate,
                                Date = i
                            });

                            //adding kids room
                            if (extra!=null)
                            foreach (var e in extra)
                            {
                                var arr = e.Split('-');
                                var rId = Convert.ToInt16(arr[0]);
                                if (rId == roomId)
                                {
                                    var rName = "-* Kid :" + room.Name;
                                    var isCheck = (from a in dayByDay.Rooms
                                                   where a.Name.ToLower().Trim() == rName.ToLower().Trim()
                                                   select a).FirstOrDefault();
                                    if (isCheck == null)
                                    {
                                        var childRate = ((bed.Rate / totAdults) * (decimal)(.5 * yrsbelow));
                                        totalPrice = totalPrice + childRate;
                                        dayByDay.Rate = dayByDay.Rate + childRate;
                                        dayByDay.Rooms.Add(new DayRate
                                        {
                                            Name = rName,
                                            Rate = childRate,
                                            Date = i
                                        });
                                    }

                                }

                            }
                            
                           
                        }
                        

                    }

                if (dinings != null)
                    foreach (var d in dinings)
                    {
                        var arry = d.Split('_');
                        var date = Convert.ToDateTime(Convert.ToDateTime(arry[0]));
                        var diningId = Convert.ToInt16(arry[1]);
                        var rate = _properties.GetDiningRate(diningId);
                        if (rate != null)
                        {
                            var rates = rate.Rate * (decimal)(adult+child);
                            var ratesChild = 0;// rate.ChildRate * (decimal)child;
                            rates = rates + ratesChild;
                            if (i == date)
                            {
                                dayByDay.Dinings.Add(new DayRate
                                {
                                    Name = rate.Name,
                                    Rate = rates,
                                    Date = i
                                });

                                totalPrice = totalPrice + rates;
                                dayByDay.Rate = dayByDay.Rate + rates;
                            }

                            //adding kids room
                            if (extra != null)
                            foreach (var e in extra)
                            {
                                var arr = e.Split('-');
                                var rId = Convert.ToInt16(arr[0]);
                               if (i == date)
                                {
                                    var rName = "-* Kid :" + rate.Name;
                                    var isCheck = (from a in dayByDay.Dinings
                                                   where a.Name.ToLower().Trim() == rName.ToLower().Trim()
                                                   select a).FirstOrDefault();
                                    if (isCheck == null)
                                    {
                                        var childRate = ((rate.Rate) * (decimal)(.5 * yrsbelow));
                                        totalPrice = totalPrice + childRate;
                                        dayByDay.Rate = dayByDay.Rate + childRate;
                                        dayByDay.Dinings.Add(new DayRate
                                        {
                                            Name = rName,
                                            Rate = childRate,
                                            Date = i
                                        });
                                    }

                                }

                            }
                        }
                        
                       
                    }

                if (activities != null)
                    foreach (var a in activities)
                    {
                        var arry = a.Split('_');
                        var date = Convert.ToDateTime(Convert.ToDateTime(arry[0]));
                        var activityId = Convert.ToInt16(arry[1]);
                        var rate = _properties.GetActivity(activityId);
                        if (rate != null)
                        {
                            var rates = rate.Rate * (decimal)(adult + child); 
                            var ratesChild = 0;// rate.ChildRate * (decimal)child;
                            rates = rates + ratesChild;
                            if (i == date)
                            {
                                dayByDay.Activities.Add(new DayRate
                                {
                                    Name = rate.Name,
                                    Rate = rates,
                                    Date = i
                                });

                                totalPrice = totalPrice + rates;
                                dayByDay.Rate = dayByDay.Rate + rates;
                            }

                            //adding kids room
                            if (extra != null)
                            foreach (var e in extra)
                            {
                                var arr = e.Split('-');
                                var rId = Convert.ToInt16(arr[0]);
                                if (i == date)
                                {
                                    var rName = "-* Kid :" + rate.Name;
                                    var isCheck = (from b in dayByDay.Activities
                                                   where b.Name.ToLower().Trim() == rName.ToLower().Trim()
                                                   select b).FirstOrDefault();
                                    if (isCheck == null)
                                    {
                                        var childRate = ((rate.Rate) * (decimal)(.5 * yrsbelow));
                                        totalPrice = totalPrice + childRate;
                                        dayByDay.Rate = dayByDay.Rate + childRate;
                                        dayByDay.Activities.Add(new DayRate
                                        {
                                            Name = rName,
                                            Rate = childRate,
                                            Date = i
                                        });
                                    }

                                }

                            }
                        }
                       
                       
                    }

                model.Add(dayByDay);
                totalDays.Add(i);
            }


            decimal transCost = 0;
            if (transports != null)
                foreach (var t in transports.Distinct())
                {
                    var dayByDay = new DayWiseRate
                    {
                        Rooms = new List<DayRate>(),
                        Activities = new List<DayRate>(),
                        Dinings = new List<DayRate>(),
                        Transports = new List<DayRate>(),
                    };
                   
                    var arry = t.Split('_');
                    //var date = Convert.ToDateTime(Convert.ToDateTime(arry[0]).ToString("dd/MM/yy"));
                    var transportId = Convert.ToInt16(arry[0]);
                    var rate = _properties.GetTransport(transportId);
                    if (rate != null)
                    {
                        var rates = rate.Rate;

                        rates = rates*(decimal) (adult+child);// +rates * (decimal)(.5 * child);

                        transCost = transCost + rates;

                        transportsByDays.Add(rate.Name + " : ($) " + rates);
                        //totalPrice = totalPrice + rates;
                        dayByDay.Transports.Add(new DayRate
                        {
                            Name = rate.Name,
                            Rate = rates,
                            Date = DateTime.Now
                        });

                        totalPrice = totalPrice + rates;
                        model.Add(dayByDay);

                        //adding kids room
                        if (extra != null)
                        foreach (var e in extra)
                        {
                            var arr = e.Split('-');
                            var rId = Convert.ToInt16(arr[0]);
                           // if (rId == rate.Id)
                            //{
                                var rName = "-* Kid :" + rate.Name;
                                var isCheck = (from a in dayByDay.Transports
                                               where a.Name.ToLower().Trim() == rName.ToLower().Trim()
                                               select a).FirstOrDefault();
                                if (isCheck == null)
                                {
                                    var childRate = ((rate.Rate) * (decimal)(.5 * yrsbelow));
                                    totalPrice = totalPrice + childRate;
                                    transCost = transCost + childRate;
                                    dayByDay.Rate = dayByDay.Rate + childRate;
                                    dayByDay.Transports.Add(new DayRate
                                    {
                                        Name = rName,
                                        Rate = childRate,
                                        Date = DateTime.Now
                                    });
                                }

                            //}

                        }
                    }
                    
                }

            //Apply discount for agents/
            var discount = GetDiscount();
            
            ViewBag.TotalPrice = totalPrice;
            ViewBag.Discount = Convert.ToDecimal(Convert.ToDecimal(totalPrice) * discount / 100);
            ViewBag.DiscountPercentage = discount;
            totalPrice = totalPrice - Convert.ToDecimal(Convert.ToDecimal(totalPrice) * discount / 100);
            ViewBag.AfterDiscountPrice = totalPrice;

            ViewBag.TransportCost = transCost.ToString("#0.00");

            
            ViewBag.DayWisePrices = dayWisePrices;
            ViewBag.Deposit = Convert.ToDecimal(totalPrice * Convert.ToDecimal(.25));

            return model;
        }

        private decimal GetDiscount()
        {
            var discount = 0m;
            if (User.Identity.IsAuthenticated)
            {
                var userEmail = User.Identity.Name;
                var user = _userService.GetUser(userEmail, 1);
                if (user != null)
                {
                    var client = _customerService.GetClientUserId(user.UserId);
                    if (client != null)
                        discount = client.Discount;
                }
            }
            return discount;
        }

        private string GetUserName()
        {
            var name = string.Empty;
            if (User.Identity.IsAuthenticated)
            {
                var userEmail = User.Identity.Name;
                var user = _userService.GetUser(userEmail, 1);
                if (user != null)
                {
                    name = user.FirstName + " " + user.LastName;
                }
            }
            return name;
        }


        private int GetUserId(string userEmail)
        {
            var id = 0;
            var user = _userService.GetUser(userEmail, 1);
            if (user != null)
            {
                id = user.UserId;

            }
            return id;
        }

        public JsonResult CheckLogin(string uname,string pw)
        {
            uname = uname.Replace("-", "a").Replace("*", "e").Replace("=", "i");
            pw = pw.Replace("-", "a").Replace("*", "e").Replace("#", "i");

            var user = _userService.ValidateUser(uname, pw, 1);
            if (user == null)
            {
                return Json("no", JsonRequestBehavior.AllowGet);
            }

            FormsAuthentication.SetAuthCookie(uname,true);
            return Json("ok", JsonRequestBehavior.AllowGet);
        }

        public JsonResult CheckEmailExists(string uname)
        {
            var user = _userService.GetUser(uname, 1);
            if (user != null)
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }

            return Json(false, JsonRequestBehavior.AllowGet);
        }

        public ActionResult PayPalPayment(string checkIn, string checkOut, string userName, decimal amount,int companyId, int invoiceId)
        {
            //var model = new BookingFlowModel();
            //ViewBag.TempData = null;
            //ViewBag.PriceBreakDowns = null;
            //var booingModel = new TempBooking();
            //if (TempData["BookingData"] != null)
            //{
            //    var tempData = (TempBooking)TempData["BookingData"];
            //    booingModel = tempData;
            //    ViewBag.TempData = TempData["BookingData"];
            //}
            //else
            //{
            //    if (HttpContext.Session != null)
            //    {
            //        var temp = HttpContext.Session["TempData"];
            //        var tempData = (TempBooking)temp;
            //        booingModel = tempData;
            //        TempData["BookingData"] = tempData;
            //        ViewBag.TempData = tempData;
            //    }

            //}

            //if (booingModel.Rooms.Any())
            //{
            //    ViewBag.PriceBreakDowns = GetPriceBreakDowns(booingModel.CheckIn.ToShortDateString(),
            //                                                   booingModel.CheckOut.ToShortDateString(),
            //                                                   booingModel.Adult, booingModel.Children,
            //                                                   booingModel.Below6Yrs, booingModel.Rooms,
            //                                                   booingModel.ExtraBeds, booingModel.DiningsByDays,
            //                                                   booingModel.ActivitiesByDays, booingModel.Transports);
            //}

            //checkIn = "07/04/2014";
            //checkIn = "09/04/2014";
            //amount = 10;

            //var item = userName + " has booked room(s) at horakelle estate from " + checkIn + " to " + checkOut;
            ViewBag.UserName = userName;
            ViewBag.Amount = amount;

            var paypal = new Models.Paypal
            {
                cmd = "_xclick",
                business = ConfigurationManager.AppSettings["BusinessAccountKey"]
            };

            bool useSandbox = Convert.ToBoolean(ConfigurationManager.AppSettings["UseSandbox"]);
            if (useSandbox)
                ViewBag.actionURl = "https://www.sandbox.paypal.com/cgi-bin/webscr";
            else
                ViewBag.actionURl = "https://www.paypal.com/cgi-bin/webscr";

            paypal.cancel_return = ConfigurationManager.AppSettings["CancelURL"] + "?companyId=" + companyId + "&invoiceId=" + invoiceId;
            paypal.@return = ConfigurationManager.AppSettings["ReturnURL"] + "?companyId=" + companyId + "&invoiceId=" + invoiceId; 
            paypal.notify_url = ConfigurationManager.AppSettings["NotifyURL"] + "?companyId=" + companyId + "&invoiceId=" + invoiceId; 
            paypal.currency_code = ConfigurationManager.AppSettings["CurrencyCode"];

            paypal.item_name = userName;
            paypal.amount = amount.ToString();

            return View(paypal);


        }

        public ActionResult PayPalCancel(int companyId, int invoiceId)
        {
            //var item = userName + " has booked room(s) at horakell estate from " + checkIn + " to " + checkOut;
            //ViewBag.UserName = item;
            //ViewBag.Amount = amount;

            //var paypal = new Models.Paypal
            //{
            //    cmd = "_xclick",
            //    business = ConfigurationManager.AppSettings["BusinessAccountKey"]
            //};

            //bool useSandbox = Convert.ToBoolean(ConfigurationManager.AppSettings["UseSandbox"]);
            //if (useSandbox)
            //    ViewBag.actionURl = "https://www.sandbox.paypal.com/cgi-bin/webscr";
            //else
            //    ViewBag.actionURl = "https://www.paypal.com/cgi-bin/webscr";

            //paypal.cancel_return = ConfigurationManager.AppSettings["CancelURL"];
            //paypal.@return = ConfigurationManager.AppSettings["ReturnURL"]; //+"&PaymentId=1"; you can append your order Id here
            //paypal.notify_url = ConfigurationManager.AppSettings["NotifyURL"];// +"?PaymentId=1"; to maintain database logic 
            //paypal.currency_code = ConfigurationManager.AppSettings["CurrencyCode"];

            //paypal.item_name = item;
            //paypal.amount = amount.ToString();

            return View();


        }

        public ActionResult NotifyFromPaypal(int companyId, int invoiceId)
        {
            _properties.UpdateInvoice(companyId, invoiceId);
            return View();
        }

        private bool Booking(string checkIn, string checkOut, int adult, int child, int childbelow6, int roomCount, decimal totAmount, decimal paidAmount, decimal discount, decimal tax, int paidBy, out Invoice invoice)
        {
            var visitorId = 0;
            invoice = new Invoice();
            if (User.Identity.IsAuthenticated)
            {
                var user = _userService.GetUser(User.Identity.Name, 1);
                if (user != null)
                {
                    visitorId = user.UserId;
                    if (visitorId > 0)
                    {
                        var booking = new Invoice
                        {
                            InvoiceNo = _properties.InvoiceNumber(),
                            CompanyId = 1,
                            BookedBy = visitorId,
                            TotalAmount=totAmount,
                            BillAmount=paidAmount,
                            BookedDateFrom = Convert.ToDateTime(checkIn),
                            BookedDateTo = Convert.ToDateTime(checkOut),
                            Adult=adult,
                            Children=child,
                            ChildBelow6=childbelow6,
                            PaidBy = paidBy,//card -2, cach -1
                            PaymentMade=false,
                            Commision =(decimal) roomCount*1,
                            BookingHtlmString = "",
                            Discount = discount,
                            Tax = tax

                        };

                        var booked = _properties.SaveInvoice(booking);
                        if (booked)
                        {
                            invoice = booking;
                            //var book = new Booking();

                            //var url = "";
                            try
                            {
                                //var clientName = _userService.GetUser((int)property.ClientId).FirstName;
                                //EmailService.SendbookingEmail(url, user.Email, string.Format("{0} {1}", user.FirstName, user.LastName), clientName, propertyId, frmDate, toDate, days, price.ToString());
                            }
                            catch (Exception)
                            {

                            }

                        }

                    }
                }

            }
            return true;
        }

        private bool BookRooms(int roomId, int customerId, int visitorId, DateTime startDate, DateTime endDate,
                               Invoice invoice)
        {

            var booking = new Booking
                {
                    Invoice = invoice,
                    PropertyId=roomId,
                    CustomerId = customerId,
                    VisitorId=visitorId,
                    DateTo=startDate,
                    DateFrom=endDate,
                    BookingHtlmString=string.Empty
                };
            var booked = _properties.SaveBookingRoom(booking);
            if (booked)
                return true;
            else
                return false;
        }
   
    

      
    }
}
