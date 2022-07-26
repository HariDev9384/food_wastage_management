import 'package:flutter/material.dart';
class UserTypes with ChangeNotifier{
  bool recipient=false;
  bool donor=false;
  get r=>recipient;
  get d=>donor;
  SelectRecipient(){
      if(recipient==false){
      recipient=true;
      donor=false;
     
      notifyListeners();
      }else{
        recipient=false;
      donor=true;
     
      notifyListeners();
      }
    }
  SelectDonor(){
    if(donor==false){
      donor=true;
      recipient=false;
      notifyListeners();
    }else{
      donor=false;
      recipient=true;
      notifyListeners();
    }

     
  }
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}