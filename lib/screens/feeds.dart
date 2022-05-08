import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/feed_product.dart';
import 'package:flutter_ecommerce/provider/product.dart';

import 'package:flutter_ecommerce/screens/widgets/feeds_product.dart';
import 'package:provider/provider.dart';

class FeedsScreen extends StatefulWidget {
  static const routeName = '\FeedsScreen';

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    // productsProvider.fetchProducts();
    List<ProductModel> productList = productsProvider.products;

    return Scaffold(
      appBar: AppBar(
        title: Text('Feeds Products',
            style: TextStyle(
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.white.withOpacity(0.9),
                ),
              ],
            ),
          )
        ],
      ),
      body: Center(
        child: RefreshIndicator(
          onRefresh: () async {
            await productsProvider.fetchProducts();
            setState(() {});
          },
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 4,
            childAspectRatio: 300 / 400,
            children: List.generate(
              productList.length,
              (index) => ChangeNotifierProvider.value(
                value: productList[index],
                child: FeedProduct(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
