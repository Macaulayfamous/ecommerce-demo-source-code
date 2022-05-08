import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/feeds.dart';

class OrderEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 80),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/emptycart.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Text(
          'Your Shopping Cart\nis Empty',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, FeedsScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Theme.of(context).accentColor),
                ),
              ),
              child: Text(
                'Shop now',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.pink,
                  fontWeight: FontWeight.w600,
                ),
              )),
        )
      ],
    );
  }
}
