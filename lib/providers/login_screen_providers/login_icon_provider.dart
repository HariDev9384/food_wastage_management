import 'package:flutter/material.dart';
import 'package:food_wastage_management/custom%20icons/my_flutter_app_icons.dart';
import 'package:provider/provider.dart';
class login_visibleicon_provider with ChangeNotifier{
  bool _Active=true;
  var _eye=Icon(MyFlutterApp.visibility);
  bool get active=>_Active;
  Icon get eye=>_eye;
   eye_enable(){
     _Active=true;
     _eye=Icon(MyFlutterApp.visibility);
     notifyListeners();
   }
   
   eye_disable(){
     _Active=false;
     _eye=Icon(MyFlutterApp.visibility_off);
     notifyListeners();
   }
  
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}
