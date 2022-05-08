import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/feed_product.dart';
import 'package:flutter_ecommerce/provider/product.dart';

import 'package:flutter_ecommerce/screens/widgets/feeds_product.dart';
import 'package:provider/provider.dart';

class CategoryDetail extends StatelessWidget {
  static const routeName = '\CategoryDetail';
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context, listen: false);
    final categoryName = ModalRoute.of(context)!.settings.arguments as String;
    print(categoryName);
    final productList = productsProvider.findByCategory(categoryName);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Catetories',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 30,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 240 / 300,
          children: List.generate(
            productList.length,
            (index) => ChangeNotifierProvider.value(
              value: productList[index],
              child: FeedProduct(),
            ),
          ),
        ),
      ),
    );
  }
}
