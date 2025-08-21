import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final List<Map<String, dynamic>> carBrand = [
    {'label': 'Toyota', 'image': 'assets/toyota.png'},
    {'label': 'Nissan', 'image': 'assets/nissan.png'},
    {'label': 'Lexus', 'image': 'assets/lexus.png'},
    {'label': 'Benz', 'image': 'assets/benz.png'},
    {'label': 'Ford', 'image': 'assets/ford.png'},
    {'label': 'BMW', 'image': 'assets/bmw.png'},
  ];
  final List<Map<String, dynamic>> carLifeStyle = [
    {'label': 'Premium Cars', 'image': 'assets/premiumcar.jpg'},
    {'label': 'Budget Cars', 'image': 'assets/budgetcar.jpg'},
    {'label': 'Classic', 'image': 'assets/classic.jpg'},
    {'label': 'Convertable', 'image': 'assets/convertablecar.jpg'},
    {'label': 'Family Cars', 'image': 'assets/familycar.jpg'},
    {'label': 'Less driven', 'image': 'assets/lessdriven.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  SizedBox(height: 94.h,),
                  Row(
                    children: [
                      
                      Text(
                        'location',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFFF7F5F2),
                          fontSize: 20.sp,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Malappuram , Kerala',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFFF7F5F2),
                          fontSize: 20.sp,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 19.h),
                  Row(
                    children: [
                      Container(
                        width: 300.w,
                        height: 48.h,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.35, -0.29),
                            end: Alignment(0.55, 1.70),
                            colors: [
                              Colors.black,
                              Colors.grey.withValues(alpha: 0),
                            ],
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
                          child: TextFormField(
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),

                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.search, color: Colors.white),

                              hintText: 'What are you looking for',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    children: [
                      Text(
                        'Browse by brands',
                        style: TextStyle(
                          color: const Color(0xFFF7F5F2),
                          fontSize: 22.sp,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    width: double.infinity,
                    height: 78.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: carBrand.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            width: 78.w,
                            height: 78.h,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF3F3F3),
                              shape: OvalBorder(),
                            ),
                            child: Center(child: Image.asset(carBrand[index]['image'], width: 44.w,height: 36.h,fit: BoxFit.contain,)),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 35.h),
                  Row(
                    children: [
                      Text(
                        'Browse by lifesyle',
                        style: TextStyle(
                          color: const Color(0xFFF7F5F2),
                          fontSize: 22.sp,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(childCount: 6, (
                context,
                index,
              ) {
                return Container(
                  width: 186.w,
                  height: 128.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    // gradient: LinearGradient(
                    //   begin: Alignment(0.35, -0.29),
                    //   end: Alignment(0.55, 1.70),
                    //   colors: [Colors.white, Colors.white.withValues(alpha: 0)],
                    // ),
                    image: DecorationImage(image: AssetImage(carLifeStyle[index]['image']),fit: BoxFit.fill),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: const Color(0xFF58606A),
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Image.asset(
                      //   carLifeStyle[index]['image'],
                      //   height: 148.h,
                      //   // width: 186.w,
                      //   fit: BoxFit.fill,
                      // ),
                      Positioned(
                        top: 60,
                        left: 5,
                        child: SafeArea(
                          child: Text(
                            carLifeStyle[index]['label'],
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.black12,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: 5,
                        child: SafeArea(
                          child: Text(
                            '144 Vehicles',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                              backgroundColor: Colors.black12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 185 / 150,
              ),
            ),
          ),
          SliverToBoxAdapter(
      child: SizedBox(height: 100.h),
    ),
        ],
      ),
    );
  }
}
