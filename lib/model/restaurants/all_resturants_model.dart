class AllRestaurantModel {
  AllRestaurantModel({
    required this.filterData,
    required this.totalSize,
    required this.limit,
    required this.offset,
    required this.restaurants,
  });
  late final String filterData;
  late final int totalSize;
  late final int limit;
  late final int offset;
  late final List<Restaurants> restaurants;

  AllRestaurantModel.fromJson(Map<String, dynamic> json){
    filterData = json['filter_data'];
    totalSize = json['total_size'];
    limit = json['limit'];
    offset = json['offset'];
    restaurants = List.from(json['restaurants']).map((e)=>Restaurants.fromJson(e)).toList();
  }

}

class Restaurants {
  Restaurants({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.logo,
    required this.address,

    required this.minimumOrder,

    this.closeingTime,

    required this.coverPhoto,


    required this.minimumShippingCharge,
    required this.deliveryTime,



    required this.foods,

    required this.ratings,



    required this.currentOpeningTime,

    required this.freeDeliveryDistanceStatus,
    required this.freeDeliveryDistanceValue,

    this.coverPhotoFullUrl,


    required this.schedules,

  });
  late final int id;
  late final String name;
  late final String phone;
  late final String email;
  late final String logo;
  late final String address;

  late final int minimumOrder;

  late final int? closeingTime;

  late final String? coverPhoto;

  late final int minimumShippingCharge;
  late final String? deliveryTime;

  late final List<Foods> foods;


  late final List<dynamic> ratings;


  late final String currentOpeningTime;
  late final bool freeDeliveryDistanceStatus;
  late final String freeDeliveryDistanceValue;
  late final String? coverPhotoFullUrl;
  late final List<Schedules> schedules;


  Restaurants.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    logo = json['logo'];
    address = json['address'];
    minimumOrder = json['minimum_order'];
    closeingTime = null;
    coverPhoto = json['cover_photo'];

    minimumShippingCharge = json['minimum_shipping_charge'];
    deliveryTime = json['delivery_time'];
    foods = List.from(json['foods']).map((e)=>Foods.fromJson(e)).toList();
    ratings = List.castFrom<dynamic, dynamic>(json['ratings']);

    currentOpeningTime = json['current_opening_time'];

    freeDeliveryDistanceStatus = json['free_delivery_distance_status'];
    freeDeliveryDistanceValue = json['free_delivery_distance_value'];
    coverPhotoFullUrl = null;
    schedules = List.from(json['schedules']).map((e)=>Schedules.fromJson(e)).toList();

  }

}





class Foods {
  Foods({
    required this.id,
    required this.image,
    required this.name,
    this.imageFullUrl,

    required this.storage,
  });
  late final int id;
  late final String image;
  late final String name;
  late final String? imageFullUrl;

  late final List<dynamic> storage;

  Foods.fromJson(Map<String, dynamic> json){
    id = json['id'];
    image = json['image'];
    name = json['name'];
    imageFullUrl = null;
    storage = List.castFrom<dynamic, dynamic>(json['storage']);
  }

}



class Schedules {
  Schedules({
    required this.id,
    required this.restaurantId,
    required this.day,
    required this.openingTime,
    required this.closingTime,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final int restaurantId;
  late final int day;
  late final String openingTime;
  late final String closingTime;
  late final String? createdAt;
  late final int? updatedAt;

  Schedules.fromJson(Map<String, dynamic> json){
    id = json['id'];
    restaurantId = json['restaurant_id'];
    day = json['day'];
    openingTime = json['opening_time'];
    closingTime = json['closing_time'];
    createdAt = null;
    updatedAt = null;
  }

}

