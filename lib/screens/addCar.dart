import 'package:car2go/screens/rentVehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Addcar extends StatefulWidget {
  const Addcar({super.key});

  @override
  State<Addcar> createState() => _AddcarState();
}

class _AddcarState extends State<Addcar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose Category',
          style: TextStyle(
            color: const Color(0xFFF7F5F2),
            fontSize: 24,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Rentvehicle()));
                },
                child: Container(
                      width: 364.w,
                      height: 94.h,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.35, -0.29),
                          end: Alignment(0.55, 1.70),
                          colors: [Colors.black, Colors.white.withValues(alpha: 0)],
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: const Color(0xFF58606A),
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(width: 29.w,),
                            Icon(Icons.car_rental,color: Colors.amber,size: 35.sp,),
                            SizedBox(width: 25.w,),
                            Text(
                      'Sell Your Car',
                      style: TextStyle(
                        color: const Color(0xFFF7F5F2),
                        fontSize: 20.sp,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    
                          ],
                        ),
                      ),
                    ),
              ),
            ),
            SizedBox(height: 20.h,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Rentvehicle()));
                    },
                    child: Container(
                      width: 364.w,
                      height: 94.h,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.35, -0.29),
                          end: Alignment(0.55, 1.70),
                          colors: [Colors.black, Colors.black.withValues(alpha: 0)],
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: const Color(0xFF58606A),
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(width: 29.w,),
                            Icon(Icons.handshake_rounded,color: Colors.amber,size: 35.sp),
                            SizedBox(width: 25.w,),
                            Text(
                      'Rent Your Car',
                      style: TextStyle(
                        color: const Color(0xFFF7F5F2),
                        fontSize: 20.sp,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}