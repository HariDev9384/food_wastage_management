
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
Future<void>? get_det(String resname,){
CollectionReference users=FirebaseFirestore.instance.collection('User');
FirebaseAuth auth=FirebaseAuth.instance;
var uid=auth.currentUser!.uid;
users.add({'Restaurant Name':resname,'uid':uid});
return null;
}