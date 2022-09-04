
import 'dart:developer';
import 'dart:math';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_wastage_management/providers/DishListProvider.dart';
import 'package:food_wastage_management/providers/Text_Controllers/login_controllers.dart';
import 'package:provider/provider.dart';
class Docs{
  String? DishName;
  int? Quantity;
  Docs({required this.DishName,required this.Quantity});
}
class Cart{
  String? DishName;
  int? count;
  String? Id;
  Cart({required this.DishName,required this.count,required this.Id});
}
class ProductDetails extends StatefulWidget {
  var docindex;
  var doclist;
   ProductDetails([this.docindex,this.doclist]);
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
 // var selecteduser;
 var doclength;
  List<Docs> DishList=[];
  List<Cart> CartList=[];
  bool isAdded=false;
  List streamlist=[];
  var currentuser;
  var dishdata;
   int dishno=0;

    int items=0;
    int cart=0;

    // Dishes added to carts

AddToCart()async{
  var loginprovider=Provider.of<Login_Text_Controllers>(context,listen: false);
    QuerySnapshot currentAuth=await   FirebaseFirestore.instance.collection('users').doc(widget.docindex.id.toString()).collection('donors').get();
    QuerySnapshot CurrentUserSnapshot=await FirebaseFirestore.instance.collection('users').doc(widget.docindex.id.toString()).collection('donors').get();
        QuerySnapshot dishlistsnapshot=await FirebaseFirestore.instance.collection('users').doc(loginprovider.email_clr.toString()).collection('dishlist').get();

      
      //print(dishlistsnapshot.docs.first.id);
      //print(dishlistsnapshot.docs.elementAt(0)['DishName']);
      for(int i=0;i<doclength;i++){
      if((dishlistsnapshot.docs.elementAt(i)['Quantity'])>0){
    FirebaseFirestore.instance.collection('users').doc(loginprovider.email_clr.toString()).collection('cartlist').doc('cart $i').set({
          'DishName': dishlistsnapshot.docs.elementAt(i)['DishName'],
          'Quantity': dishlistsnapshot.docs.elementAt(i)['Quantity']
        }
        );
      }
       if((dishlistsnapshot.docs.elementAt(i)['Quantity'])==0){
          FirebaseFirestore.instance.collection('users').doc(loginprovider.email_clr.toString()).collection('cartlist').doc('cart $i').delete();
      }
      }
      
}

DecQuantity(index,quantity)async{
          var loginprovider=Provider.of<Login_Text_Controllers>(context,listen: false);
  Map<String, dynamic> data = <String, dynamic>{
    "Quantity": quantity,
  };

  FirebaseFirestore.instance.collection('users').doc(loginprovider.email_clr.toString()).collection('dishlist').doc('dish ${index}').update(data);

}
IncQuantity(index,quantity)async{
          var loginprovider=Provider.of<Login_Text_Controllers>(context,listen: false);
  Map<String, dynamic> data = <String, dynamic>{
    "Quantity": quantity,
  };
  FirebaseFirestore.instance.collection('users').doc(loginprovider.email_clr.toString()).collection('dishlist').doc('dish ${index}').update(data);

}



  AddDishList()async{
  QuerySnapshot currentAuth=await   FirebaseFirestore.instance.collection('users').doc(widget.docindex.id.toString()).collection('donors').get();
    QuerySnapshot CurrentUserSnapshot=await FirebaseFirestore.instance.collection('users').doc(widget.docindex.id.toString()).collection('donors').get();
   
    var loginprovider=Provider.of<Login_Text_Controllers>(context,listen: false);
    // doc length retriev length of dishes for current page of user
    // for(int i=0;i<doclength;i++){
    //   DishList.add(
    //     FirebaseFirestore.instance.collection('users').doc(currentuser).collection('dishlist').doc('Dish ${dishno++}').set({
    //       'DishName': CurrentUserSnapshot.docs.elementAt(i)['Dish Name'],
    //     })
    //   );
    // }
    print('Added ${CurrentUserSnapshot.docs.elementAt(0)['Dish Name']}');
    //print(currentuser.docs.elementAt(0).id);
    //print(currentuser.docs.elementAt(0).id.toString());
    print(loginprovider.email_clr.toString());
    print(currentAuth.docs.length);
   while(items<=currentAuth.docs.length){
    FirebaseFirestore.instance.collection('users').doc(loginprovider.email_clr.toString()).collection('dishlist').doc('dish ${dishno++}').set({
          'DishName': CurrentUserSnapshot.docs.elementAt(items)['Dish Name'],
          'Quantity':0
        });
        setState(() {
          items++;
        });
   }
      
  }
 var sd;
 int Docitem=0;
 
