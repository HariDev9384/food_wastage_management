import 'package:flutter/material.dart';
import 'package:food_wastage_management/providers/Text_Controllers/login_controllers.dart';
import 'package:food_wastage_management/providers/login_screen_providers/login_icon_provider.dart';
import 'package:food_wastage_management/providers/navigation_providers/home_navigation_provider.dart';
import 'package:food_wastage_management/providers/signup_screen_providers/passwordiconprov.dart';
import 'package:food_wastage_management/providers/signup_screen_providers/confirmpasswordiconprov.dart';
import 'package:food_wastage_management/providers/signup_screen_providers/signup_variables_provider.dart';
import 'package:food_wastage_management/providers/signup_screen_providers/user_types.dart';
import 'package:food_wastage_management/screens/donors/donor_home.dart';
import 'package:food_wastage_management/screens/recipients/recipient_home.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_wastage_management/screens/Home_screen.dart';
import 'package:food_wastage_management/screens/Signup_screen.dart';
import 'package:food_wastage_management/screens/login_screen.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  runApp(
  MultiProvider(
    child: MyApp(),
    providers: [
    ChangeNotifierProvider<login_visibleicon_provider>(create: (_login)=>login_visibleicon_provider()),
    ChangeNotifierProvider<confirmpassiconprovider>(create: (_confirm)=>confirmpassiconprovider()),
    ChangeNotifierProvider<passiconprovider>(create: (_pass)=>passiconprovider()),
    ChangeNotifierProvider(create: (_home_navigation)=>Home_Navigation_provider()),
    ChangeNotifierProvider(create: (text_clr)=>Login_Text_Controllers()),
    ChangeNotifierProvider(create: (signup_varprov)=>Signup_Variable_Provider()),
    ChangeNotifierProvider(create: (user_types)=>UserTypes())
    
  ])
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login':(context) => Login_Screen(),
        '/signup':(context) =>Signup_Screen(),
        //'/home':(context)=>Home_Screen(),
        '/donorhome':(context)=>DonorHome(),
        '/recipienthome':(context)=>RecipientHome()
      },
      debugShowCheckedModeBanner: false,
      home: Login_Screen(),
    );    
  }
}