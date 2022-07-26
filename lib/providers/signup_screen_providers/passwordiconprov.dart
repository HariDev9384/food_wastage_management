import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../custom icons/my_flutter_app_icons.dart';

class passiconprovider with ChangeNotifier{
  bool _Active=true;
  bool get Active=>_Active;
  var _passeye=Icon(Icons.visibility);
  Icon get passeye=>_passeye;
  passenable(){
    _Active=true;
    _passeye=Icon(Icons.visibility);
    notifyListeners();
  }
  
  passdisable(){
    _Active=false;
    _passeye=Icon(Icons.visibility_off);
    notifyListeners();
  }
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}