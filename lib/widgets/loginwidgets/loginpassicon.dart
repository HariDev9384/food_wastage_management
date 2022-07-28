import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Customloginpassicon(context,value){
  return IconButton(
    onPressed: (){
      if(value.active){
        value.eye_disable();
        value.notifyListeners();
      }else{
        value.eye_enable();
        value.notifyListeners();
      }
        value.notifyListeners();

    },
    icon: value.eye,
  );
}