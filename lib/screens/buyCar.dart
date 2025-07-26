import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Buycar extends StatefulWidget {
  const Buycar({super.key});

  @override
  State<Buycar> createState() => _BuycarState();
}

class _BuycarState extends State<Buycar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        backgroundColor: Colors.black,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                            
                            width: 230.w,
                            height: 48.h,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0.35, -0.29),
                                end: Alignment(0.55, 1.70),
                                colors: [Colors.black, Colors.grey.withValues(alpha: 0)],
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
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(Icons.search,color: Colors.white,),
                                  ),
                                  
                                  hintText: 'Search your dream car..'
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w,),
                    Container(
                        width: 40.w,
                        height: 40.h,
                        clipBehavior: Clip.none,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20.r) 
                        ),
                        child: Icon(Icons.display_settings_outlined,color: Colors.white,),
                      ),
                      SizedBox(width: 7.w,),
                    Container(
                        width: 40.w,
                        height: 40.h,
                        clipBehavior: Clip.none,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r) 
                        ),
                        child: Icon(Icons.notifications_none_outlined,color: Colors.black,),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                Container(
                  width: double.infinity,
                  height: 78.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                        width: 75.w,
                        height: 60.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF3F3F3),
                          shape: OvalBorder(),
                        ),
                                        ),
                      );
                    },),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                  'Latest Model ',
                  style: TextStyle(
                    color: const Color(0xFFF7F5F2),
                    fontSize: 22.sp,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                        'View all',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFFF7F5F2),
                          fontSize: 15.sp,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
              childCount: 6,
              (context, index){
                return Container(
                        width: 185.w,
                        height: 223.h,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          // gradient: LinearGradient(
                          //   begin: Alignment(0.35, -0.29),
                          //   end: Alignment(0.55, 1.70),
                          //   colors: [Colors.white, Colors.white.withValues(alpha: 0)],
                          // ),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: const Color(0xFF58606A),
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      );
              }
            ), 
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 185 / 223
                  )),)
        ],
      ),
    );
  }
}