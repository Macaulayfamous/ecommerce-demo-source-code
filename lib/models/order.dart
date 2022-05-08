import 'package:flutter/widgets.dart';

class OrderAttr with ChangeNotifier {
  final String orderid;
  final String userId;
  final String productid;
  final String title;
  final String price;
  final String imageUrl;
  final String quantity;

  OrderAttr(
      {required this.orderid,
      required this.userId,
      required this.productid,
      required this.title,
      required this.price,
      required this.imageUrl,
      required this.quantity});
}
