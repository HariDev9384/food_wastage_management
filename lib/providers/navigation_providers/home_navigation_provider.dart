import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
class Home_Navigation_provider with ChangeNotifier{
  Widget? home;
  Widget? donate;
  Widget? history;
  int _selectedindex=0;
  int _appbarindex=0;
  List appbar_titles=['Home','Donate','History',''];
  int get selectedindex=>_selectedindex;
  int get appbarindex=>_appbarindex;
  Widget? get _home=>home;
  Widget? get _donate=>donate;
  Widget? get _history=>history;
  selected_screen({required history,required donate,required home,required int index}){
    if(index==0){
      return home;
    }else if(index==1){
      return donate;
    }else if(index==2){
      return history;
    }
  }
  selected_navigationbaritem(int index){
    _selectedindex=index;
    _appbarindex=index;
    notifyListeners();
  }
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}