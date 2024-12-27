class OrderModel {
  final String orderId;
  final String date;
  final String status;
  final List<OrderItem> items;
  final double total;


  OrderModel({
    required this.orderId,
    required this.date,
    required this.status,
    required this.items,
    required this.total,

  });
}

class OrderItem {
  final String image;
  final String title;
  final int quantity;

  OrderItem({
    required this.image,
    required this.title,
    required this.quantity,
  });
}
