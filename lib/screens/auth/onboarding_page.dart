import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/auth/controllers/onboarding_controller.dart';
import 'package:flutter_ecommerce/screens/auth/user_state.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = OnboardingController();
  final _pageController = PageController();

  _fowardPage() {
    _pageController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: controller.onboardingPages.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(controller.onboardingPages[index].imageAsset),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      controller.onboardingPages[index].title,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 64),
                      child: Text(
                        controller.onboardingPages[index].desc,
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: SmoothPageIndicator(
              onDotClicked: (index) {
                _pageController.animateToPage(index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              effect: ExpandingDotsEffect(
                expansionFactor: 4,
                spacing: 8,
              ),
              controller: _pageController,
              count: controller.onboardingPages.length,
            ),
          ),
          Positioned(
              bottom: 5,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  _fowardPage();
                },
                child: Chip(
                  backgroundColor: Colors.blue.shade900,
                  label: Text(
                    'Next',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )),
          Positioned(
              top: 5,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => UserState()));
                },
                child: Chip(
                  backgroundColor: Colors.white70,
                  label: Text(
                    'Skip',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              )),
        ],
      ),
    ));
  }
}
