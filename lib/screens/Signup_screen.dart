import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_wastage_management/Services/Auth/response.dart';
import 'package:food_wastage_management/Services/firestore/add_info.dart';
import 'package:food_wastage_management/providers/signup_screen_providers/passwordiconprov.dart';
import 'package:food_wastage_management/providers/signup_screen_providers/signup_variables_provider.dart';
import 'package:food_wastage_management/providers/signup_screen_providers/user_types.dart';
import 'package:food_wastage_management/screens/login_screen.dart';
import '../providers/login_screen_providers/login_icon_provider.dart';
import '../providers/signup_screen_providers/confirmpasswordiconprov.dart';
import 'package:food_wastage_management/Services/firestore_data/signup_details.dart';
import 'package:food_wastage_management/screens/Home_screen.dart';
import 'package:provider/provider.dart';

import '../Services/Auth/Firebase_Auth_Service.dart';
class Signup_Screen extends StatelessWidget {
  const Signup_Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
  
    var height=MediaQuery.of(context).size.height;
   
    return 
      Consumer2<Signup_Variable_Provider,UserTypes>(
        builder: ((context, variables,users, child) => 
         Scaffold(
          appBar: AppBar(
            title: Text('Signup'),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Color(0xff5d74c7),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: ()=>Navigator.of(context).pushReplacementNamed('/login'),
              ),
          ),
          body: Consumer<UserTypes>(
            builder: (context, usertypes, child) => 
             SingleChildScrollView(
              child: Container(
                height: height*0.88,
                //color: Colors.white24,
                color: Color(0xff5d74c7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: height*0.76,
                      //color: Colors.lightGreen,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: (){
                                 
                                  // usertypes.SelectRecipient();
                                  // usertypes.notifyListeners();
                                  if(usertypes.recipient==false){
                                  usertypes.SelectRecipient();
                                  usertypes.notifyListeners();
                                  print(usertypes.recipient);
                                  }
                                },
                                child: Container(
                                  height: 100,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: (usertypes.recipient)?Colors.red:Colors.white,

                                  ),
                                  child: Center(
                                    child: Text('Recipient'),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  if(usertypes.donor==false){
                                  usertypes.SelectDonor();
                                  usertypes.notifyListeners();
                                  }
                                },
                                child: Container(
                                  height: 100,
                                  width: 150,
                                  child: Center(
                                    child: Text('Donor'),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: (usertypes.donor)?Colors.red:Colors.white,

                                  ),
                                ),
                              ) 
                            ],
                          ),
                          Container(
                            height: 50,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(40)
                            ),
                            child: TextField(
                              style: TextStyle(
                                color: Colors.white
                              ),
                              onSubmitted: (val){
                                variables.FullNameClr(val);
                                variables.notifyListeners();
                              },
                              
                              decoration: InputDecoration(
                                labelText: 'Full Name',
                                
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(40))
                            ),
                            ),
                          ),
                          Container(
                            height: 50,
                            margin: EdgeInsets.all(10),decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(40)
                            ),
                
