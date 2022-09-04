
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_wastage_management/providers/bottom_nav_index.dart';
import 'package:food_wastage_management/screens/donors/Tabs/Cart.dart';
import 'package:food_wastage_management/screens/donors/Tabs/Delivery.dart';
import 'package:food_wastage_management/screens/donors/Tabs/Donor_Home_Tab.dart';
import 'package:food_wastage_management/screens/donors/Tabs/Profile.dart';
import 'package:food_wastage_management/screens/recipients/Tabs/RecipientCartTab.dart';
import 'package:food_wastage_management/screens/recipients/Tabs/RecipientHomeTab.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
class RecipientHome extends StatefulWidget {
  const RecipientHome({Key? key}) : super(key: key);

  @override
  State<RecipientHome> createState() => _RecipientHomeState();
}

class _RecipientHomeState extends State<RecipientHome> {
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
  @override
  Widget build(BuildContext context) {
     
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Consumer<BottomNavigationIndex>(
      builder: (context, screen, child) {
        List<Widget> screens=[
          RecipientHomeTab(),
          DeliveryTab(),
          RecipientCartTab(context),
          ProfileTab(context,pickImage,_image)
        ];
        return
       Scaffold(
        body: Container(
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
                      //color: Colors.red,
                      child: screens.elementAt(screen.current_index),
                    ),
                  ),
              Positioned(
                top: height/1.1,
                left: 0,
                child: CustomBottomNavigationBar(height, width, screen),           
                )
            ],
          ),
        )
     
      );
      }
    );
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
            label: 'Cart',
            
            icon: Icon(Icons.food_bank,size: 30)
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


