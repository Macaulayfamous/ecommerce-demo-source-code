import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/const.dart';
import 'package:flutter_ecommerce/models/cart_attr.dart';
import 'package:flutter_ecommerce/models/order.dart';
import 'package:flutter_ecommerce/provider/cart_provider.dart';
import 'package:flutter_ecommerce/provider/order_provider.dart';

import 'package:provider/provider.dart';

class OrderItem extends StatefulWidget {
  final String? productId;

  const OrderItem({Key? key, this.productId}) : super(key: key);
  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    final orderAttr = Provider.of<OrderAttr>(context);

    return Container(
      height: 130,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: Colors.white70),
      child: Row(
        children: [
          Container(
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage('${orderAttr.imageUrl}'),
                  fit: BoxFit.fill),
            ),
          ),
          SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          orderAttr.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              isLoading = true;
                            });
                            await firebase
                                .collection('orders')
                                .doc(orderAttr.orderid)
                                .delete();
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            child: isLoading
                                ? CircularProgressIndicator()
                                : Icon(
                                    CupertinoIcons.xmark,
                                    color: Colors.red.withOpacity(0.8),
                                    size: 30,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          orderAttr.price,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // Text(
                        //   '50',
                        //   style: TextStyle(
                        //     fontSize: 16,
                        //     fontWeight: FontWeight.w600,
                        //   ),
                        // )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Ship Free'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
