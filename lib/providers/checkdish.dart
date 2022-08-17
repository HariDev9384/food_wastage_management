import 'package:flutter/cupertino.dart';
import 'package:food_wastage_management/Services/firestore/Add_Dishes_store.dart';

class checkdish with ChangeNotifier{
  bool checkavailable=true;
  bool get ca=>checkavailable;
  check(value){
    if(checkavailable!=false){
      checkavailable=value;
      notifyListeners();
    }else{
      checkavailable=value;
      notifyListeners();
      
    }
  }
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}