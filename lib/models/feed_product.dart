import 'package:flutter/widgets.dart';

class ProductModel with ChangeNotifier {
  final String? id;
  final String? tiltle;
  final String? description;
  final double? price;
  final String? imageUrl;
  final String? categoryName;
  final bool? isPopular;
  final int? quantity;

  ProductModel({
    this.id,
    this.tiltle,
    this.description,
    this.price,
    this.imageUrl,
    this.categoryName,
    this.isPopular,
    this.quantity,
  });
}
