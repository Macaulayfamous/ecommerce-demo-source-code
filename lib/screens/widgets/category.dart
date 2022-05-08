import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/detail/category_detail.dart';

class Category extends StatefulWidget {
  final int index;
  Category(this.index);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<Map<String, Object>> categories = [
    {
      'categoryName': 'Phones',
      'categoryImage': 'assets/images/CatPhones.png',
    },
    {
      'categoryName': 'Clothes',
      'categoryImage': 'assets/images/CatClothes.jpg',
    },
    {
      'categoryName': 'Shoes',
      'categoryImage': 'assets/images/CatShoes.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(CategoryDetail.routeName,
                  arguments:
                      '${categories[widget.index]['categoryName'].toString()}');
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    image: DecorationImage(
                        image: AssetImage(categories[widget.index]
                                ['categoryImage']
                            .toString()))),
              ),
            ),
          ),
        ),
        Text(
          '${categories[widget.index]['categoryName']}',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        )
      ],
    );
  }
}
