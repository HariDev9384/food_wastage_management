import 'package:cloud_firestore/cloud_firestore.dart';

class AddDishesFirestore{
  var firestore=FirebaseFirestore.instance;

  add_dishes_firestore({dish_name,donor_name,quantity,desc,price,docid}){

    print('Add dishes to document id: ${docid}');
    if(dish_name!=null&&donor_name!=null&&price!=null&&quantity!=null&&desc!=null){

    firestore.collection('users').doc(docid).collection('donors').add(
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
}