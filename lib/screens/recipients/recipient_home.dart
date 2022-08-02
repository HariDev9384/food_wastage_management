import 'package:flutter/material.dart';
class RecipientHome extends StatelessWidget {
  const RecipientHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      
     

      body: Container(
        height: height/1,
        width: width/1,
        color: Colors.white,
        child: Stack(
          children: [
            Center(
               child: Text('recipient home'),
            ),
            Positioned(
              top: height/1.25,
              right: width*0.05,
              child: Container(
                height: 70,
                width: 70,
                color: Colors.transparent,
                child: FloatingActionButton(
                  elevation: 8,
                  splashColor: Colors.white,
                  backgroundColor: Colors.deepPurpleAccent,
                  onPressed: (){
                    
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ),
            Positioned(
              top: height/1.1,
              left: 0,
              child: Container(
                height: height/11,
                width: width/1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.delivery_dining,
                      color: Colors.white,
                      size: 45,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.local_offer_sharp,
                      color: Colors.white,
                      size: 35,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.home,
                      color: Colors.white,
                      size: 40,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.payment,
                      color: Colors.white,
                      size: 40,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.more_horiz,
                      size: 40,
                      color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                //color: Colors.red,
                decoration: BoxDecoration(
                  boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 60.0,
              spreadRadius: -1.0,
              offset: Offset(-15.0, -10.0), // shadow direction: bottom right
            )
        ],

                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  )
                ),
              
              ),
            )
          ],
        ),
      )
    );
  }
}