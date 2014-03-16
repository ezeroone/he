using System;
using System.Collections.Generic;

using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using eZeroOne.Domain;
using eZeroOne.Service.Repository;

namespace eZeroOne.Service.Property
{
   
    public interface IProperties
    {
        IEnumerable<MainCity> GetLocationList();
        IEnumerable<Designation> GetDesignationList();
        IEnumerable<AccommodationType> GetAccomodationTypeList();
        IEnumerable<AccommodationStandard> GetAccomodationStandardList();
        IEnumerable<PointOfInterest> GetPointOfInterestList();
        IEnumerable<Feature> GetFeatureList();
        IEnumerable<eZeroOne.Domain.Property> GetHotelsList();
        IEnumerable<PointOfInterest> GetHotelPoiList();
        IEnumerable<Feature> GetHotelFeaturesList();
        IEnumerable<Place> GetPlaces(int propertyId);
        Place GetPlace(int id);
        IEnumerable<Dining> GetMeals(int propertyId);
        IEnumerable<PropertyImage> Images(int propertyId);
        Domain.Property GetPropertyDetail(int id);
        Cuisine GetMealDetail(int foodId);
        TravelBy GetTravelDetail(int travelId);
        IEnumerable<Designation> GetDesignations();
        IEnumerable<Cuisine> GetCuisines();
        IEnumerable<TravelBy> GetTravelBy();
        string TravelByName(int id);
        IEnumerable<DistrictImage> DistrictImages(int id);
        bool AddDistrictImage(int Id, string filePath, string description);
        bool RemoveDistrictImage(int imageId, int districtId);
        MainCity GetDistrict(int id);

        bool AddIImage(int propertyId, string filePath, string description, bool isDefault);
        bool RemoveImage(int imageId, int propertyId);
        bool SaveProperty(Domain.Property property);
        bool SaveNearetPlaces(Domain.Place place);
        bool SaveTranslator(Domain.Translator translator);
        bool SaveDining(Domain.Dining dining);
        bool SavePois(string pois, int propertyId);
        bool SaveFeatures(string features, int propertyId);
        string DesignationName(int id);

        IEnumerable<Translator> GetTranslators(int propertyId);
        Dining GetFood(int id);
        bool UpdateFeatures(int id, string featureList);
        bool UpdatePois(int id, string poiList);
        Designation GetDesignation(int id);


        //update
        Domain.Property GetProperty(int id);
        bool UpdateProperty(Domain.Property property);
        bool UpdateNearetPlaces(Domain.Place model);
        Translator GetTranslatorById(int id);
        bool UpdateTranslator(Domain.Translator model);
        bool UpdateDining(Domain.Dining model);
        bool MakeBooking(Booking booking);

        //deleting
        bool DeleteProperty(int id);
        bool DeletePlaces(int id);
        bool DeleteFeatures(int id);
        bool DeletePois(int id);
        bool DeleteContacts(int id);
        bool DeleteMeals(int id);

        bool ApproveProperty(int id);
        bool RejectProperty(int id);

        //Save
        bool SaveMealType(int id, string name);
        bool DeleteCuisine(int id);

        bool SaveFeature(int id, int groupId, string name);
        bool SavePoi(int id, string name);
        bool SaveOccupation(int id, string name);
        bool RemoveOccupation(int id);
        bool SaveAccomodationType(int id, string name);
        bool SaveAccomodationStandard(int id, string name);
        bool SaveFeatureGroup(int id, string name);

        bool RemoveAccomodationType(int id);
        bool RemoveAccomodationStandard(int id);
        bool RemoveFeatureGroup(int id);


        bool PostProperty(int id);

        //ordering
        bool OrderFeature(int id, int orderId);
        bool OrderAccomodationtype(int id, int orderId);
        bool OrderAccomodationStandard(int id, int orderId);

        IEnumerable<FeatureCategory> FeatureCategories();

        Domain.MainCity GetMainCity(int id);

        bool SaveTravelBy(int id, string name);
        bool RemoveTravelBy(int id);
        bool SaveDistrictInfo(int id, string name);

        IEnumerable<BannerImage> GetSliderImages();
        BannerImage GetSliderImage(int id);
        bool AddBannerImage(string filePath, string place, string description, string loction, decimal lat, decimal lon);
        bool RemoveBannerImage(int imageId);

        bool OrderMealType(int id, int orderId);
        bool AddDiningImage(string filePath, int id);

        IEnumerable<YoutubeUrl> GetYoutubeUrls();
        //BannerImage GetYoutubeUrl(int id);
        int AddYoutubeUrl(string filePath, string description);
        bool RemoveYoutubeUrl(int id);

        bool UpdateBannerImage(int id, string filePath, string place, string description, string loction, decimal lat,
                               decimal lon);

        bool OrderSliderImage(int id, int orderId);
        bool CheckBookingDates(int propertyId, DateTime frmDate, DateTime toDate);

        //ordering
        bool OrderFeatureGroup(int id, int orderId);
        bool OrderTravelBy(int id, int orderId);
        bool OrderOccupation(int id, int orderId);

        bool AddRecommandation(string photoUrl, string name, string description, string email, string profession);
        bool UpdateRecommandation(int id, string photoUrl, string name, string description, string email, string profession);
        bool RemoveRecommandation(int id);

        Recommendation GetRecommandation(int id);
        IEnumerable<Recommendation> GetRecommandations();

        bool AddReviewComments(int visitorId, string comment, int propertyId);
        IEnumerable<VisitorReview> GetReviewComments(int propertyId);
        VisitorReview GetReview(int id);
        IEnumerable<VisitorReview> GetReviewComments();

        //rooms
        bool SaveRoom(Room room);
        Room GetRoom(int id);
        bool UpdateRoom(Room room);
        bool DeleteRoom(int id);
        IEnumerable<Room> GetRooms();

        bool AddRoomImage(int propertyId, string filePath, string description, bool isDefault);
        bool RemoveRoomImage(int imageId, int propertyId);
        IEnumerable<RoomImage> RoomImages(int roomId);

        //bed
        bool SaveBed(Bed bed);
        Bed GetBed(int id);
        bool UpdateBed(Bed bed);
        bool DeleteBed(int id);
        IEnumerable<Bed> GetBeds();

