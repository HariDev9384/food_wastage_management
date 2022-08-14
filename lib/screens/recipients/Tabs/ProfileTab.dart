import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
ProfileTab(context,pickimage,profile_image){
  var width=MediaQuery.of(context).size.width;
  var height=MediaQuery.of(context).size.height;
  return Stack(
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
        child: Text('Full Name',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold
        ),
        ),
      ),
      Positioned(
        top: 75,
        right: 20,
        child: Text('User Name',
        style: TextStyle(
          fontSize:   18,
          //fontWeight: FontWeight.bold
        ),
        ),
      ),
      Positioned(
        top: height*0.3,
        right: 0,
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 6,
              sigmaY: 6
            ),
            child: Container(
              height: height*0.465,
              width: width/1,
              color: Colors.transparent,
                  
              child: Column(
                children: [
                  Container(
                    height: height*0.06,
                    color: Colors.black12,
                  ),
                  Divider(),
                  Container(
                    height: height*0.06,
                    color: Colors.black12,
                  ),
                  Divider(),
                  Container(
                    height: height*0.06,
                    color: Colors.black12,
                  ),
                  Divider(),
                  Container(
                    height: height*0.06,
                    color: Colors.black12,
                  ),
                  Divider(),
                  Container(
                    height: height*0.06,
                    color: Colors.black12,
                  ),
                  Divider(),
                  Container(
                    height: height*0.06,
                    color: Colors.black12,
                  ),
                  
                  
                ],
              ),
            ),
          ),
        )
      )

    ],
  );
}