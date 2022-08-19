import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_wastage_management/providers/Text_Controllers/login_controllers.dart';
import 'package:provider/provider.dart';
ProfileTab(context,pickimage,profile_image)  {
  var width=MediaQuery.of(context).size.width;
  var height=MediaQuery.of(context).size.height;
  return Consumer<Login_Text_Controllers>(
    builder: (context, value, child) {
      var currentlogin=Provider.of<Login_Text_Controllers>(context,listen:false);
      return
     StreamBuilder(
      stream: FirebaseFirestore.instance.collection('users').doc(currentlogin.email_clr).snapshots(),
      builder: (context,AsyncSnapshot snapshot){
        if(snapshot.hasData){
        return
       Stack(
        children: [
          Positioned(
    
            left: 20,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 2,
                  sigmaY: 2
                ),
    
                child: InkWell(
                  onTap: ()async{
                   await pickimage();
                  },
                  child: CircleAvatar(
                  
                    foregroundImage: (profile_image!=null)?Image.file(profile_image).image:Image.asset('Assets/BG.png').image,
                    radius: height*0.08,
                    backgroundColor: Colors.black12,
                  ),
                ),
              ),
            )
          ),
          Positioned(
            top: 40,
            right: 20,
            child: Text(snapshot.data['gmail'].toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
            ),
          ),
          Positioned(
            top: 75,
            right: 20,
            child: Text(snapshot.data['User Name'],
            style: TextStyle(
              fontSize:   15,
              //fontWeight: FontWeight.bold
            ),
            ),
          ),
          Positioned(
            top: height*0.2,
            right: 0,
            child: Container(
              height: height*0.6,
              width: width/1,
              color: Colors.transparent,
                  
              child: Column(
                children: [
                  ClipRRect(
                    child: Container(
                      height: height*0.06,
                      color: Colors.black12,
                      child: Padding(
                        padding:  EdgeInsets.only(left: width*0.1,),
                        child: Row(
                          
                          children: [
                            Icon(FontAwesomeIcons.user),
                            SizedBox(width: width*0.05,),
                            Text('Profile',
                            style: TextStyle(
                              fontSize: 18
                            ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(color: Colors.transparent),
                  Container(
                    height: height*0.06,
                    color: Colors.black12,
                    child: Padding(
                      padding:  EdgeInsets.only(left: width*0.1,),
                      child: Row(
                        
                        children: [
                          Icon(FontAwesomeIcons.star),
                          SizedBox(width: width*0.05,),
                          Text('Ratings',
                          style: TextStyle(
                            fontSize: 18
                          ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(color: Colors.transparent),
                  Container(
                    height: height*0.06,
                    color: Colors.black12,
                    child: Padding(
                      padding:  EdgeInsets.only(left: width*0.1,),
                      child: Row(
                        
                        children: [
                          Icon(Icons.settings_accessibility),
                          SizedBox(width: width*0.05,),
                          Text('Settings',
                          style: TextStyle(
                            fontSize: 18
                          ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(color: Colors.transparent),
                  Container(
                    height: height*0.06,
                    color: Colors.black12,
                    child: Padding(
                      padding:  EdgeInsets.only(left: width*0.1,),
                      child: Row(
                        
                        children: [
                          Icon(Icons.feedback),
                          SizedBox(width: width*0.05,),
                          Text('Feedbacks',
                          style: TextStyle(
                            fontSize: 18
                          ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(color: Colors.transparent),
                  Container(
                    height: height*0.06,
                    color: Colors.black12,
                    child: Padding(
                      padding:  EdgeInsets.only(left: width*0.1,),
                      child: Row(
                        
                        children: [
                          Icon(Icons.info),
                          SizedBox(width: width*0.05,),
                          Text('About',
                          style: TextStyle(
                            fontSize: 18
                          ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(color: Colors.transparent),
                  Container(
                    height: height*0.06,
                    color: Colors.black12,
                    child: Padding(
                      padding:  EdgeInsets.only(left: width*0.1,),
                      child: Row(
                        
                        children: [
                          Icon(FontAwesomeIcons.contactCard),
                          SizedBox(width: width*0.05,),
                          Text('Contact Us',
                          style: TextStyle(
                            fontSize: 18
                          ),
                          )
                        ],
                      ),
                    ),
                  ),
                   Divider(color: Colors.transparent),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                    child: Container(
                      height: height*0.06,
                      color: Colors.black12,
                      child: Padding(
                        padding:  EdgeInsets.only(left: width*0.1,),
                        child: Row(
                          
                          children: [
                            Icon(Icons.logout),
                            SizedBox(width: width*0.05,),
                            Text('Logout',
                            style: TextStyle(
                              fontSize: 18
                            ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  
                ],
              ),
            )
          )
    
        ],
      );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }

    );
    }
  );
}