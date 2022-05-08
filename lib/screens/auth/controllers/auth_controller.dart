import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce/const.dart';
import 'package:flutter_ecommerce/screens/home/home.dart';

class AuthController {
  //FUNCTION TO UPLOAD IMAGE IN STORAGE
  Future<String> uploadImageToStorage(File? image) async {
    Reference ref = await FirebaseStorage.instance
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

//FUNCTION TO REGISTER USER
  Future<String> SignUpUser(String username, String email, String password,
      File? image, String phone) async {
    String res = 'some error occured';
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          phone.isNotEmpty &&
          image != null) {
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);

        String downloadUrl = await uploadImageToStorage(image);
        print(downloadUrl);
        await firebase.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'email': email,
          'phoneNumber': phone,
          'downloadUrl': downloadUrl,
        });
        res = 'success';
      } else {
        res = 'Please enter all fields';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //FUCTION TO LOGIN USER

  Future<String> LoginUser(
    String email,
    String password,
  ) async {
    String res = 'some error occured';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential cred = await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
        print(cred.user!.email);
      } else {
        res = 'fields must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> resetPassword(String email) async {
    String res = 'Some error occured';

    try {
      if (email.isNotEmpty) {
        await firebaseAuth.sendPasswordResetEmail(email: email);
        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}