        //dining rate
        bool SaveDiningRate(DiningRate rate);
        DiningRate GetDiningRate(int id);
        bool UpdateDiningRate(DiningRate rate);
        bool DeleteDiningRate(int id);
        IEnumerable<DiningRate> GetDiningRates();

        //transports
        bool SaveTransport(Transport trans);
        Transport GetTransport(int id);
        bool UpdateTransport(Transport trans);
        bool DeleteTransport(int id);
        IEnumerable<Transport> GetTransports();


        //beds for rooms
        bool SaveBedForRoom(BedRoom bedroom);
        bool UpdateBedRoom(BedRoom model);
        IEnumerable<BedRoom> GetBedRooms(int roomId);
        IEnumerable<BedRoom> GetBedRooms();
        bool DeleteBedRoom(int id);
        bool DeleteBedsForRoom(int roomId);

        //activities
        bool SaveActivity(Activity activity);
        bool UpdateActivity(Activity model);
        Activity GetActivity(int id);
        IEnumerable<Activity> GetActivities(int propertyId);
        bool DeleteActivity(int id);

        IQueryable<Room> GetAvailableRooms(string checkIn, string checkOut, int adult, int child, int belowYrs);

        //invoice
        bool SaveInvoice(Invoice invoice);
        bool SaveBookingRoom(Booking booking);
        string InvoiceNumber();

        bool UpdateInvoice(int companyId, int invoiceId);
    }
    
    public class Properties : IProperties
    {
        private readonly IRepository _repository;
        private readonly IUnitOfWork _unitOfWork;

        public Properties(IRepository repository, IUnitOfWork unitOfWork)
        {
            _repository = repository;
            _unitOfWork = unitOfWork;
        }

        public IEnumerable<Designation> GetDesignationList()
        {
            var cities = _repository.All<Designation>().OrderBy(o => o.Name).ToList();
            var city = new Designation
            {
                Id = 0,
                Name = "--- Any --- "

            };
            cities.Insert(0, city);
            return cities;
        }

        public IEnumerable<MainCity> GetLocationList()
        {
            var cities = _repository.All<MainCity>().OrderBy(o => o.City).ToList();
            var city = new MainCity
            {
                Id = 0,
                City = " Select the location"

            };
            cities.Insert(0, city);
            return cities;
        }

        public IEnumerable<AccommodationType> GetAccomodationTypeList()
        {
            var atList = _repository.All<AccommodationType>().OrderBy(o => o.DisplayOrder).ToList();

            var acc = new AccommodationType
            {
                Id = 0,
                Name = "--- Any---"

            };
            atList.Insert(0, acc);
            return atList;
        }

        public IEnumerable<AccommodationStandard> GetAccomodationStandardList()
        {
            var asList = _repository.All<AccommodationStandard>().OrderBy(o => o.DisplayOrder).ToList();
            var acc = new AccommodationStandard
            {
                Id = 0,
                Name = "--- Any ---"

            };
            asList.Insert(0, acc);
            return asList;
        }

        public IEnumerable<PointOfInterest> GetPointOfInterestList()
        {
            var poiList = _repository.All<PointOfInterest>().OrderBy(o => o.Name).ToList();
            return poiList;
        }

        public IEnumerable<Feature> GetFeatureList()
        {
            var featureList = _repository.All<Feature>().OrderBy(o => o.DisplayOrder).ToList();
            return featureList;
        }

        public IEnumerable<eZeroOne.Domain.Property> GetHotelsList()
        {
            var hotelList =(from r in _repository.All<Domain.Property>()
                                .Include(x=>x.Dinings)
                                .Include(x=>x.Activities)
                                select r ).OrderBy(o => o.Name).ToList();
            return hotelList;
        }

        
        public IEnumerable<PointOfInterest> GetHotelPoiList()
        {
            var hotelpoiList = _repository.All<PointOfInterest>().ToList();
            return hotelpoiList;
        }

        public IEnumerable<Designation> GetDesignations()
        {
            return _repository.All<Designation>().ToList();

        }
        public Designation GetDesignation(int id)
        {
            return _repository.Single<Designation>(t => t.Id == id);
        }
        public IEnumerable<Feature> GetHotelFeaturesList()
        {
            var hotelFetList = _repository.All<Feature>().OrderBy(o => o.Name).ToList();
            return hotelFetList;
        }

        public IEnumerable<Cuisine> GetCuisines()
        {
            return _repository.All<Cuisine>().OrderBy(o => o.FoodType).ToList();

        }

        public IEnumerable<Place> GetPlaces(int propertyId)
        {
            return _repository.All<Place>().Where(p => p.PropertyId == propertyId).OrderBy(o => o.PlaceName).ToList();

        }



        public Place GetPlace(int id)
        {
            return _repository.All<Place>().FirstOrDefault(p => p.Id == id);

        }

        public IEnumerable<BannerImage> GetSliderImages()
        {
            return _repository.All<BannerImage>().ToList();

        }

        public BannerImage GetSliderImage(int id)
        {
            return _repository.All<BannerImage>().FirstOrDefault(p => p.Id == id);

        }

        public Recommendation GetRecommandation(int id)
        {
            return _repository.All<Recommendation>().FirstOrDefault(p => p.Id == id);

        }
        public IEnumerable<Recommendation> GetRecommandations()
        {
            return _repository.All<Recommendation>().ToList();

        }

        public IEnumerable<Dining> GetMeals(int propertyId)
        {
            return _repository.All<Dining>().Where(p => p.PropertyId == propertyId).OrderBy(o => o.MealType).ToList();
        }
        public Domain.Property GetPropertyDetail(int id)
        {
            return _repository.All<Domain.Property>().FirstOrDefault(p => p.Id == id);
        }
        public IEnumerable<PropertyImage> Images(int propertyId)
        {
            return _repository.All<PropertyImage>().Where(p => p.PropertyId == propertyId).ToList();
        }

        

        public IEnumerable<DistrictImage> DistrictImages(int id)
        {
            return _repository.All<DistrictImage>().Where(p => p.DistrictId == id).ToList();
        }
        public Cuisine GetMealDetail(int foodId)
        {
            return _repository.All<Domain.Cuisine>().FirstOrDefault(p => p.Id == foodId);
        }
        public TravelBy GetTravelDetail(int travelId)
        {
            return _repository.All<Domain.TravelBy>().FirstOrDefault(p => p.Id == travelId);
        }

