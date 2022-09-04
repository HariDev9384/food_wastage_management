import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_wastage_management/Services/firestore_data/signup_details.dart';
import 'package:food_wastage_management/models/current_user.dart';
import 'package:food_wastage_management/providers/DishListProvider.dart';
import 'package:food_wastage_management/screens/recipients/Tabs/product_details.dart';
class RecipientHomeTab extends StatefulWidget {
  const RecipientHomeTab ({Key? key}) : super(key: key);

  @override
  State<RecipientHomeTab> createState() => _RecipientHomeTabState();
}

class _RecipientHomeTabState extends State<RecipientHomeTab> {
  List DishList=[];
  AddCartList(index,val)async{
    bool isAdded=false;
    QuerySnapshot donorsnapshot=await FirebaseFirestore.instance.collection('users').doc(val).collection('donors').get();
    print('current doc id ${val}');
    print('CartList ${
      donorsnapshot.docs.length
    }');
    
    if(isAdded==false){
      setState(() {
        isAdded=true;

      });
      DishList.addAll(donorsnapshot.docs);
      print(DishList.elementAt(index)['D']);
    }else{
      print('items already added');
    }

  }
   bool like=true;
   List DonorList=[];
   likeEvent(){
    setState(() {
      if(like==true){
        like=false;
      }else{
        like=true;
      }
    });
   }
   
   addlist()async{

    Query query=FirebaseFirestore.instance.collection('users');
    QuerySnapshot qs=await query.get();
    int i=0;
        Query q2=FirebaseFirestore.instance.collection('users').doc(qs.docs.elementAt(i++).id).collection('donors');
    QuerySnapshot q22=await q2.get();

    print(q22.docs.map((e) => e.data()));
    qs.docs.map((e) {
      print(e.data());
      print(e['role']);
      if(e['role']=='donor'){
       DonorList.add( e.data());
      }else{
        print('not added');
      }
    });
    print(DonorList);
  }
  var length;
  GetDocsLength(val)async{
   QuerySnapshot snapshot=await FirebaseFirestore.instance.collection('users').doc(val).collection('donors').get();
  length=snapshot.docs.length;
  print("Home ${length}");
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addlist();
  }
  @override
  Widget build(BuildContext context) {
    bool like=false;
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var firestore=FirebaseFirestore.instance;
     Current_User? current_user;
    var dbcoll=firestore.collection('users').snapshots();
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').where('role',isEqualTo: 'donor').snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
          List j=[];
          if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,  
            itemBuilder: (context, index) {
              //var provider=DishListProvider.of(context);
              return Column(
                children: [
                  InkWell(
                  
                    onTap: (){
                      
                       
                     // GetDocsLength(snapshot.data!.docs.elementAt(index).id.toString());
                      
                      // int i=0;
                      // if(snapshot.data!.docs.isEmpty){
                      //   print('is empty');
                      // }
                       
                      //   for(int i=0;i<length;i++){
                         
                      //      provider.AddDishes(snapshot.data!.docs.elementAt(index));
                         
        
                        
                      //   }
                      
                      // // for(int i=0;i<length;i++){
                      // //   if(i!=length){
                      // //     provider.AddDishes();
                      // //   }else if(i==length){
                      // //     print('d');
                      // //   }
                      
                      // // }
                      // print(provider.dishes);
                      
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDetails(snapshot.data!.docs.elementAt(index),DishList,)));
                      AddCartList(index, snapshot.data!.docs.elementAt(index).id);

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: height*0.24,
                          width: width*0.45,
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.star,size: 18,color: Colors.white,),
                                  SizedBox(width: width*0.02,),
                                  Text('4.3',style: TextStyle(fontSize: 18,color: Colors.white),)    
                                ],
                              ),
                              Row(
                                children: [
                                  InkWell(child:Icon(FontAwesomeIcons.solidHeart, color:Colors.red),
                                  onTap: (){
                                    likeEvent();
                                  },
                                  )
                                ],
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('Assets/briyani.png')
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.indigo.withOpacity(0.4),
                                Colors.black38.withOpacity(0.6)
                              ]
                            ),
                            //color: Colors.black12,
                            borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                        Container(
                          height: height*0.24,
                          width: width*0.45,
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('${snapshot.data!.docs.elementAt(index)['Full name']}',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                  ),
                                  ),
                                  
                                ],
                              ),
                              SizedBox(height: height*0.01,),
                              Row(
                                children: [
                                  Icon(FontAwesomeIcons.star,size: 16,),
                                  SizedBox(width: width*0.02,),
                                  Text('4.6 (${index+256})',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  ),
                                  ),
                                  
                                  
                                ],
                              ),
                              SizedBox(height: height*0.01,),
                              Row(
                                children: [
                                  
                                  Text('Delivery Free',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  ),
                                  ),
                                  
                                  
                                ],
                              ),
                              Row(
                                children: [
                                  
                                  Expanded(
                                    child: Text('Saravanampatti,Coimbatore',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),
                                    ),
                                  ),
                                  
                                  
                                ],
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                  SizedBox(height: height*0.02,)
                ],
              );
            },
          );
          }else if(snapshot.hasError){
            return Center(child: Text('Currently not available'),);
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }
}