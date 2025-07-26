import 'package:car2go/screens/uploadMedia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Price extends StatefulWidget {
  const Price({super.key});

  @override
  State<Price> createState() => _PriceState();
}

class _PriceState extends State<Price> {
  bool isToggled = false;
  double _price = 5000;
  double _km = 10;
  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("#,###", "en_US");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Price',
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
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                'Enable price range',
                style: TextStyle(
                  color: const Color(0xFF000B17),
                  fontSize: 18.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
                        ),
                        Switch(
                          activeColor: Colors.amber,
                          inactiveTrackColor: Colors.white,
            value: isToggled,
            onChanged: (value) {
              setState(() {
                isToggled = value;
              });
            },
          ),
              ],
            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Text(
                          'Set your price',
                          style: TextStyle(
                color: const Color(0xFF000B17),
                fontSize: 16.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                          ),
                        ),
              ],
            ),
            SizedBox(height: 10.h,),
            Container(
                  width: 351.w,
                  height: 107.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: const Color(0xFFB5B1B1),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Column(
                    
                    children: [
                      SizedBox(height: 10.h,),
                      Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.edit, color: Colors.amber, size: 18.sp),
              SizedBox(width: 6.w),
              Text(
                '${formatter.format(_price.toInt())} AED',
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Slider
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.amber,
              inactiveTrackColor: Colors.grey.shade300,
              thumbColor: Colors.black,
              overlayColor: Colors.black.withOpacity(0.1),
              trackHeight: 3,
            ),
            child: Slider(
              value: _price,
              min: 1,
              max: 999000,
              divisions: 1000,
              onChanged: (value) {
                setState(() {
                  _price = value;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('1 AED', style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                Text('999,000 AED', style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
              ],
            ),
          ),
                    ],
                  )
  
                ),
          SizedBox(height: 20.h,),
            Row(
              children: [
                Text(
                          'Mileage',
                          style: TextStyle(
                color: const Color(0xFF000B17),
                fontSize: 16.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                          ),
                        ),
              ],
            ),
            SizedBox(height: 10.h,),
            Container(
                  width: 351.w,
                  height: 107.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: const Color(0xFFB5B1B1),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Column(
                    
                    children: [
                      SizedBox(height: 10.h,),
                      Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.edit, color: Colors.amber, size: 18.sp),
              SizedBox(width: 6.w),
              Text(
                '${formatter.format(_km.toInt())} KM',
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Slider
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.amber,
              inactiveTrackColor: Colors.grey.shade300,
              thumbColor: Colors.black,
              overlayColor: Colors.black.withOpacity(0.1),
              trackHeight: 3,
            ),
            child: Slider(
              value: _km,
              min: 1,
              max: 999000,
              divisions: 1000,
              onChanged: (value) {
                setState(() {
                  _km = value;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('1 KM', style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                Text('999,000 KM', style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
              ],
            ),
          ),
                    ],
                  )
  
                ),      
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Uploadmedia()));
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
                'Next',
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