        public bool AddIImage(int propertyId, string filePath, string description, bool isDefault)
        {
            var image = new PropertyImage
            {
                Id = 0,
                ImageDescription = description,
                ImagePath = filePath,
                DefaultImage = isDefault,
                PropertyId = propertyId
            };
            try
            {
                _repository.Add(image);
                _unitOfWork.Commit();
                return true;
            }
            catch
            {
                return false;
            }

        }
        public bool RemoveImage(int imageId, int propertyId)
        {
            var image = _repository.All<PropertyImage>().FirstOrDefault(p => p.PropertyId == propertyId && p.Id == imageId);
            if (image != null)
            {
                _repository.Delete(image);
                _unitOfWork.Commit();
            }
            return true;
        }


      
        public bool AddDistrictImage(int Id, string filePath, string description)
        {
            var image = new DistrictImage
            {
                Id = 0,
                Description = description,
                ImageName = filePath,
                DistrictId = Id
            };
            try
            {
                _repository.Add(image);
                _unitOfWork.Commit();
                return true;
            }
            catch
            {
                return false;
            }

        }


        
        public bool RemoveDistrictImage(int imageId, int districtId)
        {
            var image = _repository.All<DistrictImage>().FirstOrDefault(p => p.DistrictId == districtId && p.Id == imageId);
            if (image != null)
            {
                _repository.Delete(image);
                _unitOfWork.Commit();
            }
            return true;
        }
        public MainCity GetDistrict(int id)
        {
            return _repository.All<MainCity>().FirstOrDefault(p => p.Id == id);
        }
        public bool AddBannerImage(string filePath, string place, string description, string loction, decimal lat, decimal lon)
        {
            var image = new BannerImage
            {
                Id = 0,
                ImageDescription = description,
                Location = loction,
                Lat = lat,
                Lon = lon,
                ImageName = filePath,
                PlaceName = place
            };
            try
            {
                _repository.Add(image);
                _unitOfWork.Commit();
                return true;
            }
            catch
            {
                return false;
            }

        }
        public bool UpdateBannerImage(int id, string filePath, string place, string description, string loction, decimal lat, decimal lon)
        {
            var image = _repository.All<Domain.BannerImage>().FirstOrDefault(q => q.Id == id);
            if (image != null)
            {
                image.ImageDescription = description;
                image.Location = loction;
                image.Lat = lat;
                image.Lon = lon;

                if (!string.IsNullOrWhiteSpace(filePath))
                    image.ImageName = filePath;

                image.PlaceName = place;
            }

            try
            {
                _unitOfWork.Commit();
                return true;
            }
            catch
            {
                return false;
            }

        }


        public bool AddRecommandation(string photoUrl, string name, string description, string email, string profession)
        {
            var item = new Recommendation
            {
                Id = 0,
                Comments = description,
                Name = name,
                Email = email,
                Profession = profession,
                PhotoUrl = photoUrl
            };
            try
            {
                _repository.Add(item);
                _unitOfWork.Commit();
                return true;
            }
            catch
            {
                return false;
            }

        }
        public bool UpdateRecommandation(int id, string photoUrl, string name, string description, string email, string profession)
        {
            var item = _repository.All<Domain.Recommendation>().FirstOrDefault(q => q.Id == id);
            if (item != null)
            {
                item.Name = name;
                item.Comments = description;
                item.Profession = profession;
                item.Email = email;
                if (!string.IsNullOrWhiteSpace(photoUrl))
                    item.PhotoUrl = photoUrl;


            }

            try
            {
                _unitOfWork.Commit();
                return true;
            }
            catch
            {
                return false;
            }

        }


        public int AddYoutubeUrl(string filePath, string url)
        {
            var image = new YoutubeUrl()
            {
                Id = 0,
                Url = url,
                FileName = filePath,

            };
            try
            {
                _repository.Add(image);
                _unitOfWork.Commit();
                return image.Id;
            }
            catch
            {
                return 0;
            }

        }
        public IEnumerable<YoutubeUrl> GetYoutubeUrls()
        {
            return _repository.All<YoutubeUrl>().Take(1).ToList();
        }
        public bool RemoveYoutubeUrl(int id)
        {
            var image = _repository.All<YoutubeUrl>().FirstOrDefault(p => p.Id == id);
            if (image != null)
            {
                _repository.Delete(image);
                _unitOfWork.Commit();
            }
            return true;
        }

        public bool AddDiningImage(string filePath, int id)
        {
            try
            {
                var item = _repository.All<Domain.Cuisine>().FirstOrDefault(q => q.Id == id);
                if (item != null)
                    item.ImageName = filePath;

                _unitOfWork.Commit();
                return true;
            }
            catch
            {
                return false;
            }

        }
        public bool RemoveBannerImage(int imageId)
        {
            var image = _repository.All<BannerImage>().FirstOrDefault(p => p.Id == imageId);
            if (image != null)
            {
                _repository.Delete(image);
                _unitOfWork.Commit();
            }
            return true;
        }
        public bool RemoveRecommandation(int id)
        {
            var item = _repository.All<Recommendation>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                _repository.Delete(item);
                _unitOfWork.Commit();
            }
            return true;
        }


