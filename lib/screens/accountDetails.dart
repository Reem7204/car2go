import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Accountdetails extends StatefulWidget {
  const Accountdetails({super.key});

  @override
  State<Accountdetails> createState() => _AccountdetailsState();
}

class _AccountdetailsState extends State<Accountdetails> {
  List<String> settingsName = ['Account Settings','Request Verification','Edit Profile','Manage Outgoing Request','Language','Help','Feedback','Request a feature','Share this App'];
  List<IconData> settingsIcon = [Icons.settings,Icons.verified_outlined,Icons.edit_outlined,Icons.arrow_outward,Icons.language,Icons.help_outline_outlined,Icons.thumb_up_outlined,Icons.info_outline_rounded,Icons.share_outlined];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(onTap: () => Navigator.pop(context),child: Icon(Icons.arrow_back_ios_new)),
        actions: [
          Icon(Icons.more_vert_rounded)
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                    width: 320.w,
                    height: 82.h,
                    child: Row(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            
                            Container(
                        width: 74.w,
                        height: 74.h,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                        ),
                      ),
                      Positioned(
                        bottom: -5,
                        right: -5,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFFFCE50),
                            shape: OvalBorder(),
                          ),
                          child: Icon(Icons.edit,color: Colors.white,),
                        ),
                      ),
                      
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text(
                                    'James Robert',
                                    style: TextStyle(
                                      fontSize: 22.sp,
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Individual profile',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.35,
                                    ),
                                  ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height:10.h),
              Container(
                width: 370.w,
                height: (30 * settingsName.length.toDouble()).h,
                decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.80,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: const Color(0xFFD9D9D9),
              ),
            ),
          ),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 370.w,
                  height: 30.h,
                  decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.80,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: const Color(0xFFD9D9D9),
                ),
                            ),
                          ),
                          child: Row(
                            children: [
                Icon(settingsIcon[index]),
                SizedBox(width: 10.w,),
                Text(
                    settingsName[index],
                    style: TextStyle(
                      color: const Color(0xFF000B17),
                      fontSize: 15.sp,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                            ],
                          ),
                ),
              );
            },),
              )
            ],
          ),
        ),
      ),
    );
  }
}