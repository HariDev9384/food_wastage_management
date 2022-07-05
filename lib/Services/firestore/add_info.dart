import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
class Info{
  var rest_name,user_pass,doj,username,email;
  dynamic mobile_no;
  Info({
    required  this.rest_name,
    required this.mobile_no,
    required this.user_pass,
    required this.doj,
    required this.email,
    required this.username});
   final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  void add_res_data(){
      _firestore.collection("users").add({
     'restaurant name':rest_name,
     'Mobile Number':mobile_no,
     'User Password':user_pass,
     'User Name':username,
     'Date of Joining':doj
      }).then((value) => print(value.id));
    }
}