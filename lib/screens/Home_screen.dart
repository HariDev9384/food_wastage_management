// import 'package:flutter/material.dart';
// import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
// import 'package:food_wastage_management/custom%20icons/customicon_icons.dart';
// import 'package:food_wastage_management/providers/navigation_providers/home_navigation_provider.dart';
// import 'package:provider/provider.dart';
// class Home_Screen extends StatelessWidget {
//    Home_Screen({Key? key}) : super(key: key);
//   int _currentindex=0;
//   void selecttab(index){
//     Home_Navigation_provider().selected_navigationbaritem(index);
//   }
//   final GlobalKey _Key = new GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Consumer<Home_Navigation_provider>(
//         builder: (context, value, child) => 
//         value.selected_screen(history: hist_Container(), donate: donate_Container(), home: Home_Container(), index: value.appbarindex),
//       ),
//       endDrawer: Drawer(

//       ),
//       key: _Key,
//       bottomNavigationBar: Consumer<Home_Navigation_provider>(
//         builder: (context, value, child) => 
//          BottomNavigationBar(
//            type: BottomNavigationBarType.fixed,

//            items:<BottomNavigationBarItem> [
//              BottomNavigationBarItem(
//                 icon: Icon(Customicon.home),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(  
//                 icon: Icon(Customicon.food),
//                 label: 'Donate',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.notes),
//                 label: 'History',
//               ),
//                BottomNavigationBarItem(
//                 icon: Icon(Customicon.more_horiz),
//                 label: 'More',
                
//               ),
//            ],
//            onTap: (index){
//              value.selected_navigationbaritem(index);
//              value.selected_screen(history: hist_Container(), donate: donate_Container(), home: Home_Container(), index: index);
//              if(index==3){
//                 Scaffold.of(context).openEndDrawer();
//              }
//              },
//            currentIndex: value.selectedindex,
//         ),
//       ),
//       appBar: AppBar(
            
//             title: Consumer<Home_Navigation_provider>(
//               builder: ((context, value, child) => 
//               Text(
//                 value.appbar_titles[value.appbarindex].toString()
//               )
//               )
//             ),
//             centerTitle: true,
//             primary: true,
//             actions: [
//               IconButton(
//               icon: Icon(Icons.logout_outlined),
//               onPressed: ()=>Navigator.of(context).pushNamed('/login'),
//             ),
//             ],
//            ), 
//         );
//   }
// }
// Widget Home_Container(){
//   return Container(
//     color: Colors.red,
//     child: Center(child: Text('Home Screen')),
//   );
// }
// Widget donate_Container(){
//   return Container(
//     color: Colors.green,
//     child: Center(child: Text('Donate')),
//   );
// }
// Widget hist_Container(){
//   return Container(
//     color: Colors.pink,
//     child: Center(child: Text('History')),
//   );
// }