import 'package:fast_food_app/pages/fill_bio_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController =
  TextEditingController(); // to check either if it's empty
  TextEditingController passwordController = TextEditingController();

  bool isHide = false; //visibility

  bool isEmailIncorrect = false; // access to enter
  bool isPasswordIncorrect = false;

  bool isEmailEmpty = false; // to check either if it's empty
  bool isPasswordEmpty = false;

  bool isPasswordValidate = false; // to check is there 8 elements

  bool isCheckBox = false; // For using Checkbox

  String email = 'hello@gmail.com'; // Valid email & password
  String password = '12345678';

  //everytime  when you use controllers do not forget to dispose them
  // because they will work infinetely
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                68.verticalSpace,
                Image(
                    image: AssetImage('assets/image/logo_sign_in_screen.png')),
                18.verticalSpace,
                Text(
                  "Sign in to your account",
                  style: GoogleFonts.sourceSansPro(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff09101D)),
                ),
                32.verticalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Email",
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
                    ),
                    8.verticalSpace,
                    TextFormField(
                      onChanged: (s) {
                        isEmailEmpty = false;
                        isEmailIncorrect = false;
                        setState(() {});
                      },
                      controller: emailController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius
                                .circular(100)
                                .r),
                            borderSide: BorderSide(color: Color(0xffEBEEF2))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius
                                .circular(100)
                                .r),
                            borderSide: BorderSide(color: Color(0xffEBEEF2))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius
                                .circular(100)
                                .r),
                            borderSide: BorderSide(color: Color(0xffEBEEF2))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius
                                .circular(100)
                                .r),
                            borderSide: BorderSide(color: Color(0xffEBEEF2))),
                        hintText: 'Email or Phone Number',
                        hintStyle: GoogleFonts.sourceSansPro(
                            color: Color(0xffDADEE3),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                    ),
                    isEmailEmpty
                        ? Container(
                      margin: EdgeInsets.only(top:8),
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
                            "Enter your email",
                            style: GoogleFonts.sourceSansPro(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xff394452)),
                          )
                        ],
                      ),
                    )
                        : SizedBox.shrink(),
                    isEmailIncorrect
                        ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        margin: EdgeInsets.only(top:8),
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
                              Text("Invalid email",
                                  style: GoogleFonts.sourceSansPro(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xff394452)))
                            ])) : SizedBox.shrink(),
                    20.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Password",
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
                    ),
                    8.verticalSpace,
                    TextFormField(
                      controller: passwordController,
                      obscureText: !isHide,
                      cursorColor: Colors.black,
                      onChanged: (s) {
                        isPasswordEmpty = false;
                        isPasswordIncorrect = false;
                        setState(() {});
                      },
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius
                                  .circular(100)
                                  .r),
                              borderSide: BorderSide(color: Color(0xffEBEEF2))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius
                                  .circular(100)
                                  .r),
                              borderSide: BorderSide(color: Color(0xffEBEEF2))),
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius
                                  .circular(100)
                                  .r),
                              borderSide: BorderSide(color: Color(0xffEBEEF2))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius
                                  .circular(100)
                                  .r),
                              borderSide: BorderSide(color: Color(0xffEBEEF2))),
                          hintText: 'Password',
                          hintStyle: GoogleFonts.sourceSansPro(
                              color: Color(0xffDADEE3),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          suffixIcon: IconButton(
                              onPressed: () {
                                isHide = !isHide;
                                setState(() {});
                              },
                              icon: Icon(isHide
                                  ? Icons.visibility_off
                                  : Icons.visibility))),
                    ),
                    isPasswordEmpty
                        ? Container(
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
                                child: Text("!",
                                    style: TextStyle(color: Colors.white))),
                          ),
                          5.horizontalSpace,
                          isPasswordIncorrect
                              ? Text("Invalid passwordl",
                              style: GoogleFonts.sourceSansPro(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xff394452)))
                              : Text(
                            "Enter your password",
                            style: GoogleFonts.sourceSansPro(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xff394452)),
                          )
                        ],
                      ),
                    )
                        : SizedBox.shrink(),
                    22.5.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              isCheckBox = !isCheckBox;
                              setState(() {});
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              width: 16.w,
                              height: 16.h,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(4.r)),
                                  color:
                                  isCheckBox ? Colors.white : Color(0xffF43F5E),
                                  border: Border.all(color: Color(0xffF43F5E))),
                              child: Icon(
                                Icons.done,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          12.horizontalSpace,
                          Text(
                            "Remember me",
                            style: GoogleFonts.sourceSansPro(
                                color: Color(0xff2C3A4B),
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp),
                          )
                        ],
                      ),
                    ),
                    20.verticalSpace,
                    InkWell(
                      onTap: () async {
                        if (emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          if (emailController.text != email) {
                            isEmailIncorrect = true;
                            setState(() {});
                          }

                          if (passwordController.text.length <= 8) {
                            isPasswordValidate = true;
                            setState(() {});
                          } else if (passwordController.text != password) {
                            isPasswordIncorrect = true;
                            setState(() {});
                          }
                          if (passwordController.text == password &&
                              emailController.text == email) {
                            SharedPreferences _store = await SharedPreferences.getInstance();
                            _store.setString("name", emailController.text);
                            _store.setString("last_name", passwordController.text);
                            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>FillBioScreen()));
                            setState(() {});
                          }
                        } else if (emailController.text.isEmpty) {
                          isEmailEmpty = true;
                          setState(() {});
                        } else {
                          isPasswordEmpty = true;
                          setState(() {});
                        }
                      },
                      child: Center(
                        child: Container(
                          height: 55.r,
                          width: 380.r,
                          decoration: BoxDecoration(
                              color: Color(0xffF43F5E).withOpacity(0.5),
                              borderRadius:
                              BorderRadius.all(Radius.circular(32.r))),
                          child: Center(
                              child: Text(
                                "Sign in",
                                style: GoogleFonts.sourceSansPro(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                Text("Forgot the password?",
                    style: GoogleFonts.sourceSansPro(
                        color: Color(0xffF43F5E),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600)),
                32.verticalSpace,
                Text("or continue with",
                    style: GoogleFonts.sourceSansPro(
                        color: Color(0xff09101D),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400)),
                24.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 178.r,
                      height: 57.r,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12.r)),
                          border: Border.all(color: Color(0xffF4F6F9))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              image: AssetImage(
                                  'assets/image/facebook_sign_in_screen.png')),
                          12.horizontalSpace,
                          Text("Facebook",
                              style: GoogleFonts.sourceSansPro(
                                  color: Color(0xff09101D),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    Container(
                      width: 178.r,
                      height: 57.r,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12.r)),
                          border: Border.all(color: Color(0xffF4F6F9))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              image: AssetImage(
                                  'assets/image/google_sign_in_screen.png')),
                          12.horizontalSpace,
                          Text("Google",
                              style: GoogleFonts.sourceSansPro(
                                  color: Color(0xff09101D),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
                32.verticalSpace,
                RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Don’t have an account?",
                          style: GoogleFonts.sourceSansPro(
                              color: Color(0xff858C94),
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp)),
                      TextSpan(
                          text: " Sign up",
                          style: GoogleFonts.sourceSansPro(
                              color: Color(0xffF43F5E),
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp))
                    ])),
              ],
            ),
          ),
        ));
  }
}
