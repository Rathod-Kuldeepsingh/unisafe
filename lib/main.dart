// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:unisafe/Admin/Admindashboardscreen.dart';
import 'package:unisafe/Admin/AuthFile.dart';
import 'package:unisafe/Student/Dashboard.dart';
import 'package:unisafe/WelcomeScreen/SplashScreen.dart';
import 'package:unisafe/WelcomeScreen/Startedpage.dart';


const supabaseUrl = 'https://qhdbbremyoasuzcqhzcc.supabase.co';
const supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFoZGJicmVteW9hc3V6Y3FoemNjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTIzODQ5ODcsImV4cCI6MjA2Nzk2MDk4N30.oSFAf1VX6FI1GzLYf-Td6GsaKF8gOinSbLWJc1DmxEY";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      home: Dashboard(),

      routes: {
        "/adminauth" : (context) => Authfile(),
        "/student" : (context) => Dashboard(),
        "/start" : (context) => Startedpage()
      },
    );
  }
}