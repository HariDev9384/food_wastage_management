
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_wastage_management/Services/Auth/Firebase_Auth_Service.dart';
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
            body: 
            Stack(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              alignment: Alignment.centerRight,
              children: [
              Container(
                height: height,
                width: width,
                color: Color(0xff5d74c7),
                
              ),
              
              // FlatButton(
              //   color: Colors.red,
              //   onPressed: (){
              //      },
              //   child: Text('username',
              //   style: TextStyle(
              //     fontSize: 16
              //   ),
              //   )
              // ),


              
              Positioned(child: Container(child: ForgroundWidget(
                value: value,
                context: context,
              )
              )
              )
              ]
              ),
          )
          )
             );
  }
}


