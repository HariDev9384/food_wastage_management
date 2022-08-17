import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:food_wastage_management/providers/Text_Controllers/login_controllers.dart';
import 'package:provider/provider.dart';

class docid with ChangeNotifier{
  var id;
  get did=>id;
  getdocid(context)async{
    var value=Provider.of<Login_Text_Controllers>(context,listen: false);
     Query query=FirebaseFirestore.instance.collection('users').where('gmail',isEqualTo: value.email_clr);
     QuerySnapshot qs=await query.get();
     id=qs.docs.map((e)=>e.id).toString();
     print(id);
     print(value.email_clr);
     print('pass through widget $id');
     notifyListeners();
  }
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}