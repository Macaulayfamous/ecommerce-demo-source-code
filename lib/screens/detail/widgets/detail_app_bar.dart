// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_ecommerce/models/clothes.dart';
// import 'package:flutter_ecommerce/models/feed_product.dart';

// class DetailAppBar extends StatefulWidget {
//   static const routeName = '\DetailAppBar';

//   final ProductModel productItem;
//   DetailAppBar(this.productItem);

//   @override
//   _DetailAppBarState createState() => _DetailAppBarState();
// }

// class _DetailAppBarState extends State<DetailAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25),
//       ),
//       child: Stack(
//         children: [
//           Container(
//             height: 500,
//             child: Image.network(
//               widget.productItem.imageUrl.toString(),
//               fit: BoxFit.fitHeight,
//             ),
//           ),
//           Positioned(
//             top: 56,
//             left: 20,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 10),
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Container(
//                   padding: EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(
//                     Icons.arrow_back_ios,
//                     size: 15,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
