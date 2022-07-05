import 'package:flutter/material.dart';
import 'package:food_wastage_management/custom%20icons/my_flutter_app_icons.dart';
import 'package:provider/provider.dart';

class confirmpassiconprovider with ChangeNotifier{
  bool _confirmActive=true;
  bool get confirmActive=>_confirmActive;
  var _confirmpasseye=Icon(MyFlutterApp.visibility);
  Icon get confirmpasseye=>_confirmpasseye;
  confirmpassenable(){
    _confirmActive=true;
    _confirmpasseye=Icon(MyFlutterApp.visibility);
    notifyListeners();
  }
  confirmpassdisable(){
    _confirmActive=false;
    _confirmpasseye=Icon(MyFlutterApp.visibility_off);
    notifyListeners();
  }
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}
