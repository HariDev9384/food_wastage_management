import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_wastage_management/Services/Auth/response.dart';
import 'package:food_wastage_management/Services/firestore/add_info.dart';
import 'package:food_wastage_management/providers/signup_screen_providers/passwordiconprov.dart';
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
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmpasswordController = TextEditingController();
     TextEditingController? _restaurantcontroller=TextEditingController();
    var _mobilenumber;
    var _doj;
    var _username;
    return 
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
        body: Container(
          height: height,
          color: Color(0xff5d74c7),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height*0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(40)
                        ),
                        child: TextField(
                          //onEditingComplete: Info(),
                          controller: _restaurantcontroller,
                          
                          decoration: InputDecoration(
                            labelText: 'Restaurant Name',
                            
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
                          onSubmitted: (var val){
                            _username=val;
                            ValueNotifier(_username);
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
                          onSubmitted: (var val){
                            _mobilenumber=val;
                            ValueNotifier(_mobilenumber);
                            
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
                          controller: _emailController,
                          
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
                          onEditingComplete: (){
                            _doj=DateTime.now();
                            ValueNotifier(_doj);
                            print(_doj);
                          },
                          decoration: InputDecoration(
                            labelText: 'DOB',
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
                            controller: _passwordController,
                            obscureText: value.Active,
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
                            controller: _confirmpasswordController,
                            obscureText: value.confirmActive,
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
                        rest_name: _restaurantcontroller.text,
                        doj: _doj,
                        email: _emailController.text,
                        user_pass: _passwordController.text,
                        mobile_no: _mobilenumber,
                        username: _username
                      ).add_res_data();
                      final message = await AuthService().registration(
                        email: _emailController.text,
                        password: _passwordController.text,
                        confirm_password: _confirmpasswordController.text
              
                      );
                      //Add_Info(rest_name: _restaurantcontroller.text);
                      //savedet(_restaurantcontroller.text);
                      if (message!.contains('Success')) {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) =>  Home_Screen()));
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