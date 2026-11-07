class OrderModel {
  final String orderNumber;
  final String status; // "Delivered", "Cancelled", "Ongoing"
  final String date;
  final double totalPrice;

  OrderModel({
    required this.orderNumber,
    required this.status,
    required this.date,
    required this.totalPrice,
  });
}
