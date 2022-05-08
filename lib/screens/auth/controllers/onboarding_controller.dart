import 'package:flutter_ecommerce/screens/auth/models/onboarding_info.dart';

class OnboardingController {
  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/images/order.png', 'Order Your Products',
        'Now you can order food any time right from your mobile'),
    OnboardingInfo('assets/images/cook.png', 'Cooking Safe Food',
        'We maintain safty and we keep clean while making food'),
    OnboardingInfo('assets/images/deliver.png', 'Quick Order Delivery',
        'Order your favorite meals will be imediately deliver'),
  ];
}
