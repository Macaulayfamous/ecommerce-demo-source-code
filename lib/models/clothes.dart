import 'package:flutter/widgets.dart';

class Clothes with ChangeNotifier {
  String title;
  String subtitle;
  String price;
  String imageUrl;
  List<String> imageDetail;

  Clothes(
      this.title, this.subtitle, this.price, this.imageUrl, this.imageDetail);

  static List<Clothes> generateClothes() {
    return [
      Clothes(
        'Gucci Oversize',
        'Hoodie',
        '\$79.99',
        'assets/images/arrival1.png',
        [ 'assets/images/arrival1.png','assets/images/detail2.png', 'assets/images/detail3.png'],
      ),
      Clothes(
        'Men Suit',
        'Coat',
        '\$89.99',
        'assets/images/arrival2.png',
        ['assets/images/arrival2.png','assets/images/detail2.png', 'assets/images/detail3.png'],
      ),
    ];
  }
}
