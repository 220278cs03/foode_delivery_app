import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'sign_in_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 428.w,
        height: 926.h,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/image/background_on_boarding.png'), fit: BoxFit.cover)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              705.verticalSpace,
              Text("Foode", style: GoogleFonts.sourceSansPro(fontWeight: FontWeight.w600, fontSize: 33.sp, color:Colors.white),),
              4.verticalSpace,
              Text("The best food ordering and delivery app of the century", style: GoogleFonts.sourceSansPro(color:Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w400), textAlign: TextAlign.center,),
              40.verticalSpace,
              InkWell(
                child: Container(
                  height: 55.r,
                  width: 380.r,
                  decoration: BoxDecoration(
                      gradient:LinearGradient(
                        begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xffFF7E95),
                      Color(0xffFF1843),
                    ]
                  ),
                    borderRadius: BorderRadius.all(Radius.circular(32.r))
                  ),
                  child: Center(
                    child: Text("Next", style: GoogleFonts.sourceSansPro(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.white),)
                  )
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SignInScreen()));
                },
              )
            ],
          ),
        ),
      )
    );
  }
}
//hello world how are you
     