import 'package:flutter/material.dart';
class BottomNavigationIndex with ChangeNotifier{
  var current_index=0;
  get c_index=>current_index;
  Select_index(val){
    current_index=val;
  }
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}