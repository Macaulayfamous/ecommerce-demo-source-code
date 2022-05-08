import 'package:flutter/material.dart';

import 'package:flutter_ecommerce/models/clothes.dart';
import 'package:flutter_ecommerce/models/feed_product.dart';
import 'package:flutter_ecommerce/provider/product.dart';

import 'package:flutter_ecommerce/screens/home/widgets/custorm_bar.dart';
import 'package:flutter_ecommerce/screens/home/widgets/new_arrival.dart';
import 'package:flutter_ecommerce/screens/home/widgets/popular_product.dart';
import 'package:flutter_ecommerce/screens/home/widgets/reuseable_text.dart';
import 'package:flutter_ecommerce/screens/home/widgets/search_input.dart';
import 'package:flutter_ecommerce/screens/home/widgets/tag_list.dart';
import 'package:flutter_ecommerce/screens/widgets/category.dart';
import 'package:flutter_ecommerce/screens/widgets/category_listview.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final bottomList = ['home', 'menu', 'heart', 'user'];
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);

    productData.fetchProducts();

    return Scaffold(
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomBar(),
          SearchInput(),
          TagList(),
          // ReuseableText('Categories'),
          CategoryListView(),

          NewArrival(),
        ]),
      ),
    );
  }
}
