import 'package:fast_food_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CongratsScreen extends StatefulWidget {
  const CongratsScreen({Key? key}) : super(key: key);

  @override
  State<CongratsScreen> createState() => _CongratsScreenState();
}

class _CongratsScreenState extends State<CongratsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image/splash_screen.png"),
                  fit: BoxFit.cover)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Column(
                    children: [
                      Container(
                        width: 178.w,
                        height: 173.h,
                        child: Image.asset('assets/image/congrats.png'),
                      ),
                      24.verticalSpace,
                      Text(
                        "Congrats!",
                        style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w600,
                            fontSize: 32,
                            color: Color(0xffF43F5E)),
                      ),
                      24.verticalSpace,
                      Text(
                        "Your profile is ready to use",
                        style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Color(0xff09101D)),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => Homepage()));
                    },
                    child: Container(
                      height: 55.r,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xffFF7E95),
                                Color(0xffFF1843),
                              ]),
                          borderRadius: BorderRadius.all(Radius.circular(32.r))),
                      child: Center(
                          child: Text(
                        "Go homepage",
                        style: GoogleFonts.sourceSansPro(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
