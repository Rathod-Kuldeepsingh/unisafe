// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:unisafe/Admin/Admindashboardscreen.dart';
import 'package:unisafe/Admin/AuthFile.dart';
import 'package:unisafe/Admin/adminscreen.dart';
import 'package:unisafe/Student/Dashboard.dart';
import 'package:unisafe/WelcomeScreen/SplashScreen.dart';
import 'package:unisafe/WelcomeScreen/Startedpage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(url: dotenv.env['SUPABASE_URL']!, anonKey: dotenv.env['SUPABASE_KEY']!);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),

      routes: {
        "/adminauth" : (context) => Authfile(),
        "/student" : (context) => Dashboard(),
        "/start" : (context) => Startedpage()
      },
    );
  }
}