import 'package:flutter/material.dart';

import 'package:flutter_ecommerce/screens/home/widgets/reuseable_text.dart';

class PopularProducts extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double? price;

  const PopularProducts(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.description,
      required this.price})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                        image: NetworkImage(imageUrl.toString())),
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 15,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              '$title',
              style: TextStyle(fontWeight: FontWeight.bold, height: 1.5),
            ),
            Text(
              '$Icons.price_change_outlined',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                  color: Theme.of(context).primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
