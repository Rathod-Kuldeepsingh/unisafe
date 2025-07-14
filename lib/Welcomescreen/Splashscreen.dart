import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unisafe/WelcomeScreen/Startedpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const Startedpage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            Image.asset(
              'assets/logo.png',
              width: screenWidth * 0.5,
            ),
            Text(
              'UniSafe',
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.blueAccent,
              ),
              )
            ),

            Text(
              'Reporting Made Secure',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: screenHeight * 0.050,),
            CircularProgressIndicator(
              color: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}