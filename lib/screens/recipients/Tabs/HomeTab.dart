import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

HomeTab(double height, double width,docid) {
    var currentdocid=docid;
    return FutureBuilder(
       future: FirebaseFirestore.instance.collection('users').doc(currentdocid).collection('donors').get(),
      builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
        if(snapshot.hasData){
      return
       ListView.builder(
                      itemCount: snapshot.data!.docs.length,
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
                                  height: height*0.14,
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
                                          Text('Dish Name: ${snapshot.data!.docs.elementAt(index)['Dish Name']}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold
                                          ),
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
                       
                        
                         return Center(
                          child: Text('Not Availble'),
                        );
                        
                      },
                    );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      
  }
    );
  }
