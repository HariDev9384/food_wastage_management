
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_wastage_management/Services/Auth/Firebase_Auth_Service.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';
import 'package:food_wastage_management/providers/login_screen_providers/login_icon_provider.dart';
import '../widgets/Forground_Widget.dart';
import 'Home_screen.dart';
class Login_Screen extends StatefulWidget {
  Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;  
    return
          Consumer<login_visibleicon_provider>(
          builder: ((context, value, child) => Scaffold(
            resizeToAvoidBottomInset: false,
            body: 
            GestureDetector(

              child: Stack(

                children: [
                   Positioned(
                //bottom: 10,
                
                   child: Container(
                    height: height/1,
                    width: width/1,
                
              
                    //color: Colors.red,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 99, 23, 180),
                      image: DecorationImage(
                               
                        colorFilter: ColorFilter.srgbToLinearGamma(
                          
                        ),
                        //colorFilter: ColorFilter.,
                        fit: BoxFit.contain,
                        image: AssetImage(
                          'Assets/BG.png',
                          
                          )
                      )
                    ),
                               ),
                   ),
                   Positioned(child: Container(
                      
                width: MediaQuery.of(context).size.width/1,
                height: height*1.3,
                
                child: ForgroundWidget(
                value: value,
                context: context,
                ),
                )
                ),
                 ],
              ),
            ),
          )
          )
             );
  }
}


