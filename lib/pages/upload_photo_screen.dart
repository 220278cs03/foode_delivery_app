import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'congarts_screen.dart';

class UploadPhotoScreen extends StatefulWidget {
  const UploadPhotoScreen({Key? key}) : super(key: key);

  @override
  State<UploadPhotoScreen> createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {

  final ImagePicker _image = ImagePicker();
  String imagePath ='';


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
                  Text("Upload your photo",
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
              imagePath.isEmpty ?
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical:23),
                    decoration: BoxDecoration(
                      color:Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff5A6CEA).withOpacity(0.08),
                            blurRadius: 50,
                            offset: Offset(12,26)
                        )
                      ],
                      border: Border.all(color: Color(0xffEBEEF2)),
                      borderRadius: BorderRadius.all(Radius.circular(20.r))
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () async{
                              _image.pickImage(source: ImageSource.camera).then((value) async {
                                if(value != null){
                                  CroppedFile? cropperImage = await ImageCropper().cropImage(sourcePath: value.path);
                                  imagePath = cropperImage?.path ?? "";
                                  setState(() {});
                                }
                              });
                              setState(() {});
                            },
                            child: Container(
                              height: 80.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                color: Color(0xffF43F5E).withOpacity(0.1),
                                shape: BoxShape.circle
                              ),
                              child: Image.asset('assets/image/camera_photo_screen.png'),
                            ),
                          ),
                          10.verticalSpace,
                          Text("Take photo", style: GoogleFonts.sourceSansPro(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xff09101D)),)
                        ],
                      ),
                    ),
                  ),
                  24.verticalSpace,
                  Container(
                    padding: EdgeInsets.symmetric(vertical:23),
                    decoration: BoxDecoration(
                        color:Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xff5A6CEA).withOpacity(0.08),
                              blurRadius: 50,
                              offset: Offset(12,26)
                          )
                        ],
                        border: Border.all(color: Color(0xffEBEEF2)),
                        borderRadius: BorderRadius.all(Radius.circular(20.r))
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () async{
                              _image.pickImage(source: ImageSource.gallery).then((value) async {
                                if(value != null){
                                  CroppedFile? cropperImage = await ImageCropper().cropImage(sourcePath: value.path);
                                  imagePath = cropperImage?.path ?? "";
                                  setState(() {});
                                }
                              });
                              setState(() {});
                            },
                            child: Container(
                              height: 80.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                  color: Color(0xffF43F5E).withOpacity(0.1),
                                  shape: BoxShape.circle
                              ),
                              child: Image.asset('assets/image/gallery_photo_screen.png'),
                            ),
                          ),
                          10.verticalSpace,
                          Text("From gallery", style: GoogleFonts.sourceSansPro(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xff09101D)),)
                        ],
                      ),
                    ),
                  )
                ],
              ) : SizedBox.shrink(),
              imagePath.isEmpty ? SizedBox.shrink() :
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          height: 250.h,
                          width: 250.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: FileImage(File(imagePath)), fit: BoxFit.cover)
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: (){
                                showDialog(context: context, builder: (context){
                                  return AlertDialog(
                                    title: Text("Edit your photo"),
                                    actions: [
                                      ElevatedButton(onPressed: ()async{
                                        _image.pickImage(source: ImageSource.camera).then((value) async {
                                          if(value!=null){
                                            CroppedFile? _cropperImage = await ImageCropper().cropImage(sourcePath: value.path);
                                            if(_cropperImage != null){
                                              imagePath = _cropperImage.path;
                                              setState(() {});
                                              Navigator.pop(context);
                                            }
                                          }
                                        });
                                      }, child: Text("Take photo")),

                                      ElevatedButton(onPressed: ()async{
                                        _image.pickImage(source: ImageSource.gallery).then((value) async {
                                          if(value!=null){
                                            CroppedFile? _cropperImage = await ImageCropper().cropImage(sourcePath: value.path);
                                            if(_cropperImage != null){
                                              imagePath = _cropperImage.path;
                                              setState(() {});
                                              Navigator.pop(context);
                                            }
                                          }
                                        });
                                      }, child: Text("Take file")),

                                      ElevatedButton(onPressed: (){
                                        imagePath = "";
                                        Navigator.pop(context);
                                        setState(() {});
                                      }, child: Text("Delete")),

                                      ElevatedButton(onPressed: (){
                                        Navigator.pop(context);
                                        setState(() {});
                                      }, child: Text("Cancel")),

                                    ],
                                  );
                                });
                              },
                              child: Container(
                          padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffF43F5E)
                                ),
                                child: Icon(Icons.edit, color: Colors.white,),
                        ),
                            ))
                      ],
                    ),
                  ),
              Spacer(),

              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => CongratsScreen()));
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
