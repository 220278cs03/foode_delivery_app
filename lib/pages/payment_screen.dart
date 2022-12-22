import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'upload_photo_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List<String> listOfCards = [
    "assets/image/paypal.png",
    "assets/image/visa.png",
    "assets/image/payoneer.png"
  ];
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 36.h,
                    width: 36.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(9.82.r)),
                        color: Color(0xffF43F5E).withOpacity(0.1)),
                    child: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Icon(Icons.arrow_back_ios,
                            color: Color(0xffF43F5E).withOpacity(0.7))),
                  ),
                  24.horizontalSpace,
                  Text("Payment method",
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff09101D))),
                ],
              ),
              30.verticalSpace,
              Text(
                  "This data will be displayed in your account profile for security",
                  style: GoogleFonts.sourceSansPro(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff09101D))),
              24.verticalSpace,
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: listOfCards.length,
                    itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      currentIndex = index;
                      print(currentIndex);
                      setState(() {

                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 24),
                      height: 80.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: index == currentIndex ? Color(0xffFF1843) : Color(0xffEBEEF2)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff5A6CEA).withOpacity(0.08),
                            blurRadius: 50,
                            offset: Offset(12,26)
                          )
                        ],
                        image: DecorationImage(image: AssetImage(listOfCards[index]))
                      ),
                    ),
                  );
                }),
                Spacer(),

                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> UploadPhotoScreen()));
                  },
                  child: Container(
                    height: 55.r,
                    decoration: BoxDecoration(
                        gradient:LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xffFF7E95),
                              Color(0xffFF1843),
                            ]
                        ),
                        borderRadius:
                        BorderRadius.all(Radius.circular(32.r))),
                    child: Center(
                        child: Text(
                          "Next",
                          style: GoogleFonts.sourceSansPro(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                ),
            ],
          ),
        ));
  }
}
