import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/dialogs.dart';


// Define the CartController for managing cart state with Get
class CartController extends GetxController {
  var cartItems = <int, CartItem>{}.obs;
  var discountAmountDefault = 0.0.obs;
  var userDefinedDiscount = 0.0.obs;

  var totalDiscountAmount=0.0.obs;
  var totalPriceAfterDiscount = 0.0.obs;



  @override
  void onInit() {
    super.onInit();
    _loadCart();
    // _loadDiscountData();
  }


  // Compute the total price of items in the cart before discount
  double get totalPriceBeforeDiscount {
    double total= cartItems.entries.fold(0.0, (total, entry) {
      return total + entry.value.price * entry.value.quantity.value;
    });
    discountAmountDefault.value = total  * (5 / 100);

    return total-discountAmountDefault.value;
  }

  // Calculate the discount and total price after discount
  void _calculateDiscount() {
    // Use the user-defined discount if it's greater than 0; otherwise, use the default discount
    double appliedDiscount = userDefinedDiscount.value;
    var discountAmount = totalPriceBeforeDiscount * (appliedDiscount / 100);
    totalPriceAfterDiscount.value = totalPriceBeforeDiscount - discountAmount;
    totalDiscountAmount.value=discountAmountDefault.value+discountAmount;
  }



  // Method to set a custom discount provided by the user
  void setUserDefinedDiscount(double discount) {
    userDefinedDiscount.value = discount;
    _calculateDiscount(); // Recalculate discount after setting user discount
  }


  // Compute the total price of items in the cart
  double get totalPrice {
    return cartItems.entries.fold(0.0, (total, entry) {
      return total + entry.value.price * entry.value.quantity.value;
    });
  }

  // Compute the total quantity of items in the cart
  int get totalQuantity {
    return cartItems.entries.fold(0, (total, entry) {
      return total + entry.value.quantity.value;
    });
  }

  // Add item to cart or increment quantity if it exists
  void addToCart(int bookId, String name,pub, double price, double mrp_price, String image) {
    if (cartItems.containsKey(bookId)) {
      cartItems[bookId]!.quantity += 1;

    } else {
      cartItems[bookId] = CartItem(
        id: bookId,
        name: name,
        pub: pub,
        price: price,
        mrp_price: mrp_price,
        image: image,
        quantity: 1,
      );

    }
    _saveCart();
    _calculateDiscount();
  }

  // Increment item quantity
  void incrementQuantity(int bookId) {
    if (cartItems.containsKey(bookId)) {
      cartItems[bookId]!.quantity += 1;
      _saveCart();
      _calculateDiscount();
    }
  }

  // Decrement item quantity, and remove if quantity <= 0
  void decrementQuantity(int bookId) {
    if (cartItems.containsKey(bookId) && cartItems[bookId]!.quantity > 1) {
      cartItems[bookId]!.quantity -= 1;
    } else {
      cartItems.remove(bookId);
    }
    _saveCart();
    _calculateDiscount();
  }

  // Save cart data to SharedPreferences
  Future<void> _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartString = jsonEncode(
      cartItems.map((key, item) => MapEntry(key.toString(), item.toJson())),
    );
    prefs.setString('cart', cartString);
  }

  // Load cart data from SharedPreferences
  Future<void> _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartString = prefs.getString('cart');
    if (cartString != null) {
      final decodedCart = jsonDecode(cartString) as Map<String, dynamic>;
      cartItems.clear();
      decodedCart.forEach((key, value) {
        cartItems[int.parse(key)] = CartItem.fromJson(value as Map<String, dynamic>);
      });
    }
    _calculateDiscount();
  }



  // New method to store cart data on the server
  Future<Map<String, dynamic>> getCartPayload() async {
    final cartPayload = {
      "cart_items": cartItems.entries.map((entry) {
        return {
          "product_id": entry.value.id,
          "quantity": entry.value.quantity.value,
        };
      }).toList(),
    };

    return cartPayload; // Return the cart payload map
  }

  void clearCart() async {
    // Clear in-memory cart items
    cartItems.clear();
    // Remove cart data from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('cart');

  }
}

// Model class for CartItem
class CartItem {
  final int id;
  final String name;
  final String pub;
  final double price;
  final double mrp_price;
  final String image;
  RxInt quantity; // Make quantity reactive

  CartItem({
    required this.id,
    required this.name,
    required this.pub,
    required this.price,
    required this.mrp_price,
    required this.image,
    required int quantity,  // Initial non-reactive quantity
  }) : quantity = quantity.obs;  // Make it reactive

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'pub': name,
    'price': price,
    'mrp_price': mrp_price,
    'image': image,
    'quantity': quantity.value, // Save raw value
  };

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      name: json['name'],
      pub: json['pub'],
      price: json['price'],
      mrp_price: json['mrp_price'] ?? 0.0,
      image: json['image'],
      quantity: json['quantity'], // Set initial quantity
    );
  }
}