 bool isDocAdded=false;
  GetDishList()async{
  
        var loginprovider=Provider.of<Login_Text_Controllers>(context,listen: false);

QuerySnapshot DishesSnapshot= await   FirebaseFirestore.instance.collection('users').doc(loginprovider.email_clr.toString()).collection('dishlist').get();
//DishesSnapshot.forEach((element) {print(element.docs.first['Quantity']);});
if(isDocAdded==false){
  for(int i=0;i<doclength;i++){
  var DishName=DishesSnapshot.docs.elementAt(i)['DishName'].toString();
  int Quantity=DishesSnapshot.docs.elementAt(i)['Quantity'];

  DishList.add(Docs(DishName: DishName, Quantity:Quantity));
  print('added');
  }
  isDocAdded=true;
  print(DishList.elementAt(3).Quantity.toString());
 
// print(DishList);
}else{
  print('Already Added');
  print(DishList.elementAt(3).Quantity.toString());
}
//print(DishesSnapshot.docs.length.toString());
//DishesSnapshot.elementAt(0).then((value) => print(value.docs.first.id));
//sd=DishesSnapshot;
  }


//DeleteDocsFromCurrentPage In Firebase

  DeleteListtoCurrenUser(){
        var loginprovider=Provider.of<Login_Text_Controllers>(context,listen: false);


          FirebaseFirestore.instance.collection('users').doc(loginprovider.email_clr.toString()).collection('dishlist').get().then((snapshot) {
            for (DocumentSnapshot ds in snapshot.docs){
              ds.reference.delete();
            }
             });
         print('dishes deleted');
    }


 int addcounter=0;

















  getCurrentUser([value])async{
     var prov=Provider.of<Login_Text_Controllers>(context,listen: false);
     print('provider : mail ${prov.email_clr.toString()}');
        QuerySnapshot usersnapshot=await FirebaseFirestore.instance.collection('users').doc(widget.docindex.id.toString()).collection('donors').get();
       
print(usersnapshot.docs.elementAt(0).id.toString());
    // doclength=snp.docs.length;
    // CartList.forEach((element) {print(element.DishName);});
   var  Currentuser=await FirebaseFirestore.instance.collection('users').doc(prov.email_clr.toString()).collection('cartlist').get();
   print(currentuser.docs.elementAt(0).id);
   //currentuser.docs;
   //selecteduser=currentuser.docs.elementAt(index).id;
  //  print(currentuser.docs.first.);

   var cartfirestore=FirebaseFirestore.instance.collection('users').doc(value.email_clr.toString()).collection('cartlist');
  QuerySnapshot qs=await cartfirestore.get();
  //  print(currentuser.docs.elementAt(index));

  print(qs.docs.first.id);
 var length=qs.docs.length;
      for(int i=0;i<length;i++)
       usersnapshot.docs.forEach((element) {CartList.add(Cart(DishName: element['Dish Name'].toString(),count: 0,Id: qs.docs.first.id));});
  dishdata=FirebaseFirestore.instance.collection('users').doc(value.email_clr.toString()).collection('cartlist');
  print(qs.docs.first.id.toString());
  print(CartList.first.Id.toString());
   cartfirestore.doc(CartList.first.Id).update({
    'Desc':'lkkjh',
    'Dish Id':'67',
    'Dish Name':'idli',
    'Quantity':CartList.elementAt(0).count
   });
   streamlist.add(CartList);
    //var j=await FirebaseFirestore.instance.collection('users').doc(value.email_clr.toString()).collection('cartlist').get();
    //j.docs.forEach((element) {print(element.id.toString());});
  }
  getdoclength()async{
    QuerySnapshot snp=await FirebaseFirestore.instance.collection('users').doc(widget.docindex.id.toString()).collection('donors').get();

    //doclength=snp.docs.length;
  }
 