        public bool SaveProperty(Domain.Property property)
        {
            _repository.Add(property);
            _unitOfWork.Commit();
            return true;
        }
        public bool UpdateProperty(Domain.Property model)
        {
            var item = _repository.All<Domain.Property>().FirstOrDefault(q => q.Id == model.Id);
            if (item != null)
            {

                item.Name = model.Name;
                item.Description = model.Description;
                item.MainCity = model.MainCity;
                item.Location = model.Location;
                item.AccommodationType = model.AccommodationType;
                item.AccommodationStandard = model.AccommodationStandard;
                item.NoOfRooms = model.NoOfRooms;
                item.DisplayPrice = model.DisplayPrice;
                item.Squarefeet = model.Squarefeet;
                item.Latitude = model.Latitude;
                item.Longitude = model.Longitude;
                item.Adderss = model.Adderss;
                item.Street = model.Street;
                item.City = model.City;
                item.ContactPerson1 = model.ContactPerson1;
                item.LandLinePrimary = model.LandLinePrimary;
                item.MobilePrimary = model.MobilePrimary;
                item.OwnerDesignation = model.OwnerDesignation;
                item.Email = model.Email;
                item.VideoUrl = model.VideoUrl;
                item.Website = model.Website;
                item.IsActive = true;
                item.ActiveFrom = DateTime.UtcNow;
                item.CompanyId = 1;
                item.ClientId = model.ClientId;

                if (!string.IsNullOrWhiteSpace(model.ImageName))
                    item.ImageName = model.ImageName;

                if (!string.IsNullOrWhiteSpace(model.MealImage))
                    item.MealImage = model.MealImage;

                item.AboutOwner = model.AboutOwner;

                if (!string.IsNullOrWhiteSpace(model.PoliceReport))
                    item.PoliceReport = model.PoliceReport;

                if (!string.IsNullOrWhiteSpace(model.GSReport))
                    item.GSReport = model.GSReport;

                _unitOfWork.Commit();
            }
            return true;
        }

        public Domain.Property GetProperty(int id)
        {
            return _repository.All<Domain.Property>().FirstOrDefault(q => q.Id == id);
        }



        public bool SaveNearetPlaces(Domain.Place place)
        {
            _repository.Add(place);
            _unitOfWork.Commit();
            return true;
        }

        public bool UpdateNearetPlaces(Domain.Place model)
        {
            var item = _repository.All<Domain.Place>().FirstOrDefault(q => q.Id == model.Id);
            if (item != null)
            {
                item.PropertyId = model.PropertyId;
                item.Id = model.Id;
                item.PlaceName = model.PlaceName;
                item.Lat = model.Lat;
                item.Long = model.Long;
                item.Distance = model.Distance;
                item.TimeTake = model.TimeTake;
                item.TravelBy = model.TravelBy;
                item.Description = model.Description;
                _unitOfWork.Commit();
            }

            return true;
        }


        public bool SaveTranslator(Domain.Translator translator)
        {
            _repository.Add(translator);
            _unitOfWork.Commit();
            return true;
        }
        public bool UpdateTranslator(Domain.Translator model)
        {
            var trans = _repository.All<Translator>().FirstOrDefault(p => p.Id == model.Id);
            if (trans != null)
            {
                trans.Name = model.Name;
                trans.Language = model.Language;
                trans.Landline = model.Landline;
                trans.Mobile = model.Mobile;
                trans.IsActive = true;
                trans.PropertyId = model.PropertyId;
                trans.ImageName = model.ImageName;
                _unitOfWork.Commit();
            }

            return true;
        }
        public bool SaveDining(Domain.Dining dining)
        {
            _repository.Add(dining);
            _unitOfWork.Commit();
            return true;
        }
        public bool UpdateDining(Domain.Dining model)
        {
            var food = _repository.All<Domain.Dining>().FirstOrDefault(p => p.Id == model.Id);
            if (food != null)
            {
                food.FoodId = model.FoodId;
                food.MealType = model.MealType;
                food.PropertyId = model.PropertyId;
                food.Price = model.Price;

                _unitOfWork.Commit();

            }

            return true;
        }
        public bool SavePois(string pois, int propertyId)
        {
            var property = _repository.All<Domain.Property>().FirstOrDefault(p => p.Id == propertyId);
            if (property != null)
            {
                property.Interests = pois;
                _unitOfWork.Commit();
            }
            _unitOfWork.Commit();
            return true;
        }
        public bool SaveFeatures(string features, int propertyId)
        {
            var property = _repository.All<Domain.Property>().FirstOrDefault(p => p.Id == propertyId);
            if (property != null)
            {
                property.Features = features;
                _unitOfWork.Commit();
            }
            _unitOfWork.Commit();
            return true;
        }
        public string DesignationName(int id)
        {
            var name = _repository.All<Designation>().Where(p => p.Id == id).FirstOrDefault();
            if (name != null)
                return name.Name;
            return string.Empty;
        }
        public string TravelByName(int id)
        {
            var name = _repository.All<TravelBy>().FirstOrDefault(p => p.Id == id);
            if (name != null)
                return name.Name;
            return string.Empty;
        }

        public IEnumerable<TravelBy> GetTravelBy()
        {
            return _repository.All<TravelBy>().ToList();
        }
        public IEnumerable<FeatureCategory> FeatureCategories()
        {
            return _repository.All<FeatureCategory>().OrderBy(o => o.Name).ToList();
        }
        public IEnumerable<Translator> GetTranslators(int propertyId)
        {
            return _repository.All<Translator>().Where(p => p.PropertyId == propertyId).ToList();
        }
        public Translator GetTranslatorById(int id)
        {
            return _repository.All<Translator>().FirstOrDefault(p => p.Id == id);
        }
        public Dining GetFood(int id)
        {
            return _repository.All<Dining>().FirstOrDefault(p => p.Id == id);
        }
        public bool UpdateFeatures(int id, string featureList)
        {
            var feature = _repository.All<Domain.Property>().FirstOrDefault(p => p.Id == id);
            if (feature != null)
            {
                feature.Features = featureList.Trim().ToLower();// string.Join(",", featureList.Select(s => s.ToString(CultureInfo.InvariantCulture).ToLower()));
            }
            _unitOfWork.Commit();
            return true;
        }
        public bool UpdatePois(int id, string poiList)
        {
            var feature = _repository.All<Domain.Property>().FirstOrDefault(p => p.Id == id);
            if (feature != null)
            {
                feature.Interests = poiList.Trim().ToLower();// string.Join(",", featureList.Select(s => s.ToString(CultureInfo.InvariantCulture).ToLower()));
            }
            _unitOfWork.Commit();
            return true;
        }

        public bool DeleteProperty(int id)
        {
            var item = _repository.All<Domain.Property>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                _repository.Delete(item);
                _unitOfWork.Commit();

                //To DO
                // Delete all related entity for this property
            }

