import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_wastage_management/Services/firestore_data/signup_details.dart';
import 'package:food_wastage_management/models/current_user.dart';
class HomeTab extends StatefulWidget {
  const HomeTab ({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
            List DonorList=[];

   addlist()async{
    Query query=FirebaseFirestore.instance.collection('users');
    QuerySnapshot qs=await query.get();
    int i=0;
        Query q2=FirebaseFirestore.instance.collection('users').doc(qs.docs.elementAt(i++).id).collection('donors');
    QuerySnapshot q22=await q2.get();

    print(q22.docs.map((e) => e.data()));
    qs.docs.map((e) {
      print(e.data());
      print(e['role']);
      if(e['role']=='donor'){
       DonorList.add( e.data());
      }else{
        print('not added');
      }
    });
    print(DonorList);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addlist();
  }
  @override
  Widget build(BuildContext context) {
    
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var firestore=FirebaseFirestore.instance;
     Current_User? current_user;
    var dbcoll=firestore.collection('users').snapshots();
    return StreamBuilder<QuerySnapshot>(
        stream: dbcoll,
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
          List j=[];
          
          return ListView.builder(
            itemCount: DonorList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: height*0.12,
                    width: width*0.85,
                    color: Colors.amber,
                  ),
                  SizedBox(height: height*0.02,)
                ],
              );
            },
          );
        }
    );
  }
}