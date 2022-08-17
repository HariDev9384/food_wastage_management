import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_wastage_management/providers/Text_Controllers/login_controllers.dart';
import 'package:food_wastage_management/providers/checkdish.dart';
import 'package:provider/provider.dart';

class AddDishesFirestore{
  var firestore=FirebaseFirestore.instance;
  add_dishes_firestore({dish_name,donor_name,quantity,desc,price,docid,context}){

    final currentlogin=Provider.of<Login_Text_Controllers>(context,listen: false);
    if(dish_name!=null&&donor_name!=null&&price!=null&&quantity!=null&&desc!=null){
      
    firestore.collection('users').doc(currentlogin.email_clr).collection('donors').add(
      {
        'Dish Name':dish_name,
        'Donor Name':donor_name,
        'Availble':false,
        'Quantity':quantity,
        'Description':desc,
        'Price':price,
        
      }
    );
    }else{
      print('not added');
    }
  }
  update({context,index})async{
        final currentlogin=Provider.of<Login_Text_Controllers>(context,listen: false);
        final avail=Provider.of<checkdish>(context,listen: false);
        Query query=firestore.collection('users').doc(currentlogin.email_clr).collection('donors');
        QuerySnapshot qs=await query.get();
        
     firestore.collection('users').doc(currentlogin.email_clr).collection('donors').doc(qs.docs.map((e) => e.id).toList().elementAt(index)).update(
      {
        'Availble':avail.checkavailable,
      }
    );

  }
  Dish_Delete({context,index})async{
    final currentlogin=Provider.of<Login_Text_Controllers>(context,listen: false);
        final avail=Provider.of<checkdish>(context,listen: false);
        Query query=firestore.collection('users').doc(currentlogin.email_clr).collection('donors');
        QuerySnapshot qs=await query.get();
        
     firestore.collection('users').doc(currentlogin.email_clr).collection('donors').doc(qs.docs.map((e) => e.id).toList().elementAt(index)).delete();
  }
}
