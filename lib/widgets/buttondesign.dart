import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Buttondesign extends StatefulWidget {
  const Buttondesign({super.key, required this.text, required this.type});
  final String text;
  final String type;
  @override
  State<Buttondesign> createState() => _ButtondesignState();
}

class _ButtondesignState extends State<Buttondesign> {
  late Color backgroundColor;
  late Color textColor;
  @override
  
  Widget build(BuildContext context) {
    switch (widget.type) {
      case 'loginButton':
        backgroundColor = Colors.white;
        textColor = Colors.black;
        break;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
                    width: 350.w,
                    height: 50.h,
                    decoration: ShapeDecoration(
                      color: backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: Center(
                      child: Text(
                      widget.text,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 20.sp,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.20,
                      ),
                                      ),
                    ),
                  ),
    );
  }
}