            return true;
        }

       
        public bool DeletePlaces(int id)
        {
            var item = _repository.All<Domain.Place>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                _repository.Delete(item);
                _unitOfWork.Commit();
            }
            return true;
        }
        public bool DeleteFeatures(int id)
        {
            var item = _repository.All<Domain.Feature>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                _repository.Delete(item);
                _unitOfWork.Commit();
            }
            return true;
        }
        public bool DeletePois(int id)
        {
            var item = _repository.All<Domain.PointOfInterest>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                _repository.Delete(item);
                _unitOfWork.Commit();
            }

            return true;
        }
        public bool DeleteContacts(int id)
        {
            var item = _repository.All<Domain.Translator>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                _repository.Delete(item);
                _unitOfWork.Commit();
            }
            return true;
        }
        public bool DeleteMeals(int id)
        {
            var item = _repository.All<Domain.Dining>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                _repository.Delete(item);
                _unitOfWork.Commit();
            }
            return true;
        }

        public bool ApproveProperty(int id)
        {
            var item = _repository.All<Domain.Property>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                item.IsActive = true;
                item.IsApproved = true;
                _unitOfWork.Commit();

                //todo
                //Email confirmation...to client
            }

            return true;
        }
        public bool PostProperty(int id)
        {
            var item = _repository.All<Domain.Property>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                item.IsPosted = true;
                _unitOfWork.Commit();
            }

            return true;
        }

        public bool RejectProperty(int id)
        {
            var item = _repository.All<Domain.Property>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                //_repository.Delete(item);
                item.IsApproved = false;
                item.IsActive = false;
                item.IsPosted = false;
                _unitOfWork.Commit();

                //todo
                //Email confirmation...to client with reason
            }

            return true;
        }

        public bool SaveMealType(int id, string name)
        {
            var item = _repository.All<Domain.Cuisine>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                item.FoodType = name;

            }
            else
            {
                var meal = new Cuisine { FoodType = name, Foods = "" };
                _repository.Add(meal);
            }
            _unitOfWork.Commit();

            return true;
        }
        public bool DeleteCuisine(int id)
        {
            var item = _repository.All<Domain.Cuisine>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                _repository.Delete(item);
                _unitOfWork.Commit();
            }
            return true;
        }

        public bool SaveFeature(int id, int groupId, string name)
        {
            var orderCount = _repository.All<Domain.Feature>().Select(s => s.GroupId == groupId).ToList();
            var item = _repository.All<Domain.Feature>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                item.Name = name;

            }
            else
            {
                var meal = new Feature { Name = name, GroupId = groupId, DisplayOrder = orderCount.Count + 1 };
                _repository.Add(meal);
            }
            _unitOfWork.Commit();

            return true;
        }
        public bool SavePoi(int id, string name)
        {
            var item = _repository.All<Domain.Cuisine>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                item.FoodType = name;

            }
            else
            {
                var meal = new Cuisine { FoodType = name, Foods = "" };
                _repository.Add(meal);
            }
            _unitOfWork.Commit();

            return true;
        }

        public bool RemoveOccupation(int id)
        {
            var item = _repository.All<Domain.Designation>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                _repository.Delete(item);
                _unitOfWork.Commit();
            }

            return true;
        }

        public bool SaveOccupation(int id, string name)
        {
            var item = _repository.All<Domain.Designation>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                item.Name = name;

            }
            else
            {
                var meal = new Designation { Name = name };
                _repository.Add(meal);
            }
            _unitOfWork.Commit();

            return true;
        }

        public bool SaveDistrictInfo(int id, string name)
        {
            var item = _repository.All<Domain.MainCity>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                item.Description = name;

            }
            //else
            //{
            //    var meal = new Designation { Name = name };
            //    _repository.Add(meal);
            //}

            _unitOfWork.Commit();

            return true;
        }


        public bool MakeBooking(Booking booking)
        {
            _repository.Add(booking);
            _unitOfWork.Commit();
            return true;
        }

        public bool CheckBookingDates(int propertyId, DateTime frmDate, DateTime toDate)
        {
            var item = _repository.All<Domain.Booking>().FirstOrDefault(p => p.PropertyId == propertyId && (frmDate >= p.DateFrom && p.DateTo >= frmDate));
            if (item != null)
                return true;
            else
            {
                return false;
            }
        }

        public bool SaveAccomodationType(int id, string name)
        {
            var orderCount = _repository.All<Domain.AccommodationType>().ToList();
            var item = _repository.All<Domain.AccommodationType>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                item.Name = name;

            }
            else
            {
                var meal = new AccommodationType { Name = name, IsActive = true, DisplayOrder = orderCount.Count() + 1 };
                _repository.Add(meal);
            }
            _unitOfWork.Commit();

            return true;
        }
        public bool SaveAccomodationStandard(int id, string name)
        {
            var orderCount = _repository.All<Domain.AccommodationStandard>().ToList();
            var item = _repository.All<Domain.AccommodationStandard>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                item.Name = name;

            }
            else
            {
                var meal = new AccommodationStandard { Name = name, IsActive = true, DisplayOrder = orderCount.Count() + 1 };
                _repository.Add(meal);
            }
            _unitOfWork.Commit();

            return true;
        }
        public bool SaveFeatureGroup(int id, string name)
        {
            var item = _repository.All<Domain.FeatureCategory>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                item.Name = name;

            }
            else
            {
                var meal = new FeatureCategory { Name = name };
                _repository.Add(meal);
            }
            _unitOfWork.Commit();

            return true;
        }

        public bool SaveTravelBy(int id, string name)
        {
            var item = _repository.All<Domain.TravelBy>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                item.Name = name;

            }
            else
            {
                var meal = new TravelBy { Name = name };
                _repository.Add(meal);
            }
            _unitOfWork.Commit();

            return true;
        }
        public bool RemoveTravelBy(int id)
        {
            var item = _repository.All<Domain.TravelBy>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                _repository.Delete(item);
                _unitOfWork.Commit();
            }

            return true;
        }

        public bool RemoveAccomodationType(int id)
        {
            var item = _repository.All<Domain.AccommodationType>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                _repository.Delete(item);
                _unitOfWork.Commit();
            }

            return true;
        }
        public bool RemoveAccomodationStandard(int id)
        {
            var item = _repository.All<Domain.AccommodationStandard>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                _repository.Delete(item);
                _unitOfWork.Commit();
            }

            return true;
        }
        public bool RemoveFeatureGroup(int id)
        {
            var item = _repository.All<Domain.FeatureCategory>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                _repository.Delete(item);
                _unitOfWork.Commit();
            }

            return true;
        }

        public bool OrderAccomodationtype(int id, int orderId)
        {
            var feature = _repository.All<Domain.AccommodationType>().FirstOrDefault(p => p.Id == id);
            if (feature != null)
            {
                //feature.DisplayOrder = orderId;
                if (feature.DisplayOrder > orderId)
                {
                    var featureOrder =
                        _repository.All<Domain.AccommodationType>().FirstOrDefault(p => p.DisplayOrder == orderId);
                    if (featureOrder != null)
                        featureOrder.DisplayOrder = orderId + 1;
                }
                else
                {
                    var featureOrder =
                        _repository.All<Domain.AccommodationType>().FirstOrDefault(p => p.DisplayOrder == orderId);
                    if (featureOrder != null)
                        featureOrder.DisplayOrder = orderId - 1;
                }
                feature.DisplayOrder = orderId;

            }
            _unitOfWork.Commit();
            return true;
        }
        public bool OrderAccomodationStandard(int id, int orderId)
        {
            var feature = _repository.All<Domain.AccommodationStandard>().FirstOrDefault(p => p.Id == id);
            if (feature != null)
            {
                //feature.DisplayOrder = orderId;
                if (feature.DisplayOrder > orderId)
                {
                    var featureOrder =
                        _repository.All<Domain.AccommodationStandard>().FirstOrDefault(p => p.DisplayOrder == orderId);
                    if (featureOrder != null)
                        featureOrder.DisplayOrder = orderId + 1;
                }
                else
                {
                    var featureOrder =
                        _repository.All<Domain.AccommodationStandard>().FirstOrDefault(p => p.DisplayOrder == orderId);
                    if (featureOrder != null)
                        featureOrder.DisplayOrder = orderId - 1;
                }
                feature.DisplayOrder = orderId;
            }
            _unitOfWork.Commit();
            return true;
        }

        public bool OrderFeature(int id, int orderId)
        {
            var feature = _repository.All<Domain.Feature>().FirstOrDefault(p => p.Id == id);
            if (feature != null)
            {
                //feature.DisplayOrder = orderId;
                if (feature.DisplayOrder > orderId)
                {
                    var featureOrder =
                        _repository.All<Domain.Feature>().FirstOrDefault(p => p.DisplayOrder == orderId);
                    if (featureOrder != null)
                        featureOrder.DisplayOrder = orderId + 1;
                }
                else
                {
                    var featureOrder =
                        _repository.All<Domain.Feature>().FirstOrDefault(p => p.DisplayOrder == orderId);
                    if (featureOrder != null)
                        featureOrder.DisplayOrder = orderId - 1;
                }
                feature.DisplayOrder = orderId;
            }
            _unitOfWork.Commit();
            return true;
        }

        public bool OrderMealType(int id, int orderId)
        {
            var feature = _repository.All<Domain.Cuisine>().FirstOrDefault(p => p.Id == id);
            if (feature != null)
            {
                //feature.DisplayOrder = orderId;
                if (feature.DisplayOrder > orderId)
                {
                    var featureOrder =
                        _repository.All<Domain.Cuisine>().FirstOrDefault(p => p.DisplayOrder == orderId);
                    if (featureOrder != null)
                        featureOrder.DisplayOrder = orderId + 1;
                }
                else
                {
                    var featureOrder =
                        _repository.All<Domain.Cuisine>().FirstOrDefault(p => p.DisplayOrder == orderId);
                    if (featureOrder != null)
                        featureOrder.DisplayOrder = orderId - 1;
                }
                feature.DisplayOrder = orderId;
            }
            _unitOfWork.Commit();
            return true;
        }
        public bool OrderSliderImage(int id, int orderId)
        {
            var image = _repository.All<Domain.BannerImage>().FirstOrDefault(p => p.Id == id);
            if (image != null)
            {
                //feature.DisplayOrder = orderId;
                if (image.DisplayOrder > orderId)
                {
                    var featureOrder =
                        _repository.All<Domain.BannerImage>().FirstOrDefault(p => p.DisplayOrder == orderId);
                    if (featureOrder != null)
                        featureOrder.DisplayOrder = orderId + 1;
                }
                else
                {
                    var featureOrder =
                        _repository.All<Domain.BannerImage>().FirstOrDefault(p => p.DisplayOrder == orderId);
                    if (featureOrder != null)
                        featureOrder.DisplayOrder = orderId - 1;
                }
                image.DisplayOrder = orderId;
            }
            _unitOfWork.Commit();
            return true;
        }


        public Domain.MainCity GetMainCity(int id)
        {
            return _repository.All<Domain.MainCity>().FirstOrDefault(p => p.Id == id);
        }

        public bool OrderFeatureGroup(int id, int orderId)
        {
            var feature = _repository.All<Domain.FeatureCategory>().FirstOrDefault(p => p.Id == id);
            if (feature != null)
            {
                //feature.DisplayOrder = orderId;
                if (feature.DisplayOrder > orderId)
                {
                    var featureOrder =
                        _repository.All<Domain.FeatureCategory>().FirstOrDefault(p => p.DisplayOrder == orderId);
                    if (featureOrder != null)
                        featureOrder.DisplayOrder = orderId + 1;
                }
                else
                {
                    var featureOrder =
                        _repository.All<Domain.FeatureCategory>().FirstOrDefault(p => p.DisplayOrder == orderId);
                    if (featureOrder != null)
                        featureOrder.DisplayOrder = orderId - 1;
                }
                feature.DisplayOrder = orderId;

            }
            _unitOfWork.Commit();
            return true;
        }
        public bool OrderTravelBy(int id, int orderId)
        {
            var feature = _repository.All<Domain.TravelBy>().FirstOrDefault(p => p.Id == id);
            if (feature != null)
            {
                //feature.DisplayOrder = orderId;
                if (feature.DisplayOrder > orderId)
                {
                    var featureOrder =
                        _repository.All<Domain.TravelBy>().FirstOrDefault(p => p.DisplayOrder == orderId);
                    if (featureOrder != null)
                        featureOrder.DisplayOrder = orderId + 1;
                }
                else
                {
                    var featureOrder =
                        _repository.All<Domain.TravelBy>().FirstOrDefault(p => p.DisplayOrder == orderId);
                    if (featureOrder != null)
                        featureOrder.DisplayOrder = orderId - 1;
                }
                feature.DisplayOrder = orderId;

            }
            _unitOfWork.Commit();
            return true;
        }
        public bool OrderOccupation(int id, int orderId)
        {
            var feature = _repository.All<Domain.Designation>().FirstOrDefault(p => p.Id == id);
            if (feature != null)
            {
                //feature.DisplayOrder = orderId;
                if (feature.DisplayOrder > orderId)
                {
                    var featureOrder =
                        _repository.All<Domain.Designation>().FirstOrDefault(p => p.DisplayOrder == orderId);
                    if (featureOrder != null)
                        featureOrder.DisplayOrder = orderId + 1;
                }
                else
                {
                    var featureOrder =
                        _repository.All<Domain.Designation>().FirstOrDefault(p => p.DisplayOrder == orderId);
                    if (featureOrder != null)
                        featureOrder.DisplayOrder = orderId - 1;
                }
                feature.DisplayOrder = orderId;

            }
            _unitOfWork.Commit();
            return true;
        }

        public bool AddReviewComments(int visitorId, string comment, int propertyId)
        {
            var comments = _repository.All<Domain.VisitorReview>().FirstOrDefault(p => p.VisitorId == visitorId && p.PropertyId == propertyId);
            if (comments == null)
            {
                var review = new VisitorReview
                {
                    VisitorId = visitorId,
                    PropertyId = propertyId,
                    Comments = comment
                };
                _repository.Add(review);
            }
            else
            {
                comments.Comments = comment;
            }
            _unitOfWork.Commit();
            return true;
        }
        public IEnumerable<VisitorReview> GetReviewComments(int propertyId)
        {
            return _repository.All<Domain.VisitorReview>().Where(p => p.PropertyId == propertyId);
        }
        public VisitorReview GetReview(int id)
        {
            return _repository.All<Domain.VisitorReview>().FirstOrDefault(p => p.Id == id);
        }

        public IEnumerable<VisitorReview> GetReviewComments()
        {
            return _repository.All<Domain.VisitorReview>();
        }

        #region Rooms
        public bool SaveRoom(Room room)
        {
            _repository.Add(room);
            _unitOfWork.Commit();
            return true;
        }
        public bool UpdateRoom(Room model)
        {
            var item = _repository.All<Room>().FirstOrDefault(q => q.Id == model.Id);
            if (item != null)
            {
                item.PropertyId = model.PropertyId;
                item.Name = model.Name;
                item.Description = model.Description;
                item.DisplayPrice = model.DisplayPrice;
                item.Squarefeet = model.Squarefeet;
                //item.LandLinePrimary = model.LandLinePrimary;
                item.VideoUrl = model.VideoUrl;
                item.IsActive = true;


                _unitOfWork.Commit();
            }
            return true;
        }
        public Room GetRoom(int id)
        {
            return (from r in _repository.All<Room>()
                                         .Include(x => x.RoomImages)
                                         .Include(x => x.BedRooms)
                    select r).FirstOrDefault(q => q.Id == id);
        }

        public bool DeleteRoom(int id)
        {
            var item = _repository.All<Room>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                _repository.Delete(item);
                _unitOfWork.Commit();

                //To DO
                // Delete all related entity for this property
            }

            return true;
        }
        public IEnumerable<Room> GetRooms()
        {
            return (from r in _repository.All<Room>()
                                         .Include(x => x.RoomImages)
                                         .Include(x => x.BedRooms)
                    select r).OrderBy(o => o.Name);

        }
        public bool AddRoomImage(int propertyId, string filePath, string description, bool isDefault)
        {
            var image = new RoomImage
            {
                Id = 0,
                ImageDescription = description,
                ImagePath = filePath,
                DefaultImage = isDefault,
                RoomId = propertyId
            };
            try
            {
                _repository.Add(image);
                _unitOfWork.Commit();
                return true;
            }
            catch
            {
                return false;
            }

        }
        public bool RemoveRoomImage(int imageId, int propertyId)
        {
            var image = _repository.All<RoomImage>().FirstOrDefault(p => p.RoomId == propertyId && p.Id == imageId);
            if (image != null)
            {
                _repository.Delete(image);
                _unitOfWork.Commit();
            }
            return true;
        }
        public IEnumerable<RoomImage> RoomImages(int roomId)
        {
            return _repository.All<RoomImage>().Where(p => p.RoomId == roomId).ToList();
        }

        #endregion

        #region Beds
        public bool SaveBed(Bed bed)
        {
            _repository.Add(bed);
            _unitOfWork.Commit();
            return true;
        }
        public bool UpdateBed(Bed model)
        {
            var item = _repository.All<Bed>().FirstOrDefault(q => q.Id == model.Id);
            if (item != null)
            {
                item.BedName = model.BedName;
                item.Occupancy = model.Occupancy;
                item.ChildOccupancy = model.ChildOccupancy;
                item.Rate = model.Rate;
                _unitOfWork.Commit();
            }
            return true;
        }
        public Bed GetBed(int id)
        {
            return _repository.All<Bed>().FirstOrDefault(q => q.Id == id);
        }

        public bool DeleteBed(int id)
        {
            var item = _repository.All<Bed>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                _repository.Delete(item);
                _unitOfWork.Commit();

                //To DO
                // Delete all related entity for this property
            }

            return true;
        }
        public IEnumerable<Bed> GetBeds()
        {
            return _repository.All<Bed>().OrderBy(o => o.BedName).ToList();

        }

        #endregion


        #region Dining rates
        public bool SaveDiningRate(DiningRate rate)
        {
            _repository.Add(rate);
            _unitOfWork.Commit();
            return true;
        }
        public bool UpdateDiningRate(DiningRate model)
        {
            var item = _repository.All<DiningRate>().FirstOrDefault(q => q.Id == model.Id);
            if (item != null)
            {
                item.Name = model.Name;
                item.Rate = model.Rate;
                item.ChildRate = model.ChildRate;
                _unitOfWork.Commit();
            }
            return true;
        }
        public DiningRate GetDiningRate(int id)
        {
            return _repository.All<DiningRate>().FirstOrDefault(q => q.Id == id);
        }

        public bool DeleteDiningRate(int id)
        {
            var item = _repository.All<DiningRate>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                _repository.Delete(item);
                _unitOfWork.Commit();

               
            }

            return true;
        }
        public IEnumerable<DiningRate> GetDiningRates()
        {
            return _repository.All<DiningRate>().OrderBy(o => o.Name).ToList();

        }

        #endregion

        #region Transports
        public bool SaveTransport(Transport rate)
        {
            _repository.Add(rate);
            _unitOfWork.Commit();
            return true;
        }
        public bool UpdateTransport(Transport model)
        {
            var item = _repository.All<Transport>().FirstOrDefault(q => q.Id == model.Id);
            if (item != null)
            {
                item.Name = model.Name;
                item.Rate = model.Rate;
               _unitOfWork.Commit();
            }
            return true;
        }
        public Transport GetTransport(int id)
        {
            return _repository.All<Transport>().FirstOrDefault(q => q.Id == id);
        }

        public bool DeleteTransport(int id)
        {
            var item = _repository.All<Transport>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                _repository.Delete(item);
                _unitOfWork.Commit();


            }

            return true;
        }
        public IEnumerable<Transport> GetTransports()
        {
            return _repository.All<Transport>().OrderBy(o => o.Name).ToList();

        }

        #endregion

        #region beds for room
        public bool SaveBedForRoom(BedRoom bed)
        {
            _repository.Add(bed);
            _unitOfWork.Commit();
            return true;
        }
        public bool UpdateBedRoom(BedRoom model)
        {
            var item = _repository.All<BedRoom>().FirstOrDefault(q => q.Id == model.Id);
            if (item != null)
            {
                item.RoomId = model.RoomId;
                item.BedId = model.BedId;
                item.Rate = model.Rate;
                _unitOfWork.Commit();
            }
            return true;
        }
        public bool DeleteBedRoom(int id)
        {
            var item = _repository.All<BedRoom>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                _repository.Delete(item);
                _unitOfWork.Commit();

               
            }

            return true;
        }
        public bool DeleteBedsForRoom(int roomId)
        {
            var items = _repository.All<BedRoom>().Where(p => p.RoomId == roomId);
            foreach (var bedRoom in items)
            {
                _repository.Delete(bedRoom);
                
            }
            _unitOfWork.Commit();
            return true;
        }
        
        public IEnumerable<BedRoom> GetBedRooms(int roomId)
        {
            return _repository.All<BedRoom>().Where(q=>q.RoomId==roomId).ToList();

        }

        public IEnumerable<BedRoom> GetBedRooms()
        {
            return (from r in _repository.All<BedRoom>()
                        .Include(x=>x.Bed)
                        .Include(x=>x.Room)
                        select r)
                        .ToList();

        }
        #endregion

        #region Activities
        public bool SaveActivity(Activity activity)
        {
            _repository.Add(activity);
            _unitOfWork.Commit();
            return true;
        }
        public bool UpdateActivity(Activity model)
        {
            var item = _repository.All<Activity>().FirstOrDefault(q => q.Id == model.Id);
            if (item != null)
            {
                item.Name = model.Name;
                item.Description = model.Description;
                item.ChildRate = model.ChildRate;
                item.PropertyId = model.PropertyId;
                item.Rate = model.Rate;
                _unitOfWork.Commit();
            }
            return true;
        }
        public Activity GetActivity(int id)
        {
            return _repository.All<Activity>().FirstOrDefault(q => q.Id == id);
        }

        public bool DeleteActivity(int id)
        {
            var item = _repository.All<Activity>().FirstOrDefault(p => p.Id == id);
            if (item != null)
            {
                _repository.Delete(item);
                _unitOfWork.Commit();

                //To DO
                // Delete all related entity for this property
            }

            return true;
        }
        public IEnumerable<Activity> GetActivities(int propertyId)
        {
            return _repository.All<Activity>().Where(r => r.PropertyId == propertyId).OrderBy(o => o.Name).ToList();

        }
        public IQueryable<Room> GetAvailableRooms(string checkIn, string checkOut, int adult, int child, int belowYrs)
        {
            var frmDate = Convert.ToDateTime(checkIn);
            var toDate = Convert.ToDateTime(checkOut);
            
            var availRooms = (from r in _repository.All<Room>()
                              where r.BedRooms.Count>0
                             select r).Include(x => x.BedRooms)
                             
                             .Include(x => x.RoomImages).AsQueryable();

            var rooms = (from r in _repository.All<Room>()
                         join b in _repository.All<Booking>() 
                         on r.Id equals b.PropertyId
                         where (frmDate >= b.DateFrom && b.DateTo >= frmDate)
                         where r.BedRooms.Count > 0
                         select r).Include(x => x.BedRooms).Include(x => x.RoomImages).AsQueryable();

            availRooms = availRooms.Except(rooms).Distinct();
            return availRooms;
            
        }
        #endregion
        
        public bool SaveInvoice(Invoice invoice)
        {
            _repository.Add(invoice);
            _unitOfWork.Commit();
            return true;
        }

        public bool SaveBookingRoom(Booking  booking)
        {
            _repository.Add(booking);
            _unitOfWork.Commit();
            return true;
        }
        public bool UpdateInvoice(int companyId,int invoiceId)
        {
            var inv = _repository.All<Invoice>().FirstOrDefault(p => p.Id == invoiceId && p.CompanyId==companyId);
            if (inv != null)
            {
                inv.PaymentMade = true;
                _unitOfWork.Commit();
            }
            _unitOfWork.Commit();
            return true;
        }

        public  string InvoiceNumber()
        {
            var no = string.Empty;
            var invNo = _repository.All<InvoiceNumber>().FirstOrDefault(p => p.Id == 1);
            if (invNo != null)
            {
                no = invNo.InvoicePrefix.Trim() + "-" + FormatInvoiceNo(invNo.InvoiceNo);
                invNo.InvoiceNo++;
                _unitOfWork.Commit();
            }

            return no.Trim();
        }
        private string FormatInvoiceNo(int id)
        {
            var strFormat = "";
            var idLength = id.ToString(CultureInfo.InvariantCulture);
            for (int i = idLength.Length; i < 3; i++)
            {
                strFormat = strFormat + "0";
            }
            return strFormat + id.ToString(CultureInfo.InvariantCulture);
        }
    }
}
