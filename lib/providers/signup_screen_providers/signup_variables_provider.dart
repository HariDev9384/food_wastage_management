import 'package:flutter/material.dart';
class Signup_Variable_Provider with ChangeNotifier{
var Email;
var Password;
var ConfirmPassword;
var FullName;
var MobileNumber;
var DoB;
var UserName;
get eclr=>Email;
get pclr=>Password;
get cpclr=>ConfirmPassword;
get fnclr=>FullName;
get mnclr=>MobileNumber;
get dclr=>DoB;
get unclr=>UserName;
EmailClr(val){
  Email=val;
  notifyListeners();
}
PassClr(val){
  Password=val;
  notifyListeners();
}
ConfirmPassClr(val){
ConfirmPassword=val;
notifyListeners();
}
FullNameClr(val){
  FullName=val;
  notifyListeners();
}
MobileNumberClr(val){
  MobileNumber=val;
  notifyListeners();
}
DoBClr(val){
    DoB=val;
    notifyListeners();
}
UserNameClr(val){
UserName=val;
notifyListeners();;
}
@override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}