import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Add_Dishes{
  late String dish_name;
  late String donor_name;
  late String quantity;
  late String desc;
  late String price;
  
  Add_Dishes({
    
    required this.dish_name,
    required this.donor_name,
    required this.quantity,
    required this.desc,
    required this.price
  });
   
}