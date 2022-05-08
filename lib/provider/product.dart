import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce/models/feed_product.dart';

class Products with ChangeNotifier {
  List<ProductModel> _items = [];
  List<ProductModel> get products {
    return _items;
  }

  Future<void> fetchProducts() async {
    await FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((QuerySnapshot productSnapshot) {
      _items = [];
      productSnapshot.docs.forEach((element) {
        _items.insert(
          0,
          ProductModel(
            id: element.get('productId'),
            tiltle: element.get('productTitle'),
            imageUrl: element.get('image'),
            categoryName: element.get('productCategory'),
            price: double.parse(
              element.get('price'),
            ),
            isPopular: false,
            description: element.get('productDescription'),
          ),
        );
        notifyListeners();
      });
    });
  }

  ProductModel findById(String productId) {
    return _items.firstWhere((element) => element.id == productId);
  }

  List<ProductModel> get popularProduct {
    return _items.where((element) => element.isPopular!).toList();
  }

  List<ProductModel> findByCategory(String categoryName) {
    List _categoryList = _items
        .where((element) => element.categoryName!
            .toLowerCase()
            .contains(categoryName.toLowerCase()))
        .toList();
    return [..._categoryList];
  }

  notifyListeners();
}

//   ProductModel(
//       id: 'Gucci Oversize1',
//       tiltle: 'Hoodie',
//       description: 'Best Gucci  of Recent Model ',
//       price: 60.99,
//       imageUrl: 'assets/images/arrival1.png',
//       categoryName: 'clothes'),
//   ProductModel(
//       id: 'Gucci Oversize1',
//       tiltle: 'Hoodie',
//       description: 'Best Gucci  of Recent Model ',
//       price: 60.99,
//       imageUrl: 'assets/images/arrival1.png',
//       categoryName: 'clothes'),
//   ProductModel(
//       id: 'Samsung2',
//       tiltle: 'Hoodie',
//       description: 'Best Samsung  of Recent Model ',
//       price: 40.99,
//       imageUrl: 'assets/images/samsung.jpg',
//       categoryName: 'phones'),
//   ProductModel(
//       id: 'Shoe1',
//       tiltle: 'Shoes',
//       description: 'Best Selling Sheos  of Recent Model ',
//       price: 40.99,
//       imageUrl: 'assets/images/shoe1.jpg',
//       categoryName: 'shoes'),
//   ProductModel(
//       id: 'Nike4',
//       tiltle: 'Nike',
//       description: 'Best Nike Shoes  of Recent Model ',
//       price: 40.99,
//       imageUrl: 'assets/images/nike.jpg',
//       categoryName: 'laptops')
// ];
