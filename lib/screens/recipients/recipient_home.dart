import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_wastage_management/Services/firestore/Add_Dishes_store.dart';
import 'package:food_wastage_management/models/adddishes.dart';
import 'package:food_wastage_management/providers/Text_Controllers/login_controllers.dart';
import 'package:food_wastage_management/providers/bottom_nav_index.dart';
import 'package:food_wastage_management/providers/current_user_doc_id.dart';
import 'package:food_wastage_management/screens/recipients/Tabs/ChatTab.dart';
import 'package:food_wastage_management/screens/recipients/Tabs/Notifications.dart';
import 'package:food_wastage_management/screens/recipients/Tabs/ProfileTab.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'Tabs/HomeTab.dart';
class RecipientHome extends StatefulWidget {
  @override
  State<RecipientHome> createState() => _RecipientHomeState();
}

class _RecipientHomeState extends State<RecipientHome> { 
  List<Add_Dishes> Dishes=[];
  bool availble=true;
      @override
      void initState() {
        super.initState();
        //GetDocID();
      }
  check_availble(val){
    setState(() {
      availble=val;
    });
  }
  File? _image;
Future pickImage() async {
  try{
     final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if(pickedFile==null)return;
    final imagetemp=File(pickedFile.path);
    setState(() {
      this._image = imagetemp;
    });
  }on PlatformException catch(e){
    print('Failed to pick image $e');
  }
  }
  
  
  void add_dishes(dish_name,donor_name,quantity,desc,price){
if(dish_name!=null&&donor_name!=null&&price!=null&&quantity!=null&&desc!=null){

    final dish=Add_Dishes(
      dish_name: dish_name, donor_name: donor_name, quantity: quantity, desc: desc, price: price);
    AddDishesFirestore().add_dishes_firestore(
      desc: desc,
      dish_name: dish_name,
      donor_name: donor_name,
      price: price,
      quantity: quantity,
      context: context
    );
      setState(() {
        if(dish_name!=null&&donor_name!=null&&price!=null&&quantity!=null&&desc!=null){

          Dishes.add(dish);
        }
        Navigator.of(context).pop();
      });
  }else{
    print('not added');
  }
  }
  

