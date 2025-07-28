import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu,color: Colors.white,),
        backgroundColor: Colors.black,
        actions: [
          Icon(Icons.settings,color: Colors.white,),
          SizedBox(width: 23.sp,),
          Icon(Icons.notifications_none_outlined,color: Colors.white),
          SizedBox(width: 23.sp,),
          Icon(Icons.more_vert_rounded,color: Colors.white),
          SizedBox(width: 25.sp,)
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.r)),
                    ),
                    child: Icon(Icons.person,size: 50.sp,color: Colors.grey,),
                  ),
                  Positioned(
                    bottom: -5,
                    right: -5,
                    child: Container(
                      width: 27.w,
                      height: 27.h,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFFCE50),
                        shape: OvalBorder(),
                      ),
                      child: Icon(Icons.edit,color: Colors.white,),
                    ),
                  ),
                  
                      ],
                    ),
                    SizedBox(width: 21.w,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                                'James Robert',
                                style: TextStyle(
                                  color: const Color(0xFFF7F5F2),
                                  fontSize: 22.sp,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Individual profile',
                                style: TextStyle(
                                  color: const Color(0xFFA7B0BB),
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
            ),
          ),
          SliverPadding(padding: EdgeInsets.symmetric(horizontal: 12),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                            width: 391.w,
                            height: 100.h,
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
                            child: Row(
                              children: [
                                Container(
                            width: 134.w,
                            height: 100.h,
                            // color: Colors.white,
                            child: Image.asset('assets/budgetcar.jpg',height: 100.h,width: 134.w,fit: BoxFit.fill,),
                            // decoration: ShapeDecoration(
                            //   image: DecorationImage(
                            //     image: NetworkImage("https://placehold.co/134x121"),
                            //     fit: BoxFit.cover,
                            //   ),
                            //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                            // ),
                  
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                'Ford B-Max',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFFF7F5F2),
                                  fontSize: 16.sp,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'James Robert',
                                style: TextStyle(
                                  color: const Color(0xFFF7F5F2),
                                  fontSize: 15.sp,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '2022',
                                style: TextStyle(
                                  color: const Color(0xFFF7F5F2),
                                  fontSize: 12.sp,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                '1000 km',
                                style: TextStyle(
                                  color: const Color(0xFFF7F5F2),
                                  fontSize: 12.sp,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '\$5000 / day',
                                style: TextStyle(
                                  color: const Color(0xFFFFD66D),
                                  fontSize: 16.sp,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                                ],
                              )
                                ],
                              ),
                            ),
                          ),
                          
                              ],
                            ),
                          ),
                );
              }
            ), 
            ),)
        ],
      ),
    );
  }
}