
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_wastage_management/models/firebase.dart';
import 'package:food_wastage_management/providers/Text_Controllers/login_controllers.dart';
import 'package:food_wastage_management/providers/current_user_doc_id.dart';
import 'package:food_wastage_management/providers/focus/textfieldfocus.dart';
import 'package:food_wastage_management/providers/login_screen_providers/login_icon_provider.dart';
import 'package:food_wastage_management/screens/recipients/recipient_home.dart';
import 'package:food_wastage_management/widgets/custom_suffix_icon.dart';
import 'package:food_wastage_management/widgets/loginwidgets/loginpassicon.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';
import '../custom icons/custom_social_icons_icons.dart';
import '../Services/Auth/Firebase_Auth_Service.dart';
import '../screens/login_screen.dart';
class ForgroundWidget extends StatefulWidget{
  ForgroundWidget({required var value,required context,var SubId});
  @override
  State<ForgroundWidget> createState() => _ForgroundWidgetState();
}

class _ForgroundWidgetState extends State<ForgroundWidget> {
  List<String> user_doc_list=[];
  getdlist(){
     var stream= FirebaseFirestore.instance.collection('users').get().then(
        (QuerySnapshot qs){
          qs.docs.forEach((element) {
            user_doc_list.add(element.id.toString());
          //print(element.id);
          });
        }
      );
     }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdlist();
  }
  @override
  Widget build(BuildContext context) {
  
  FocusNode focus=FocusNode();
  var height=MediaQuery.of(context).size.height;
  var width=MediaQuery.of(context).size.width;
 textfieldfocus _focus;
 bool signin=false;
 var current_doc_id;
 List documents=[];
 List<DB> ds;
 var docid;
 final firestore=FirebaseFirestore.instance;
  final usersref=FirebaseFirestore.instance.collection('users');
 final dlist=FirebaseFirestore.instance.collection('users').where('email',isEqualTo:'email').get().then((value) =>print(value.docs));
  final userssnapshot=usersref.snapshots().map((snapshot) => snapshot.docs
        .map((snapshot) => DB.fromJson(snapshot.data()))
        .toList());

   return Consumer<Login_Text_Controllers>(
    builder: (context, value, child) => 
     StreamBuilder(
      stream: firestore.collection('users').where('gmail',isEqualTo: value.email_clr).snapshots(),
      builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) { 
       
        if(snapshot.hasData){
          var doc= snapshot.data!.docs;
        checkgmail(){
                  
              if(doc.map((e) => e['role'])=='donor'){
                print(snapshot.data!.docs.map((e) => e['role']));
                Navigator.of(context).pushReplacementNamed('/donorhome');
              }
              else {
                  print(snapshot.data!.docs.map((e) => e['role']));
                  print(snapshot.data!.docs.map((e) => e.id));


                Navigator.of(context).pushReplacementNamed('/recipienthome');
                //RecipientHome(docsnapshot.id.toString());
              }
          
        }
        return  Consumer2<Login_Text_Controllers,login_visibleicon_provider>(
        builder:(context, value,passicon, child) => 
         SingleChildScrollView(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.values.last,
             children: [
               Column(
                 children: [
                   SizedBox(
                     height: 100,
                   ),
                   Row(
                     children: [
                       SizedBox(width: 15,),
                       InkWell(
                        onTap: (){
                          getdlist();
                        },
                         child: Text('Welcome',
                         style: TextStyle(
                           fontSize: 26,
                           color: Colors.white,
                           fontWeight: FontWeight.bold
                         ),
                         ),
                       ),
                     ],
                   ),
                   SizedBox(
                     height: 60,
                   ),
                   Column(
                     children: [
                       Row(
                         children: [
                           SizedBox(width: 15,),
                           Text('username',
                           style: TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.bold,
                             color: Colors.white
                           ),
                           ),
                         ],
                       ),
                       SizedBox(
                     height: 10,
                   ),
                     
                   ClipRRect(
                  
                     child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 6,
                        sigmaY: 6
                      ),
                       child: Container(
                        height: 50,
                        width: width/1.05,
                     decoration: BoxDecoration(
                       color: Colors.black12,
                       borderRadius: BorderRadius.all(Radius.circular(50))
                     ),
                        //color: Colors.black26,
   
                         child: TextField(
                            style: TextStyle(
                              color: Colors.white
                            ),
                            onSubmitted: (text)async{
                              value.emailclr(text);
                              print(value.email_clr);
                              value.notifyListeners();
                            },
                           decoration: InputDecoration(
                           border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(50))
                         ),
                         ),
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 25,
                   ),
                   Row(
                     children: [
                       SizedBox(width: 15,),
                       Text('Password',
                       style: TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                         color: Colors.white
                       ),
                       ),
                     ],
                   ),
                   Container(
                     height: 50,
                     decoration: BoxDecoration(
                       color: Colors.black12,
                       borderRadius: BorderRadius.all(Radius.circular(50))
                     ),
                     margin: EdgeInsets.all(10),
                     child: ClipRRect(
                       child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 7,
                          sigmaY: 7
                        ),
                         child: TextField(
                          
                          style: TextStyle(
                              color: Colors.white
                            ),
                            obscureText: passicon.active,
                            
                          onSubmitted: (text){
                              value.passclr(text);
                              print(value.pass_clr);
                              value.notifyListeners();
                            },
                          //controller: value.pass_clr,
                          decoration: InputDecoration(
                            suffixIcon: Customloginpassicon(context,passicon),
                             border: OutlineInputBorder(
                          
                             borderRadius: BorderRadius.circular(50))
                          ),
                         ),
                       ),
                     )
                   ),
                     ]),
                   SizedBox(height: 20,),
                   Row(
                     children: [
                       SizedBox(width: 20,),
                       ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                         child: BackdropFilter(
              
                          filter: ImageFilter.blur(
                            sigmaX: 7,
                            sigmaY: 7
                          ),
                           child: Container(
                             height: 50,
                             width: 50,
                             child: Icon(CustomSocialIcons.google,color: Colors.white),
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(50),
                               color: Colors.black12
                             ),
                             
                           ),
                         ),
                       ),
                       SizedBox(width: 20,),
                       ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                         child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 7,
                            sigmaY: 7
                          ),
                           child: InkWell(
                          
                            onTap: (){
                              
                            },
                             child: Container(
                               height: 50,
                               width: 50,
                               child: Icon(CustomSocialIcons.facebook,color: Colors.white),
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(30),
                                 color: Colors.black12
                               ),
                               //color: Colors.black12,
                             ),
                           ),
                         ),
                       )
                     ],
                   ),
                   // SizedBox(height: 120,),
                   
              
                 ],
               ),
               Column(
                 children: [
                   Container(
                 margin: EdgeInsets.only(left: 10,right: 10),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     InkWell(
                       child: Text('Sign In',
                       style: TextStyle(
                         fontSize: 24,
                         fontWeight: FontWeight.w500,
                         color: Colors.white
                       ),
                       ),
                       onTap: ()async{
                        
                        print(value.email_clr);
                        value.notifyListeners();
                     final message=await AuthService().login(
                       email: value.email_clr,
                       password: value.pass_clr
                       );
                       if (message!.contains('Success')) {
                        signin=true;
                        checkgmail();
                   ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(
                       content: Text(message),
                     ),
                   );
                       }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(
                       content: Text(message),
                     ),
                   );
                       }
                   },
                     ),
                 
                   Container(
                     height: 60,
                     width: 60, 
                     child: Icon(Icons.arrow_forward_outlined,
                     size: 38,
                     color: Colors.white,
                     ),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(50),
                       gradient: LinearGradient(
                         begin: Alignment.topLeft,
                         end: Alignment.bottomRight,
                         colors: [
                           Colors.deepPurple,
                           Color.fromARGB(255, 36, 6, 186)
                         ]
                       )
                     ),
                   )
                   ],
                 ),
               ),
               SizedBox(height: 80,),
               Container(
                 margin: EdgeInsets.only(left: 10,right: 10),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: 
                     [
                     InkWell(
                       child: Text('Signup',
                       style: TextStyle(
                         fontSize: 16,
                         color: Colors.white,
                         fontWeight: FontWeight.w400
                       ),
                       ),
                       onTap: ()=>Navigator.pushReplacementNamed(context, '/signup'),
                     ),
                     InkWell(
                       child: Text('Forget Password?',
                       style: TextStyle(
                         fontSize: 16,
                         color: Colors.white,
                         fontWeight: FontWeight.w400
                       ),
                       ),
                     )
                   ],
                 ),
               ),
                 ],
               )
             ],
           ),
         ),
       );
        }else if(snapshot.hasError){
          print('Data Fetch Exception : ${snapshot.error}');
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }
     ),
   );
}
}