  void inc(index){
    int counter=0;
    
      counter++;
      CartList.elementAt(index).count=counter++;
      print(CartList.elementAt(index).count);
    
         
  }
  // void addCartList()async{
  //    QuerySnapshot snp=await FirebaseFirestore.instance.collection('users').doc(widget.docindex.id.toString()).collection('donors').get();

  //   doclength=snp.docs.length;

  //   snp.docs.forEach((element) {CartList.add(Cart(DishName: element['Dish Name'].toString(),count: 0,Id: element.id));});
  //   CartList.forEach((element) {print(element.DishName);});
  //   CartList.add(snp.docs.forEach((element) { }));
  // }
  

  @override
  void initState() {
    var prov=Provider.of<Login_Text_Controllers>(context,listen: false);
    super.initState();
   AddDishList();
   GetDishList();
    
                 // AddDishList();
                
   getCurrentUser(prov.email_clr.toString());
    //getdoclength();    
    
  }

  //  getdet()async{
  //   Query userquery=FirebaseFirestore.instance.collection('users').where('role',isEqualTo: 'donor');
  //    QuerySnapshot usersnapshot=await userquery.get();
  //     Stream userstream=FirebaseFirestore.instance.collection('users').where('role',isEqualTo: 'donor').get();
  //  }

  @override
  Widget build(BuildContext context) {
  // prov= Provider.of<Login_Text_Controllers>(context,listen: false);
   Stream<QuerySnapshot> s=FirebaseFirestore.instance.collection('users').snapshots();
   var sl=s.map((event) => event.docs);
    var height=MediaQuery.of(context).size.height;
    //final provider = DishListProvider.of(context);
    
    
    var width=MediaQuery.of(context).size.width;
    
    //getprovider(provider);
    return 
       Consumer<Login_Text_Controllers>(
        builder: (context, value, child) => 
          WillPopScope(
             onWillPop: () async => false,
           child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                icon: Icon(Icons.chat),
                onPressed: (){
                  AddToCart();
                  //AddDishList();
                  GetDishList();
                  print(DishList.first.Quantity);
                  DishList.clear();
                  isAdded=false;
                  print(DishList.length);
                  // AddCartList();
                  
                  // if(provider.isAdded==false){
                  //   for(int i=0;i<doclength;i++){
                  // provider.AddDishes();
                  //   }
                  // print(provider.dishes);
                  // provider.isAdded=true;
                  // provider.notifyListeners();
                  // }
                  // else{
                  //   print('Its Already to list');
                  // }
                    
                  
           // print(provider.dishes);
                 // provider.AddDishes();
                 //print('If Add dishes then length will increase ${provider.dishes.elementAt(0).count}');
                },
                )
              ],
              backgroundColor: Colors.indigo,
              //title: Text(provider.dishes.length.toString()),
              title: Text(widget.docindex['Full name']),
              leading: IconButton(icon: Icon(Icons.arrow_left),onPressed: (){
                DeleteListtoCurrenUser();
                Navigator.of(context).pushNamed('/recipienthome');
                //print('before clear ${provider.dishes.length}');
                //provider.dishes.clear();
                //print('before clear ${provider.dishes.length}');
         
           }),
            ),
            body: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('users').doc(widget.docindex.id.toString()).collection('donors').snapshots(),
              builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
                
