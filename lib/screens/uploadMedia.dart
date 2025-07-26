import 'package:car2go/widgets/CustomTextField.dart';
import 'package:car2go/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Uploadmedia extends StatefulWidget {
  const Uploadmedia({super.key});

  @override
  State<Uploadmedia> createState() => _UploadmediaState();
}

class _UploadmediaState extends State<Uploadmedia> {
  TextEditingController colourController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload Media',
          style: TextStyle(
            // color: const Color(0xFFF7F5F2),
            fontSize: 24,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w600,
          ),
        ),
        // backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                width: 120.w,
                height: 100.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: const Color(0xFFB5B1B1),
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Icon(Icons.camera_alt,color: Colors.grey,size: 70.sp,),
                          ),
              ),
              Center(
                child: Text(
                          'Upload Photos',
                          style: TextStyle(
                color: const Color(0xFF000B17),
                fontSize: 10.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                          ),
                        ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Text(
                    'Description',
                      style: TextStyle(
                        color: const Color(0xFF000B17),
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              Customtext(hintValue: 'Write a description',),
              SizedBox(height: 26.h,),
              Row(
                children: [
                  Text(
                    'Vehicle color',
                      style: TextStyle(
                        color: const Color(0xFF000B17),
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              Customtext(hintValue: 'Enter your colour',),
              SizedBox(height: 26.h,),
              Row(
                children: [
                  Text(
                    'Gear Type',
                      style: TextStyle(
                        color: const Color(0xFF000B17),
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              Customtext(hintValue: 'Enter your gear type',),
              SizedBox(height: 20.h,),
              Row(
                children: [
                  Text(
                    'Fuel Type',
                      style: TextStyle(
                        color: const Color(0xFF000B17),
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              Customtext(hintValue: 'Enter your fuel type',),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GestureDetector(
          onTap: () {
            
          },
          child: Container(
            width: 347.w,
            height: 56.h,
            decoration: ShapeDecoration(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
              ),
            ),
            child: Center(
              child: Text(
                'Submit',
                style: TextStyle(
                  color: const Color(0xFFF7F5F2),
                  fontSize: 20.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}