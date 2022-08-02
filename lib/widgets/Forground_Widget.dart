import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_wastage_management/models/firebase.dart';
import 'package:food_wastage_management/providers/Text_Controllers/login_controllers.dart';
import 'package:food_wastage_management/providers/focus/textfieldfocus.dart';
import 'package:food_wastage_management/providers/login_screen_providers/login_icon_provider.dart';
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
  
  @override
  Widget build(BuildContext context) {
    
  
  FocusNode focus=FocusNode();
  var height=MediaQuery.of(context).size.height;
  var width=MediaQuery.of(context).size.width;
 textfieldfocus _focus;
 bool signin=false;
 List documents=[];
// void check_gmail(i,email){
//   if(documents![i]['gmail']==email){
//     checkdocid = documents![i].id;
//     if(signin==true){
//     if(documents![i]['role']=='donor'){
    
//       Navigator.of(context).pushReplacementNamed('/donorhome');
    
//       }else if(documents![i]['role']=='recipient'){
//         Navigator.of(context).pushReplacementNamed('/recipienthome');
//                       }
//     }
//   }
//   print(checkdocid);
// }
// verify(var email){
//   for(int i=0;i<documents!.length;i++){
//     check_gmail(i,email);
//   }
// }

   return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('users').snapshots(),
    builder: (context,AsyncSnapshot snapshot) { 
     List<DocumentSnapshot>  docslist=snapshot.data!.docs;
      checkgmail(gmail,docsnapshot){
        
        if(docsnapshot['gmail']==gmail){
            if(docsnapshot['role']=='donor'){
              Navigator.of(context).pushReplacementNamed('/donorhome');
            }
            else{
              Navigator.of(context).pushReplacementNamed('/recipienthome');
            }
        }
      }
      validate(var gmail){
        for(int i=0;i<docslist.length;i++){
        DocumentSnapshot  docsnapshot=snapshot.data!.docs[i];
        //print(docsnapshot.id);
        documents.add(docsnapshot.data());
        //print(docsnapshot['gmail']);
        checkgmail(gmail,docsnapshot);
        
        
        //print(docsnapshot[i]);
        //print(docsnapshot.data());
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
                                //validate();
                               //adddoc(docsnapshot);
                            //  print(
                            //   snapshot.data!.docs.map((e) => e.data())
                            //  );
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
                           //color: Colors.black12,
                         ),
                       ),
                     ),
                     SizedBox(width: 20,),
               
                     ClipRRect(
                       child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 7,
                          sigmaY: 7
                        ),
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
                      validate(value.email_clr);
                      //verify(value.email_clr);
                //       if(docs['role']=='donor'){
                //    Navigator.of(context).pushReplacementNamed('/donorhome');
                //       }else{
                //    Navigator.of(context).pushReplacementNamed('/recipienthome');
          
                      
                //  }
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
             // RaisedButton(
             //   color: Colors.transparent,
             //   child: Text('Login'),
             //   onPressed: ()async{
             //     final message=await AuthService().login(
             //       email: _emailController.text,
             //       password: _passwordController.text
             //       );
             //       if (message!.contains('Success')) {
             //     Navigator.of(context).pushReplacementNamed('/home');
             //   }
             //   ScaffoldMessenger.of(context).showSnackBar(
             //     SnackBar(
             //       content: Text(message),
             //     ),
             //   );
             //   },
             // ),
             // Divider(
             //   height: 10,
             //   indent: 150,
             //   endIndent: 150,
             //   color: Colors.black,
             // ),
             SizedBox(height: 80,),
             Container(
               margin: EdgeInsets.only(left: 10,right: 10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: 
                   [
                   //SizedBox(width: 10,),
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
    }
   );
}
}