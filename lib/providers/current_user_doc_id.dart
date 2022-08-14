import 'package:flutter/widgets.dart';

class Current_Doc with ChangeNotifier{
  var current_doc_id;
  get currentdocid=>current_doc_id;
  getdocid(docid){
    current_doc_id=docid;
    notifyListeners();
    print('From consumer :${current_doc_id}');
  }
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}