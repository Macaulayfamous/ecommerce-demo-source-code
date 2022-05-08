import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_ecommerce/screens/auth/login.dart';
import 'package:flutter_ecommerce/screens/auth/sign_up.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LandingPage extends StatefulWidget {
  static const routeName = '\LandingPage';

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;
  List<String> images = [
    'https://cdn.pixabay.com/photo/2020/10/06/11/55/woman-5632026_960_720.jpg',
    'https://cdn.pixabay.com/photo/2016/11/19/20/55/apples-1841132_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/12/26/09/15/woman-3040029_960_720.jpg',
    'https://cdn.pixabay.com/photo/2018/01/14/23/08/idea-3082824_960_720.jpg',
    'https://cdn.pixabay.com/photo/2012/02/23/08/57/bag-15841_960_720.jpg',
    'https://cdn.pixabay.com/photo/2012/02/23/08/57/bag-15841_960_720.jpg',
    'https://cdn.pixabay.com/photo/2015/08/04/17/06/shopping-874974_960_720.jpg',
  ];
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isloading = false;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    );
    _animation =
        CurvedAnimation(parent: _animationController!, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animationController?.reset();
              _animationController?.forward();
            }
          });
    _animationController?.forward();
    images.shuffle();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  Future<void> _googleSignIn() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          final authResult = await _auth.signInWithCredential(
              GoogleAuthProvider.credential(
                  idToken: googleAuth.idToken,
                  accessToken: googleAuth.accessToken));
        } catch (error) {
          showDialog(
              context: context,
              builder: (
                BuildContext context,
              ) {
                return AlertDialog(content: Text('error occured${error}'));
              });
        }
      }
      ;
    }
  }

  void loginAnonymosly() async {
    setState(() {
      isloading = true;
    });
    try {
      await _auth.signInAnonymously();
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('data'),
          );
        },
      );
    } finally {
      setState(() {
        isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            // alignment: FractionalOffset(_animation!.value, 0),
            child: CachedNetworkImage(
              imageUrl: images[1],
              placeholder: (context, url) => CircularProgressIndicator(),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: FractionalOffset(_animation!.value, 0),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Text(
                    'Welcome to the biggest Online Store',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(
                            color: Theme.of(context).backgroundColor,
                          ),
                        ),
                        primary: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(
                            color: Theme.of(context).backgroundColor,
                          ),
                        ),
                        primary: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, SignUp.routeName);
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                    ),
                  ),
                  Text('Or Continue with'),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlineButton(
                    onPressed: _googleSignIn,
                    shape: StadiumBorder(),
                    highlightColor: Theme.of(context).accentColor,
                    borderSide: BorderSide(
                        color: Theme.of(context).accentColor, width: 2),
                    child: Text(
                      'Google +',
                    ),
                  ),
                  isloading
                      ? CircularProgressIndicator()
                      : OutlineButton(
                          onPressed: () {
                            loginAnonymosly();
                          },
                          shape: StadiumBorder(),
                          highlightColor: Theme.of(context).accentColor,
                          borderSide: BorderSide(
                              color: Theme.of(context).accentColor, width: 2),
                          child: Text(
                            'Sign in as guest',
                          ),
                        ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}
