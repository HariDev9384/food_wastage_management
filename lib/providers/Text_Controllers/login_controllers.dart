import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
class Login_Text_Controllers with ChangeNotifier{
  var email_clr,pass_clr;
  String get _email_clr=>email_clr;
  String get _pass_clr=>pass_clr;
  emailclr(var txt){
    email_clr=txt;
    notifyListeners();
  }
  passclr(var txt){
    pass_clr=txt;
    notifyListeners();
  }
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}