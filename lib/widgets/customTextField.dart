import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customtext extends StatefulWidget {
  const Customtext({super.key, required this.hintValue});
  final String hintValue;
  @override
  State<Customtext> createState() => _CustomtextState();
}

class _CustomtextState extends State<Customtext> {
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
                  width: 353.w,
                  height: 44.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: const Color(0xFFB5B1B1),
                      ),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                  child: TextField(
                    controller: _textController,
                    cursorColor: Colors.grey,
                    
                    style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.sp,
                    fontFamily: 'Inter',
            fontWeight: FontWeight.w300,
                  ),
                    decoration: InputDecoration(
                      hintText: widget.hintValue,
                      hintStyle: TextStyle(
            color: const Color(0xFFB5B1B1),
            fontSize: 13.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w300,
          ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0 , horizontal: 20.0
                      ),
                      border: InputBorder.none,
                     
                    ),
                  ),
                );
  }
}