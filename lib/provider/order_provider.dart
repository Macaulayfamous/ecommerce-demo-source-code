import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce/const.dart';
import 'package:flutter_ecommerce/models/feed_product.dart';
import 'package:flutter_ecommerce/models/order.dart';

final _user = firebaseAuth.currentUser!.uid;

class OrderProvider with ChangeNotifier {
  List<OrderAttr> _orders = [];
  List<OrderAttr> get getOrders {
    return _orders;
  }

  Future<void> fetchOrders() async {
    await FirebaseFirestore.instance
        .collection('orders')
        .where('userId', isEqualTo: _user)
        .get()
        .then((QuerySnapshot orderSnapshot) {
      _orders.clear();
      orderSnapshot.docs.forEach((element) {
        _orders.insert(
          0,
          OrderAttr(
            orderid: element.get('orderId'),
            userId: element.get('userId'),
            productid: element.get('productId'),
            title: element.get('title'),
            price: element.get('price').toString(),
            imageUrl: element.get('image'),
            quantity: element.get('quantity').toString(),
          ),
        );
        notifyListeners();
      });
    });
  }
}
