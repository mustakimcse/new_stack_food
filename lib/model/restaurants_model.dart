class Restaurant {
  final int id;
  final String name;
  final String foodImage;
  final String restImage;
  final String time;
  final String leftTime;
  final int currentPrice;
  final List<Food> foodList;

  Restaurant({
    required this.id,
    required this.name,
    required this.foodImage,
    required this.restImage,
    required this.time,
    required this.leftTime,
    required this.currentPrice,
    required this.foodList,
  });

  // Factory constructor for JSON parsing
  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      foodImage: json['foodImage'],
      restImage: json['restImage'],
      time: json['time'],
      leftTime: json['leftTime'],
      currentPrice: json['currentPrice'],
      foodList: (json['foodList'] as List<dynamic>)
          .map((food) => Food.fromJson(food))
          .toList(),
    );
  }

  // Convert the Restaurant object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'foodImage': foodImage,
      'restImage': restImage,
      'time': time,
      'leftTime': leftTime,
      'currentPrice': currentPrice,
      'foodList': foodList.map((food) => food.toJson()).toList(),
    };
  }
}

class Food {
  final String name;
  final double price;
  final String imageUrl;

  Food({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  // Factory constructor for JSON parsing
  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }

  // Convert the Food object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}
