import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {  

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => OnBoardingScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 428.w,
        height: 926.h,
        decoration: BoxDecoration(
          color:Colors.red,
          image: DecorationImage(image: AssetImage("assets/image/background_splash_screen.png"),fit: BoxFit.cover)
        ),
        child: Center(
          child: Image.asset('assets/image/logo_splash_screen.png')
        )
      )
    );
  }
}
