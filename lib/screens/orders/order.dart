import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/provider/order_provider.dart';
import 'package:flutter_ecommerce/screens/orders/order_empty.dart';
import 'package:flutter_ecommerce/screens/orders/order_item.dart';

import 'package:provider/provider.dart';

import '../../provider/cart_provider.dart';

class Order extends StatefulWidget {
  static const routeName = '\Order';
  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    final _orderProvider = Provider.of<OrderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Order (${_orderProvider.getOrders.length})',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
          future: _orderProvider.fetchOrders(),
          builder: (context, snapshot) {
            return Container(
              child: ListView.builder(
                itemCount: _orderProvider.getOrders.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return ChangeNotifierProvider.value(
                      value: _orderProvider.getOrders[index],
                      child: OrderItem());
                  // );
                },
              ),
            );
          }),
    );
  }
}
