import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce/const.dart';
import 'package:flutter_ecommerce/provider/cart_provider.dart';
import 'package:flutter_ecommerce/screens/widgets/cart_empty.dart';
import 'package:flutter_ecommerce/screens/widgets/cart_item.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var uuid = Uuid();
  bool isLoading = false;

  orderProduct() async {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final userId = firebaseAuth.currentUser!.uid;
    setState(() {
      isLoading = true;
    });
    cartProvider.getCartItems.forEach((key, orderValue) async {
      final orderId = uuid.v4();

      firebase.collection('orders').doc(orderId).set({
        'orderId': orderId,
        'userId': userId,
        'productId': orderValue.productId,
        'title': orderValue.title,
        'price': orderValue.price,
        'image': orderValue.imageUrl,
        'quantity': orderValue.quantity,
      });
      setState(
        () {
          isLoading = false;
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final _cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Cart (${_cartProvider.getCartItems.length})',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _cartProvider.clearCart();
            },
            icon: Icon(CupertinoIcons.delete),
          ),
        ],
      ),
      bottomSheet: checkoutSection(context, _cartProvider.totalAmount),
      body: _cartProvider.getCartItems.isEmpty
          ? CartEmpty()
          : ListView.builder(
              itemCount: _cartProvider.getCartItems.length,
              itemBuilder: (BuildContext ctx, int index) {
                return ChangeNotifierProvider.value(
                  value: _cartProvider.getCartItems.values.toList()[index],
                  child: CartItem(
                    productId: _cartProvider.getCartItems.keys.toList()[index],
                  ),
                );
              },
            ),
    );
  }

  Widget checkoutSection(BuildContext context, subtotal) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Material(
                borderRadius: BorderRadius.circular(30),
                color: Colors.red,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: orderProduct,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            'Checkout',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).backgroundColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Text(
              'Total',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 10),
            Text(
              subtotal.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
