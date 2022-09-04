import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_wastage_management/screens/recipients/Tabs/product_details.dart';
import 'package:provider/provider.dart';

class ProductItem{
 late  int counter=0;
  ProductItem({required this.counter});
}
class ProductItemListProvider extends ChangeNotifier{
List<ProductItem> productlist=<ProductItem>[];
List<ProductItem> get _productlist=>productlist;
AddData( val){
productlist.add(val);
notifyListeners();
}
static ProductItemListProvider of(
     BuildContext context,{
       bool listen=true
   }){
     return Provider.of<ProductItemListProvider>(context,listen: listen);
   }
  
}

// class ProductItemListProvider extends ChangeNotifier{
//   List<ProductItem> productlist=<ProductItem>[];
//   List<ProductItem> get _productlist=>productlist;
//   late int length;
//   AddData(ProductItem productItem){
//     productlist.add(productItem);
//     notifyListeners();
//   }
//   GetDoc(widget)async{
//    QuerySnapshot snapshot=await FirebaseFirestore.instance.collection('users').doc(widget.docindex.id.toString()).collection('donors').get();
   
//    snapshot.docs.forEach(
//     (e){
//       productlist.add(ProductItem(counter: 0));
//       notifyListeners();
//     }
//    );
   
//    productlist.forEach((e)=>print(e.counter));
//    notifyListeners();
//        return productlist;

//   }
//   static ProductItemListProvider of(
//     BuildContext context,{
//       bool listen=true
//   }){
//     return Provider.of<ProductItemListProvider>(context,listen: listen);
//   }
  
// }