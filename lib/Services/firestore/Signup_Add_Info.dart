
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
class Info{
  var Full_name,user_pass,dob,username,email,role;
  dynamic mobile_no;
  Info({
    required  this.Full_name,
    required this.mobile_no,
    required this.user_pass,
    required this.dob,
    required this.role,
    required this.email,


    required this.username});
   final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  //  final d=_firestore.collection('users').get().then(
  //   (QuerySnapshot snapshot){
      // snapshot.docs.map((doc) => doc.id);
  //   }
  //  );

  void add_data(){
      _firestore.collection("users").add({
            'Full name':Full_name,
            'Mobile Number':mobile_no,
            'User Password':user_pass,
            'User Name':username,
            'Date of Birth':dob,
            'gmail':email,
            'role':role,

      });
  }

}