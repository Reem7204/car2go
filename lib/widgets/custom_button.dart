import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({super.key, required this.label, required this.controller, required this.type});
  final String label;
  final TextEditingController controller;
  final String type;
  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  late TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case 'email':
        keyboardType = TextInputType.emailAddress;
        break;
      case 'password':
        keyboardType = TextInputType.visiblePassword;
        break;  
      case 'phone':
        keyboardType = TextInputType.number;
        break;  
      case 'text':
      default:
        keyboardType = TextInputType.text;
        break;  
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
                    width: 350.w,
                    height: 50.h,
                    decoration: ShapeDecoration(
                      color: Colors.white.withValues(alpha: 0.18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: TextField(
                      controller: widget.controller,
                      cursorColor: Colors.white,
                      keyboardType: keyboardType,
                      
                      style: TextStyle(color: Colors.white,fontSize: 16.sp,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,),
                      decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            labelText: widget.label,
                            labelStyle: TextStyle(color: const Color(0xFFA7B0BB),fontSize: 16,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,),
                            border: InputBorder.none),
                    ),
                  ),
    );
  }
}