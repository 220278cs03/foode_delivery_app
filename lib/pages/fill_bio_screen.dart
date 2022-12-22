import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';
import 'payment_screen.dart';

class FillBioScreen extends StatefulWidget {
  const FillBioScreen({Key? key}) : super(key: key);

  @override
  State<FillBioScreen> createState() => _FillBioScreenState();
}

class _FillBioScreenState extends State<FillBioScreen> {
  // String name = "";
  //
  // String imagePath = "";
  //
  // Future<void> getInfo() async{
  //   SharedPreferences _local = await SharedPreferences.getInstance();
  //   name = _local.getString("name") ?? "";
  //   imagePath = _local.getString("image") ?? "";
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   getInfo();
  //   super.initState();
  // }

  TextEditingController fullName = TextEditingController();
  TextEditingController nickName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  TextEditingController address = TextEditingController();

  bool isFullNameEmpty = false;
  bool isNickNameEmpty = false;
  bool isPhoneNumberEmpty = false;
  bool isGenderEmpty = false;
  bool isBirthDateEmpty = false;
  bool isAddressEmpty = false;

  String value = "Male";
  var items = [
    "Male",
    "Female"
  ];

  String dateText ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
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
                    Text("Fill in your bio",
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
                35.verticalSpace,
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Full Name",
                      style: GoogleFonts.sourceSansPro(
                          color: Color(0xff2C3A4B),
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp)),
                  TextSpan(
                      text: "*",
                      style: GoogleFonts.sourceSansPro(
                          color: Color(0xffDA1414),
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp))
                ])),
                8.verticalSpace,
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Color(0xff5A6CEA).withOpacity(0.08),
                        blurRadius: 50,
                        offset: Offset(12, 26))
                  ]),
                  child: TextFormField(
                    controller: fullName,
                    onChanged: (s){
                      isFullNameEmpty = false;
                      setState(() {

                      });
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100).r),
                          borderSide: BorderSide(color: Color(0xffEBEEF2))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100).r),
                          borderSide: BorderSide(color: Color(0xffEBEEF2))),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100).r),
                          borderSide: BorderSide(color: Color(0xffEBEEF2))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100).r),
                          borderSide: BorderSide(color: Color(0xffEBEEF2))),
                      hintText: 'Full Name',
                      hintStyle: GoogleFonts.sourceSansPro(
                          color: Color(0xffDADEE3),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                  ),
                ),
                //Text(name, style: TextStyle(fontSize: 30),)
                isFullNameEmpty ? Container(
                  margin: EdgeInsets.only(top:8),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 33.r,
                  decoration: BoxDecoration(
                      color: Color(0xffEBEEF2),
                      borderRadius:
                      BorderRadius.all(Radius.circular(8.r))),
                  child: Row(
                    children: [
                      Container(
                        height: 16.r,
                        width: 16.r,
                        decoration: BoxDecoration(
                            color: Color(0xff394452),
                            shape: BoxShape.circle),
                        child: Center(
                            child: Text(
                              "!",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      5.horizontalSpace,
                      Text(
                        "Enter your full name",
                        style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff394452)),
                      )
                    ],
                  ),
                )
                    : SizedBox.shrink(),
                20.verticalSpace,
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Nick Name",
                      style: GoogleFonts.sourceSansPro(
                          color: Color(0xff2C3A4B),
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp)),
                  TextSpan(
                      text: "*",
                      style: GoogleFonts.sourceSansPro(
                          color: Color(0xffDA1414),
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp))
                ])),
                8.verticalSpace,
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Color(0xff5A6CEA).withOpacity(0.08),
                        blurRadius: 50,
                        offset: Offset(12, 26))
                  ]),
                  child: TextFormField(
                    controller: nickName,
                    onChanged: (s){
                      isNickNameEmpty = false;
                      setState(() {

                      });
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100).r),
                          borderSide: BorderSide(color: Color(0xffEBEEF2))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100).r),
                          borderSide: BorderSide(color: Color(0xffEBEEF2))),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100).r),
                          borderSide: BorderSide(color: Color(0xffEBEEF2))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100).r),
                          borderSide: BorderSide(color: Color(0xffEBEEF2))),
                      hintText: 'Nick Name',
                      hintStyle: GoogleFonts.sourceSansPro(
                          color: Color(0xffDADEE3),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                  ),
                ),
                isNickNameEmpty ? Container(
                  margin: EdgeInsets.only(top:8),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 33.r,
                  decoration: BoxDecoration(
                      color: Color(0xffEBEEF2),
                      borderRadius:
                      BorderRadius.all(Radius.circular(8.r))),
                  child: Row(
                    children: [
                      Container(
                        height: 16.r,
                        width: 16.r,
                        decoration: BoxDecoration(
                            color: Color(0xff394452),
                            shape: BoxShape.circle),
                        child: Center(
                            child: Text(
                              "!",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      5.horizontalSpace,
                      Text(
                        "Enter your nick name",
                        style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff394452)),
                      )
                    ],
                  ),
                )
                    : SizedBox.shrink(),
                20.verticalSpace,
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Phone Number",
                      style: GoogleFonts.sourceSansPro(
                          color: Color(0xff2C3A4B),
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp)),
                  TextSpan(
                      text: "*",
                      style: GoogleFonts.sourceSansPro(
                          color: Color(0xffDA1414),
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp))
                ])),
                8.verticalSpace,
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Color(0xff5A6CEA).withOpacity(0.08),
                        blurRadius: 50,
                        offset: Offset(12, 26))
                  ]),
                  child: TextFormField(
                    controller: phoneNumber,
                    onChanged: (s){
                      isPhoneNumberEmpty = false;
                      setState(() {

                      });
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100).r),
                          borderSide: BorderSide(color: Color(0xffEBEEF2))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100).r),
                          borderSide: BorderSide(color: Color(0xffEBEEF2))),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100).r),
                          borderSide: BorderSide(color: Color(0xffEBEEF2))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100).r),
                          borderSide: BorderSide(color: Color(0xffEBEEF2))),
                      hintText: 'Phone Number',
                      hintStyle: GoogleFonts.sourceSansPro(
                          color: Color(0xffDADEE3),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                  ),
                ),
                isPhoneNumberEmpty ? Container(
                  margin: EdgeInsets.only(top:8),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 33.r,
                  decoration: BoxDecoration(
                      color: Color(0xffEBEEF2),
                      borderRadius:
                      BorderRadius.all(Radius.circular(8.r))),
                  child: Row(
                    children: [
                      Container(
                        height: 16.r,
                        width: 16.r,
                        decoration: BoxDecoration(
                            color: Color(0xff394452),
                            shape: BoxShape.circle),
                        child: Center(
                            child: Text(
                              "!",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      5.horizontalSpace,
                      Text(
                        "Enter your phone number",
                        style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff394452)),
                      )
                    ],
                  ),
                )
                    : SizedBox.shrink(),
                20.verticalSpace,
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Gender",
                      style: GoogleFonts.sourceSansPro(
                          color: Color(0xff2C3A4B),
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp)),
                  TextSpan(
                      text: "*",
                      style: GoogleFonts.sourceSansPro(
                          color: Color(0xffDA1414),
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp))
                ])),
                8.verticalSpace,
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Color(0xff5A6CEA).withOpacity(0.08),
                        blurRadius: 50,
                        offset: Offset(12, 26))
                  ]),
                  child: DropdownButtonFormField(
                    value : value,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100).r),
                          borderSide: BorderSide(color: Color(0xffEBEEF2))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100).r),
                          borderSide: BorderSide(color: Color(0xffEBEEF2))),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100).r),
                          borderSide: BorderSide(color: Color(0xffEBEEF2))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100).r),
                          borderSide: BorderSide(color: Color(0xffEBEEF2))),
                      hintText: 'Gender',
                      hintStyle: GoogleFonts.sourceSansPro(
                          color: Color(0xffDADEE3),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),

                    ),
                    items: items.map((e) => DropdownMenuItem(child: Text(e), value: e,)).toList(),
                    onChanged: (newValue){
                      value = newValue!;
                      setState(() {

                      });
                    },
                  ),
                ),
                20.verticalSpace,
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Date of Birth",
                      style: GoogleFonts.sourceSansPro(
                          color: Color(0xff2C3A4B),
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp)),
                  TextSpan(
                      text: "*",
                      style: GoogleFonts.sourceSansPro(
                          color: Color(0xffDA1414),
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp))
                ])),
                8.verticalSpace,
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Color(0xff5A6CEA).withOpacity(0.08),
                        blurRadius: 50,
                        offset: Offset(12, 26))
                  ]),
                  child: TextFormField(
                    controller: birthDate,
                    onChanged: (s){
                      isBirthDateEmpty = false;
                      setState(() {

                      });
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100).r),
                          borderSide: BorderSide(color: Color(0xffEBEEF2))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100).r),
                          borderSide: BorderSide(color: Color(0xffEBEEF2))),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100).r),
                          borderSide: BorderSide(color: Color(0xffEBEEF2))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100).r),
                          borderSide: BorderSide(color: Color(0xffEBEEF2))),
                      hintText: 'dd/mm/yyyy',
                      hintStyle: GoogleFonts.sourceSansPro(
                          color: Color(0xffDADEE3),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_month),
                        onPressed: (){
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now().subtract(Duration(days:50*365)),
                            lastDate: DateTime.now().add(Duration(days:50*365))).then((value){
                              dateText = DateFormat("MMMM dd, yyyy").format(value ?? DateTime.now());
                              birthDate.text = dateText;
                              setState(() {});
                          });
                        },
                      )
                    ),

                  ),
                ),
                isBirthDateEmpty ? Container(
                  margin: EdgeInsets.only(top:8),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 33.r,
                  decoration: BoxDecoration(
                      color: Color(0xffEBEEF2),
                      borderRadius:
                      BorderRadius.all(Radius.circular(8.r))),
                  child: Row(
                    children: [
                      Container(
                        height: 16.r,
                        width: 16.r,
                        decoration: BoxDecoration(
                            color: Color(0xff394452),
                            shape: BoxShape.circle),
                        child: Center(
                            child: Text(
                              "!",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      5.horizontalSpace,
                      Text(
                        "Enter your date of birth",
                        style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff394452)),
                      )
                    ],
                  ),
                )
                    : SizedBox.shrink(),
                20.verticalSpace,
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Address",
                      style: GoogleFonts.sourceSansPro(
                          color: Color(0xff2C3A4B),
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp)),
                  TextSpan(
                      text: "*",
                      style: GoogleFonts.sourceSansPro(
                          color: Color(0xffDA1414),
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp))
                ])),
                8.verticalSpace,
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Color(0xff5A6CEA).withOpacity(0.08),
                        blurRadius: 50,
                        offset: Offset(12, 26))
                  ]),
                  child: TextFormField(
                    controller: address,
                    onChanged: (s){
                      isAddressEmpty = false;
                      setState(() {});
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100).r),
                          borderSide: BorderSide(color: Color(0xffEBEEF2))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100).r),
                          borderSide: BorderSide(color: Color(0xffEBEEF2))),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100).r),
                          borderSide: BorderSide(color: Color(0xffEBEEF2))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100).r),
                          borderSide: BorderSide(color: Color(0xffEBEEF2))),
                      hintText: 'Address',
                      hintStyle: GoogleFonts.sourceSansPro(
                          color: Color(0xffDADEE3),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                  ),
                ),
                isAddressEmpty ? Container(
                  margin: EdgeInsets.only(top:8),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 33.r,
                  decoration: BoxDecoration(
                      color: Color(0xffEBEEF2),
                      borderRadius:
                      BorderRadius.all(Radius.circular(8.r))),
                  child: Row(
                    children: [
                      Container(
                        height: 16.r,
                        width: 16.r,
                        decoration: BoxDecoration(
                            color: Color(0xff394452),
                            shape: BoxShape.circle),
                        child: Center(
                            child: Text(
                              "!",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      5.horizontalSpace,
                      Text(
                        "Enter your address",
                        style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff394452)),
                      )
                    ],
                  ),
                )
                    : SizedBox.shrink(),
                20.verticalSpace,
                InkWell(
                  onTap: () async {
                    if(fullName.text.isNotEmpty && nickName.text.isNotEmpty && phoneNumber.text.isNotEmpty && birthDate.text.isNotEmpty && address.text.isNotEmpty){
                      UserModel user = UserModel(name: fullName.text, nickname: nickName.text, phone: phoneNumber.text, address: address.text);
                      SharedPreferences local = await SharedPreferences.getInstance();
                      local.setString("user", jsonEncode(user.toJson()));
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=> PaymentScreen()));
                    }
                    else if (fullName.text.isEmpty) {
                      isFullNameEmpty = true;
                      setState(() {});
                    } else if(nickName.text.isEmpty){
                      isNickNameEmpty = true;
                      setState(() {});
                    }
                    else if (phoneNumber.text.isEmpty) {
                      isPhoneNumberEmpty = true;
                      setState(() {});
                    } else if(birthDate.text.isEmpty){
                      isBirthDateEmpty = true;
                      setState(() {});
                    }
                    else{
                      isAddressEmpty = true;
                      setState(() {

                      });
                    }
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
          ),
        ));
  }
}
