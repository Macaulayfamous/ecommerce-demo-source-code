import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/provider/cart_provider.dart';
import 'package:flutter_ecommerce/provider/product.dart';
import 'package:provider/provider.dart';

class FeedDetail extends StatefulWidget {
  static const routeName = 'FeedDetail';

  @override
  _FeedDetailState createState() => _FeedDetailState();
}

class _FeedDetailState extends State<FeedDetail> {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final productAttr = productData.findById(productId);
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    child: Image.network(
                      productAttr.imageUrl.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 56,
                    left: 20,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${productAttr.tiltle?.toUpperCase()}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Container(
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                    Container(
                      child: Text(
                        '${productAttr.description}',
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.7),
                            height: 1.7,
                            fontSize: 19),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 20, 20, 60),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Price',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              Text(
                                '${productAttr.price}',
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  elevation: 0,
                                  primary: Theme.of(context).primaryColor,
                                ),
                                onPressed: () {
                                  cartProvider.addToCart(
                                      productId,
                                      productAttr.price!.toDouble(),
                                      productAttr.tiltle.toString(),
                                      productAttr.imageUrl.toString());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      cartProvider.getCartItems
                                              .containsKey(productId)
                                          ? 'In Cart'
                                          : 'Add to Cart',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.shopping_cart_outlined),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