  @override
  Widget build(BuildContext context) {
      TextEditingController Donor_name_clr=TextEditingController();
      TextEditingController Dish_name_clr=TextEditingController();
      TextEditingController quantity_clr=TextEditingController();
      TextEditingController description_clr=TextEditingController();
      TextEditingController price_clr=TextEditingController();
      Color hovercolor=Colors.indigo;
    var height=MediaQuery.of(context).size.height;
    
    var width=MediaQuery.of(context).size.width;
    List<Widget> screens=[
      HomeTab(height, width),
      ChatTab(),
      NotificationTab(),
      ProfileTab(context,pickImage,_image)
    ];
    return 
       Consumer<BottomNavigationIndex>(
        builder: (context, screen, child) {
          
        return
          Scaffold(
          body:  
             Container(
              height: height/1,
              width: width/1,
              color: Colors.white,
              child: Stack(
                children: [
                 Positioned(
                    top: height*0.12,
                    width: width/1,
                    height: height*0.78,
                    child: Container(
                      height: height*0.78,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('Assets/BG.png')
                        )
                      ),
                      
                    ),
                  ),
               
                  (screen.current_index==0)?AddDishButton(height, width, context, Donor_name_clr, Dish_name_clr, quantity_clr, description_clr, price_clr,widget):Container(),
                  Positioned(
                    top: height*0.12,
                    width: width/1,
                    height: height*0.78,
                    child: Container(
                      height: height*0.78,
                      //color: Colors.red,
                      child: screens.elementAt(screen.current_index),
                    ),
                  ),
                  
                  
                  Positioned(
                    top: height/1.1,
                    left: 0,
                    child: CustomBottomNavigationBar(height,width,screen),
                  )
                ],
              ),
            ),
       
           );
        }
       );
    
  }

  Positioned AddDishButton(double height, double width, BuildContext context, TextEditingController Donor_name_clr, TextEditingController Dish_name_clr, TextEditingController quantity_clr, TextEditingController description_clr, TextEditingController price_clr,widget) {
    return Positioned(
                  top: height*0.07,
                  left: width*0.7,
                  height: height*0.04,
                  child: InkWell(
                    onTap: (){
                      var k=Provider.of<Login_Text_Controllers>(context,listen: false);
                     
                      Alert_Add_Dishes(context, height, width, Donor_name_clr, Dish_name_clr, quantity_clr, description_clr, price_clr,widget);
                    },
                    child: Container(
                      height: height*0.04,
                      width: width*0.25,
                    
                      decoration: BoxDecoration(
                        
                          boxShadow: [
                                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 60.0,
                      spreadRadius: -1.0,
                      offset: Offset(-15.0, -10.0), // shadow direction: bottom right
                                  )
                              ],
                              
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)
                          )
                        ),
                      child: Center(
                        child: Text('Add Dishes'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12
                      ),
                      ),
                      ),
                    ),
                  ),
                );
  }

  
  Future<dynamic> Alert_Add_Dishes(BuildContext context, double height, double width, TextEditingController Donor_name_clr, TextEditingController Dish_name_clr, TextEditingController quantity_clr, TextEditingController description_clr, TextEditingController price_clr,widget) {
    return showDialog(context: context,
                       builder: (context) {
                      
                        return AlertDialog(
                        content: SingleChildScrollView(
                          child: Container(
                            height: height*0.6,
                            width: width*0.02,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text('Donor Name'.toUpperCase()),
                                  ],
                                ),
                                TextField(
                                  controller: Donor_name_clr,
                                ),
                                SizedBox(height: height*0.025,),
                                Row(
                                  children: [
                                    Text('Dish Name'.toUpperCase()),
                                  ],
                                ),
                                TextField(
                                  controller: Dish_name_clr,//dishname controller
                                ),
                                SizedBox(height: height*0.025,),
                                Row(
                                  children: [
                                    Text('Quantitiy'.toUpperCase()),
                                  ],
                                ),
                                TextField(
                                  controller: quantity_clr,//quantity controller
                                ),
                                SizedBox(height: height*0.025,),
                                 Row(
                                  children: [
                                    Text('Descriiption'.toUpperCase()),
                                  ],
                                ),
                                TextField(
                                  controller: description_clr,
                                ),
                                SizedBox(height: height*0.025,),
                                 Row(
                                  children: [
                                    Text('Price'.toUpperCase()),
                                  ],
                                ),
                                TextField(
                                  controller: price_clr,
                                ),
                                SizedBox(height: height*0.025,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    
                                    RaisedButton(
                                      color: Colors.deepPurpleAccent,
                                      child: Text('Add Dish'.toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                      ),
                                      ),
                                      onPressed: (){
                                        if(Dish_name_clr.text.isNotEmpty||Donor_name_clr.text.isNotEmpty&&price_clr.text.isNotEmpty&&quantity_clr.text.isNotEmpty&&description_clr.text.isNotEmpty){
                        
                                      add_dishes(
                                      
                                        Dish_name_clr.text,
                                       Donor_name_clr.text,
                                        quantity_clr.text,
                                        description_clr.text,
                                        price_clr.text,
                                       
                                        
                                           
                                      );
                                       Dish_name_clr.clear();
                                       Donor_name_clr.clear();
                                        quantity_clr.clear();
                                        description_clr.clear();
                                        price_clr.clear();
                                        }else{
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('Field is Empty'),
                                            )
                                          );
                                        }
                                      print(Dishes.elementAt(0).donor_name);                                   
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ) ,
                       
                       );
});
  }
}

 CustomBottomNavigationBar (height,width,screen){
    return Container(
      height: height/11,
      width: width/1,
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        currentIndex: screen.current_index,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.white,
        unselectedItemColor: Colors.black54,
        onTap: (val){
          screen.Select_index(val);
          screen.notifyListeners();
        },

        items: [

          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(FontAwesomeIcons.home),
            ),

         BottomNavigationBarItem(
            label: 'Chat',
            icon: Icon(FontAwesomeIcons.message)
            ),
          BottomNavigationBarItem(
            label: 'Notifications',
            icon: Icon(Icons.notifications,size: 30,)
            ),
        

          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(FontAwesomeIcons.user)),
            


        ],
      ),
      //color: Colors.red,
      decoration: BoxDecoration(
        boxShadow: [
                BoxShadow(
    color: Colors.black,
    blurRadius: 60.0,
    spreadRadius: -1.0,
    offset: Offset(-15.0, -10.0), // shadow direction: bottom right
                )
            ],
            
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30)
        )
      ),
    
    );
  }