                            child: TextField(
                              style: TextStyle(
                                color: Colors.white
                              ),
                              onSubmitted: (var val){
                                variables.UserNameClr(val);
                                variables.notifyListeners();
                              },
                              decoration: InputDecoration(
                                labelText: 'User Name',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(40))
                            ),
                            ),
                          ),
                          Container(
                            height: 50,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(40)
                            ),
                            child: TextField(
                              style: TextStyle(
                                color: Colors.white
                              ),
                              onSubmitted: (var val){
                                variables.MobileNumberClr(val);
                                variables.notifyListeners();
                                
                              },
                              decoration: InputDecoration(
                                prefixText: '+91',
                                labelText: 'Mobile Number',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(40))
                            ),
                            ),
                          ),
                          
                          Container(
                            height: 50,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(40)
                            ),
                            child: TextField(
                              style: TextStyle(
                                color: Colors.white
                              ),
                              onSubmitted: (val){
                                variables.EmailClr(val);
                                variables.notifyListeners();
                              },                            
                              decoration: InputDecoration(
                                labelText: 'Email',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(40))
                            ),
                            ),
                          ),
                          Container(
                            height: 50,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(40)
                            ),
                            child: TextField(
                              style: TextStyle(
                                color: Colors.white
                              ),
                              onSubmitted: (val){
                              variables.DoBClr(val);
                              variables.notifyListeners();
                              },
                              decoration: InputDecoration(
                                labelText: 'Date of Birth',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(40))
                            ),
                            ),
                          ),
                          Consumer<passiconprovider>(
                            builder:(context, value, child) =>  Container(
                              height: 50,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(40)
                            ),
                              child: TextField(
                                style: TextStyle(
                                color: Colors.white
                              ),
                                obscureText: value.Active,
                                onSubmitted: (val){
                                  variables.PassClr(val);
                                  variables.notifyListeners();
                                },
                                decoration: InputDecoration(
                                  labelText: 'password',
                                  suffixIcon: custompasssuffixicon(context, value),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(40))
                              ),
                              ),
                            ),
                          ),
                          Consumer<confirmpassiconprovider>(
                            builder:(context, value, child) =>  Container(
                              height: 50,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(40)
                            ),
                              child: TextField(
                                style: TextStyle(
                                color: Colors.white
                              ),
                                obscureText: value.confirmActive,
                                onSubmitted: (val){
                                  variables.ConfirmPassClr(val);
                                  variables.notifyListeners();
                                },
                                decoration: InputDecoration(
                                  labelText: 'confirm password',
                                  suffixIcon: customconfirmpasssuffixicon(context,value),
                                border: OutlineInputBorder(borderRadius:BorderRadius.circular(40))
                              ),
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                    Container(
                          
                          child: RaisedButton(
                            child: Text('Signup',
                            
                            style: TextStyle(
                              color: Colors.white
                            ),
                            ),
                            color: Colors.transparent,
                            onPressed: () async {
                              
                              Info(
                                Full_name: variables.FullName,
                                dob: variables.DoB,
                                email: variables.Email,
                                user_pass: variables.Password,
                                mobile_no:variables.MobileNumber,
                                username: variables.UserName,
                                role: usertypes.donor?'donor':'recipient'
                              ).add_data();
                            
                              // }else if(usertypes.recipient){
                              // Info(
                              //   Full_name: variables.FullName,
                              //   dob: variables.DoB,
                              //   email: variables.Email,
                              //   user_pass: variables.Password,
                              //   mobile_no:variables.MobileNumber,
                              //   username: variables.UserName,
                              //   role: 'recipient'
                              // ).add_recipient_data();
                              // }
                              final message = await AuthService().registration(
                                email: variables.Email,
                                password: variables.Password,
                                confirm_password: variables.ConfirmPassword
                      
                              );
                              //Add_Info(rest_name: _restaurantcontroller.text);
                              //savedet(_restaurantcontroller.text);
                              if (message!.contains('Success')) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) =>  Login_Screen()));
                              }
                              //get_det(_restaurantcontroller.text);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(message),
                                ),
                              );
                            },
                          ),
                        ),
                    
                  ],
                ),
              ),
            ),
          ),
        )
      )
      );
  }
}
Widget custompasssuffixicon(BuildContext context,var value){
  return IconButton(
    onPressed: (){
      
      if(value.Active){
        value.passdisable();
        value.notifyListeners();

      }else{
        value.passenable();
        value.notifyListeners();
      }
      value.notifyListeners();
  },
  icon: value.passeye);
}
Widget customconfirmpasssuffixicon(BuildContext context,var value){
  return IconButton(
    onPressed: (){
      
      if(value.confirmActive){
        value.confirmpassdisable();
        value.notifyListeners();
      }else {
        value.confirmpassenable();
        value.notifyListeners();
      }
      value.notifyListeners();
  },
  icon: value.confirmpasseye,
);
}