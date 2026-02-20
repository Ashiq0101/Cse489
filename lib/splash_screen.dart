

import 'package:flutter/material.dart';
import 'package:vangti_chai/screens/calculator.dart';

class SplashScreen extends StatefulWidget {
  static const pageRoute = "/splash-screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => Calculator(),
        ),
      );
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/taka.png",
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20,),
            // ignore: prefer_const_constructors
            Text("Vangti Chai",style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              fontFamily: "PoppinsBold",

            ),)
          ],
        ),
      ),
    );
  }
}
