import 'package:flutter/material.dart';
import 'package:food_wastage_management/custom%20icons/my_flutter_app_icons.dart';
import 'package:provider/provider.dart';

class confirmpassiconprovider with ChangeNotifier{
  bool _confirmActive=true;
  bool get confirmActive=>_confirmActive;
  var _confirmpasseye=Icon(Icons.visibility);
  Icon get confirmpasseye=>_confirmpasseye;
  confirmpassenable(){
    _confirmActive=true;
    _confirmpasseye=Icon(Icons.visibility);
    notifyListeners();
  }
  confirmpassdisable(){
    _confirmActive=false;
    _confirmpasseye=Icon(Icons.visibility_off);
    notifyListeners();
  }
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}
