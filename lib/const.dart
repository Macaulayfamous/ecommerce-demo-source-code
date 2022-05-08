import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

var backgroundColor = Colors.black;

//FIREBASE

var firebaseAuth = FirebaseAuth.instance;
var firebaseStore = FirebaseStorage.instance;
var firebase = FirebaseFirestore.instance;

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
