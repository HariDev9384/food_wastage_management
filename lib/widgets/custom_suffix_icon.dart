import 'package:flutter/material.dart';

Widget customsuffixicon(BuildContext context,var value){
  return IconButton(
    onPressed: (){
      
      if(value.active){
        value.eye_disable();
      }else{
        value.eye_enable();
      }
      value.notifyListeners();
  },
  icon: value.eye);
}
