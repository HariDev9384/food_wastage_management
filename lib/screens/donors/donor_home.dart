import 'package:flutter/material.dart';
class DonorHome extends StatelessWidget {
  const DonorHome({Key? key}) : super(key: key);

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
            Container(
              height: height*0.08,
              width: width/1,
              color: Colors.red,
              child: Row(
                children: [
                  Container(
                    height: height*0.08,
                    width: width*0.7,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.location_on),
                        Container(
                          height: height*0.8,
                          color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,

                            children: [
                              Text('Your Location',
                              style: TextStyle(
                                fontSize: 18,
                                wordSpacing: 2
                              ),
                              ),
                              Text('Coimbatore')
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: height*0.08,
                    width: width*0.3,
                    color: Colors.pink,
                  )
                ],
              ),
            ),
            Center(
               child: Text('donor home'),
            ),
            Positioned(
              top: height/1.1,
              left: 0,
              child: Container(
                height: height/11,
                width: width/1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
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