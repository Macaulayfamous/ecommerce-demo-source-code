import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ecommerce/models/feed_product.dart';
import 'package:flutter_ecommerce/provider/product.dart';

import 'package:flutter_ecommerce/screens/detail/widgets/feeds_detail.dart';
import 'package:provider/provider.dart';

class ClothesItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductModel>(context);
    final productProvider = Provider.of<Products>(context);
    // productProvider.fetchProducts();

    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(FeedDetail.routeName, arguments: products.id);
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      height: 170,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(products.imageUrl.toString()),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 15,
                      child: Badge(
                        toAnimate: true,
                        shape: BadgeShape.square,
                        badgeColor: Colors.pink,
                        borderRadius: BorderRadius.circular(8),
                        badgeContent: Text('New Arrival',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
                Text(
                  products.tiltle.toString().toUpperCase(),
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
                Text(
                  '\$${products.price}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                      color: Theme.of(context).primaryColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
