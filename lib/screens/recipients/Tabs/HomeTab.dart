import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_wastage_management/Services/firestore/Add_Dishes_store.dart';
import 'package:food_wastage_management/models/adddishes.dart';
import 'package:food_wastage_management/providers/Text_Controllers/login_controllers.dart';
import 'package:food_wastage_management/providers/checkdish.dart';
import 'package:food_wastage_management/providers/docid.dart';
import 'package:provider/provider.dart';

HomeTab(double height, double width) {
  var checkavailable=true;
  
    return Consumer2<Login_Text_Controllers,checkdish>(

    builder: (context, value,dish ,child) {
      var currentlogin=Provider.of<Login_Text_Controllers>(context,listen: false);
    return 
        StreamBuilder(
             stream: FirebaseFirestore.instance.collection('users').doc(currentlogin.email_clr).collection('donors').snapshots(),
            builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
             
              if(snapshot.hasData && snapshot.data!.docs.isNotEmpty){
                
            return
             ListView.builder(
                            itemCount: snapshot.data!.docChanges.length,
                            itemBuilder: (context, index) {
                           
                              
                              return Column(
                                children: [
                                  ClipRRect(
                                    
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 2,
                                        sigmaY: 2
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        height: height*0.16,
                                        width: width*0.9,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.black12
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('Donor Name: ${snapshot.data!.docs.elementAt(index)['Donor Name']}'.toUpperCase(),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                                ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text('Dish Name: ${snapshot.data!.docs.elementAt(index)['Dish Name']}',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold
                                                    ),
                                                    ),
                                                    IconButton(
                                                      icon: Icon(Icons.delete),
                                                      onPressed: ()=>AddDishesFirestore().Dish_Delete(context: context,index: index),
                                                    )
                                                  ],
                                                ),
                                                
                                                    
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              
                                              children: [
                                                Text('Description',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                                ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text('Availble',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold
                                                    ),
                                                    ),
                                                    Checkbox(
                                                      value: snapshot.data!.docs.elementAt(index)['Availble'],
                                                       onChanged: (value){
                                                        dish.check(value);
                                                        AddDishesFirestore().update(context: context,index: index);
                                                        dish.notifyListeners();

                                                       }
                                                       )
                                                    
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height*0.02,)
                                ],
                              ); 
                          }
                                            
          
                          );
              
             }else {
              return Center(child: Text('no data'),);
             }

             
            
          }

          );
    }
    );
  }
