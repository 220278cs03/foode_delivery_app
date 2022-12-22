import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/home_page_model/popular_menu.dart';
import '../model/home_page_model/popular_restaurant.dart';
import '../model/user_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentIndex = 0;
  List<String> list = ["Home", "Basket", "Message", "Account"];
  String name = '';

  Future<void> getInfo() async {
    SharedPreferences _local = await SharedPreferences.getInstance();
    String userLocal = _local.getString("user") ?? "";
    UserModel newUser = UserModel.fromJson(jsonDecode(userLocal));
    setState(() {});
    name = newUser.name ?? "";
  }

  List<PopularMenu> listOfPopularMenu = [
    
  ];

  List<PopularRestaurant> listOfPopularRestaurant = [
    PopularRestaurant(image: 'assets/image/popular_restaurant_1.png', name: "Lovy Food", time: '10 mins'),
    PopularRestaurant(image: 'assets/image/cloudy_resto.png', name: "Cloudy Resto", time: '14 mims'),
    PopularRestaurant(image: 'assets/image/circlo_resto.png', name: "Circlo Resto", time: '11 mins'),
    PopularRestaurant(image: 'assets/image/haty_food.png', name: 'Haty Food', time: "16 mins"),
    PopularRestaurant(image: 'assets/image/hearthy_resto.png', name: "Hearthy Resto", time: '18 mins'),
    PopularRestaurant(image: "assets/image/recto_food.png", name: 'Recto Food', time: '15 mins')
  ];

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image/splash_screen.png'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 34),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 36.h,
                      width: 36.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(32.r)),
                          image: DecorationImage(
                              image: AssetImage("assets/image/foode_logo.png"),
                              fit: BoxFit.cover)),
                    ),
                    24.horizontalSpace,
                    Text(
                      "Hello, $name !",
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff09101D)),
                    ),
                    Spacer(),
                    Container(
                      height: 44.h,
                      width: 44.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12.r)),
                          color: Color(0xffF6F8FB),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 50,
                                color: Color(0xff5A6CEA).withOpacity(0.08))
                          ]),
                      child: Center(
                          child: Icon(
                        Icons.notifications_active,
                        color: Color(0xffF43F5E),
                      )),
                    ),
                  ],
                ),
                34.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 316.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 50,
                                offset: Offset(12, 26),
                                color: Color(0xff5A6CEA).withOpacity(0.08))
                          ]),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            filled: true,
                            fillColor: Color(0xffF4F6F9),
                            hintText: "Search",
                            hintStyle: GoogleFonts.sourceSansPro(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xff09101D)),
                            suffixIcon:
                                Icon(Icons.search, color: Color(0xff858C94)),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 9)),
                      ),
                    ),
                    Container(
                      height: 44.h,
                      width: 44.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12.r)),
                          color: Color(0xffF43F5E).withOpacity(0.1),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 50,
                                color: Color(0xff5A6CEA).withOpacity(0.08))
                          ]),
                      child: Center(
                          child: Icon(
                        Icons.filter_list,
                        color: Color(0xffF43F5E),
                      )),
                    ),
                  ],
                ),
                32.verticalSpace,
                SizedBox(
                  height: 180.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 180.h,
                          width: 380.w,
                          padding:
                              EdgeInsets.only(top: 30, bottom: 14, right: 24),
                          margin: EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xffFF7E95),
                                Color(0xffFF1843),
                              ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24))),
                          child: Row(
                            children: [
                              Container(
                                  height: 151.h,
                                  width: 166.w,
                                  child: Image(
                                    image: AssetImage(
                                        'assets/image/hamburger.png'),
                                    fit: BoxFit.cover,
                                  )),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Special Deal for",
                                    style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 23,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "December",
                                    style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 23,
                                        color: Colors.white),
                                  ),
                                  12.verticalSpace,
                                  Container(
                                    height: 37,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(32)),
                                        color: Color(0xffFFB800)),
                                    child: Center(
                                      child: Text(
                                        "Buy Now",
                                        style: GoogleFonts.sourceSansPro(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                ),
                32.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular restaurant",
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Text(
                      "See all",
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffF43F5E)),
                    ),
                  ],
                ),
                32.verticalSpace,
                SizedBox(
                  height: 184,
                  child: ListView.builder(
                    itemCount: listOfPopularRestaurant.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 184.h,
                          width: 160.w,
                          margin: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 50,
                                  offset: Offset(12, 26),
                                  color: Color(0xff5A6CEA).withOpacity(0.08),
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 80.h,
                                  width: 80.w,
                                  child: Image(
                                      image: AssetImage("${listOfPopularRestaurant[index].image}")),
                                ),
                                Text(
                                 "${listOfPopularRestaurant[index].name}",
                                  style: GoogleFonts.sourceSansPro(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Color(0xff09101D)),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                    ("${listOfPopularRestaurant[index].time}"),
                                  style: GoogleFonts.sourceSansPro(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xff858C94)),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                32.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular menu",
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Text(
                      "See all",
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffF43F5E)),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.only(top: 32),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 88.h,
                          margin: EdgeInsets.only(bottom: 32),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 50,
                                  offset: Offset(12, 26),
                                  color: Color(0xff5A6CEA).withOpacity(0.08),
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 12, bottom: 12, left: 12, right: 22),
                            child: Row(
                              children: [
                                Image(
                                    image: AssetImage(
                                        "assets/image/poplular_menu.png")),
                                20.horizontalSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Fresh Salad",
                                      style: GoogleFonts.sourceSansPro(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Color(0xff09101D)),
                                    ),
                                    4.verticalSpace,
                                    Text(
                                      "Cloudy Resto",
                                      style: GoogleFonts.sourceSansPro(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xff858C94)),
                                    )
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  "\$8",
                                  style: GoogleFonts.sourceSansPro(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 29,
                                      color: Color(0xffF43F5E)),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.h),
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 50, color: Color(0xff5A6CEA).withOpacity(0.08)),
              ],
              border: Border.all(color: Color(0xffF4F6F9)),
              color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int index = 0; index < list.length; index++)
                AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12.r)),
                        color: currentIndex == index
                            ? Color(0xffF43F5E).withOpacity(0.1)
                            : Colors.transparent),
                    padding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 9.5.h),
                    child: currentIndex == index
                        ? Row(
                            children: [
                              Container(
                                height: 24,
                                width: 24,
                                child: Image(
                                  image: AssetImage(
                                      "assets/image/${list[index]}.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              12.horizontalSpace,
                              SizedBox(
                                width: 44.w,
                                child: Text(
                                  list[index],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.sourceSansPro(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffFF1843)),
                                ),
                              )
                            ],
                          )
                        : GestureDetector(
                            onTap: () {
                              currentIndex = index;
                              setState(() {});
                            },
                            child: Container(
                              height: 24,
                              width: 24,
                              child: Image(
                                image: AssetImage(
                                    "assets/image/${list[index]}.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))
            ],
          ),
        ),
      ),
    );
  }
}
