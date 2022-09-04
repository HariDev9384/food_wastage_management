import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_wastage_management/providers/DishListProvider.dart';
import 'package:food_wastage_management/providers/Text_Controllers/login_controllers.dart';
import 'package:provider/provider.dart';
RecipientCartTab(context){
  var loginProvider=Provider.of<Login_Text_Controllers>(context,listen:false);
  return Container(
    height: 200,
    width: 200,
    color: Colors.transparent,
    child: StreamBuilder(
      stream: FirebaseFirestore.instance.collection('users').doc(loginProvider.email_clr.toString()).collection('cartlist').snapshots(),
      builder:(context,AsyncSnapshot<QuerySnapshot> snapshot) => (snapshot.hasData)? ListView.separated(
        separatorBuilder: (context, index) {
         return SizedBox.shrink();
        }
        ,
        itemCount: snapshot.data!.docs.length,
        itemBuilder: (context, index) {
          
          return Center(child: Text(
            
            snapshot.data!.docs.elementAt(index)['DishName']
            ));
          
        }
      ):SizedBox.shrink(),
    ),
  );
}