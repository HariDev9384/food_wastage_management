import 'package:flutter/material.dart';
import 'package:food_wastage_management/custom%20icons/my_flutter_app_icons.dart';
import 'package:provider/provider.dart';
class login_visibleicon_provider with ChangeNotifier{
  bool _Active=true;
  var _eye=Icon(Icons.visibility,color: Colors.white);
  bool get active=>_Active;
  Icon get eye=>_eye;
   eye_enable(){
     _Active=true;
     _eye=Icon(Icons.visibility,color: Colors.white);
     notifyListeners();
   }
   
   eye_disable(){
     _Active=false;
     _eye=Icon(Icons.visibility_off,color: Colors.white38);
     notifyListeners();
   }
  
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}
