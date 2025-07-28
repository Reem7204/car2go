import 'package:car2go/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 150.h), 
            Text(
              'Wheels You Needed',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32.sp,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Premium and prestige daily rental car, experience the thrill at a lower price.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF8493A3),
                fontSize: 16.sp,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w600,
                letterSpacing: 1.36,
              ),
            ),
            SizedBox(height: 200.h),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Login())),
              child: Container(
                    width: 332.w,
                    height: 64.h,
                    decoration: ShapeDecoration(
                      color: const Color(0xBC001024),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: const Color(0xFF001B39),
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Center(
                      child: Text(
                            'Let’s Go',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.70,
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