              if(snapshot.hasData&&snapshot.data!.docs.isNotEmpty){
                            doclength=snapshot.data!.docs.length;
           
                return Stack(
                  children: [
                    Container(
                    height: height/1,
                    width: width/1,
                    color: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          
                          return Column(
                            children: [
                              SizedBox(height: height*0.02,),
                              Container(
                                height: height*0.24,
                                width: width/1,
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: height*0.18,
                                      width: width*0.45,
                                      color: Colors.transparent,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(snapshot.data!.docs.elementAt(index)['Dish Name'],
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                          ),
                                          ),
                                          SizedBox(height: height*0.01,),
                                          Text('\$  ${200+index}',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold
                                          ),
                                          ),
                                          SizedBox(height: height*0.01,),
                                          Text('Description',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold
                                          ),
                                          )
                                        ],
                                      ),
                                    ),
                                     Container(
                                      height: height*0.22,
                                      width: width*0.45,
                                      color: Colors.transparent,
                                      child: Stack(
                                        children: 
                                          [ 
                                            Container(
                                            margin: EdgeInsets.all(height*0.02),
                                            height: height*0.15,
                                            decoration: BoxDecoration(
                                              color: Colors.black12,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage('https://c.ndtvimg.com/2021-05/tj7sdqj8_parotta_625x300_14_May_21.jpg?im=FaceCrop,algorithm=dnn,width=1200,height=675')
                                              ),
                                              borderRadius: BorderRadius.circular(10)
                                            ),
                                          ),
                                            Positioned(
                                              left: width*0.13,
                                              top: height*0.15,
                                              child: StreamBuilder(
                                                stream: FirebaseFirestore.instance.collection('users').doc(value.email_clr.toString()).collection('dishlist').snapshots(),
                                                builder: (context,AsyncSnapshot<QuerySnapshot> Dishsnapshot) {
                                                  if(Dishsnapshot.hasData){
                                                    return
                                                 Container(
                                                  height: height*0.04,
                                                  width: width*0.2,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      InkWell(
                                                         highlightColor: Colors.blue,
                                                        radius: 20,
                                                        splashColor: Colors.red,
                                                        onTap: (){
                                                          if(addcounter>0){
                                                          setState(() {
                                                            addcounter--;
                                                            print(addcounter);
                                                          });
                                                          DecQuantity(index+1,addcounter);
                                                          }else{
                                                            print('quantity is zero');
                                                          }
                                                        },
                                                        child: Icon(FontAwesomeIcons.minus,size: 18,)),
                                                      SizedBox(width: width*0.02,),
                                                      
                                                      Text(
                                                        Dishsnapshot.data!.docs.elementAt(index)['Quantity'].toString()
                                                        ,style: TextStyle(fontSize: 18),),
                                                      SizedBox(width: width*0.02,),
                                                      InkWell(
                                                        highlightColor: Colors.blue,
                                                        radius: 20,
                                                        splashColor: Colors.red,
                                                        onTap: (){
                                                          if(addcounter<20){
                                                          setState(() {
                                                            addcounter++;
                                                            print(addcounter);
                                                          });
                                                          IncQuantity(index,addcounter);
                                                          print(DishList.elementAt(index).DishName);
                                                          }else{
                                                            print('maximum limit reached');
                                                          }
                                                          //print(addcounter);
                                                          
                                                        },
                                                        child: Icon(FontAwesomeIcons.plus,size: 16,))
                                                    ],
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(10)
                                                  ),
                                                  
                                                );
                                                  }
                                                  else{
                                                    return SizedBox.shrink();
                                                  }
                                                }
                                              ),
                                            ),
                                            Positioned(
                                              left: width*0.12,
                                              top: height*0.2,
                                              child: Text('Customisable')
                                            ),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                            ],
                          );
                          //return Text(snapshot.data!.docs.elementAt(index)['Dish Name']);
                        },
                      ),
                    ),
              ),
                    Positioned(
                      bottom: 10,
                      left: width*0.1,
                      child: (true)?InkWell(
                        onTap: (){
                            AddToCart();
                             },
                        child: Container(
                          height: height*0.04,
                          width: width*0.3,
                          child: Center(child: Text('Add to Cart',
                          style: TextStyle(
                            color: Colors.white
                          ),
                          ),),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.indigo,
                                Colors.grey
                              ]
                            )
                          ),
                          ),
                      ):Container(),
                    ),
                  ],
                );
              }else {
               return Center(
                child: Text('No Dishes are availble'),
               );
              }
              return Center(
                  child: CircularProgressIndicator(),
                );
              }
            ),
               ),
         ),
       );
  }
}

listitem(){
  return ListTile(

  );
}