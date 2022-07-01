
import 'package:flutter/material.dart';
import 'package:projetflutter/pages/Onboarding.dart';
import 'package:projetflutter/signUp.dart';
import './home.dart';
import './donUrgent.dart';
import './tirerProfit.dart';
import './login.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import './donOfficiel.dart';
import 'listeDates.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context)=>LoginPage(),
        "/home":(context)=>HomePage(),
        "/donOfficiel":(context)=>DonOfficiel(),
        "/DonUrgent":(context)=>DonUrgent(),
        "/tirerProfit":(context)=>TirerProfit(),
        "/login":(context)=>LoginPage(),
        "/Onboarding":(context)=>Onboarding(),
        "/listeDates":(context)=>ListeDates(),
        "/signUp":(context)=>signUp()
      },
      initialRoute: "/",
    );
  }
}

