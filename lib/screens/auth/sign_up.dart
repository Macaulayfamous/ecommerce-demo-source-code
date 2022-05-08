import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:flutter_ecommerce/const.dart';
import 'package:flutter_ecommerce/screens/auth/controllers/auth_controller.dart';
import 'package:flutter_ecommerce/screens/auth/login.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  static const routeName = '\SignUp';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isLoading = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  File? _pickedImage;
  String? url;

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthController().SignUpUser(
        _usernameController.text,
        _emailController.text,
        _passwordController.text,
        _pickedImage,
        _phoneNumberController.text);
    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      showSnackBar('Congratulations Acccount has been created', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    void _pickImageWithCamara() async {
      final picker = ImagePicker();
      final pickedImage = await picker.getImage(source: ImageSource.camera);
      final pickedImageFile = File(pickedImage!.path);
      setState(() {
        _pickedImage = pickedImageFile;
      });
    }

    void _pickImageWithGallary() async {
      final picker = ImagePicker();
      final pickedImage = await picker.getImage(source: ImageSource.gallery);
      final pickedImageFile = File(pickedImage!.path);
      setState(() {
        _pickedImage = pickedImageFile;
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    _pickedImage != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundImage: FileImage(_pickedImage!),
                            backgroundColor: Colors.blue,
                          )
                        : CircleAvatar(
                            radius: 64,
                            backgroundImage: NetworkImage(
                                'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
                          ),
                    Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                            icon: Icon(Icons.add_a_photo),
                            onPressed: _pickImageWithGallary))
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: _usernameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter your Username',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
                    filled: true,
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
                    filled: true,
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter your phone number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
                    filled: true,
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.all(8),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: backgroundColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // TextField(
                //   keyboardType: TextInputType.emailAddress,
                //   decoration: InputDecoration(
                //     hintText: 'Enter your bio',
                //     border: OutlineInputBorder(
                //       borderSide: BorderSide.none,
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //         borderSide: BorderSide(
                //       color: Colors.black,
                //     )),
                //     filled: true,
                //     contentPadding: EdgeInsets.all(8),
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 50,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      color: Colors.black),
                  child: Center(
                    child: InkWell(
                      onTap: signUpUser,
                      child: _isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                  color: Colors.white),
                            )
                          : Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an Account?'),
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 4),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
