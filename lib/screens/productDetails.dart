import 'dart:ui';

import 'package:car2go/screens/rentingDetails.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Productdetails extends StatefulWidget {
  const Productdetails({
    super.key,
    required this.rating,
    required this.seats,
    required this.doors,
    required this.price,
    required this.transmission,
    required this.vname,
    required this.img,
    required this.color,
    required this.id
  });
  final double rating;
  final String seats;
  final String doors;
  final int price;
  final String transmission;
  final String vname;
  final List<String> img;
  final String color;
  final String id;

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  bool isFavorited = false;
  // final List<String> imageUrls = [
  //   'https://images.pexels.com/photos/358070/pexels-photo-358070.jpeg',
  //   'https://images.pexels.com/photos/210019/pexels-photo-210019.jpeg',
  //   'https://images.pexels.com/photos/1391373/pexels-photo-1391373.jpeg',
  // ];

  List<IconData> cardetailIcons = [
    Icons.local_gas_station_sharp,
    Icons.cable_rounded,
    Icons.chair_alt_rounded,
    Icons.door_back_door,
    Icons.key_outlined,
    Icons.gas_meter_outlined,
  ];
  List<String> carDetailsItem = [
    'Tank size',
    'Gearbox',
    'Seats',
    'Door',
    'Owners',
    'Cylinder',
  ];
  late List<String> detailsValue = [];
  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();
  bool showAllDetails = false;
  @override
  void initState() {
    super.initState();
    detailsValue = [
      '74 liters',
      widget.transmission,
      widget.seats,
      widget.doors,
      '2',
      '2',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        title: Text(widget.vname, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10,10,10,0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.h),

              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.75,
                  aspectRatio: 1.5,
                  initialPage: 2,
                ),
                items:
                    widget.img.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(color: Colors.white),
                            child: 
                            // Image.network(widget.img),
                            Image.network(i,fit: BoxFit.fill,)
                          );
                        },
                      );
                    }).toList(),
              ),
              SizedBox(height: 39.h),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.vname,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFF7F5F2),
                            fontSize: 20.sp,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            isFavorited
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: isFavorited ? Colors.red : Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              isFavorited = !isFavorited;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16.sp),
                        SizedBox(width: 13.w),
                        Text(
                          '${widget.rating} Reviews',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFF7F5F2),
                            fontSize: 16.sp,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 39.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Car Details',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.sp,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showAllDetails = !showAllDetails;
                            });
                          },
                          child: Text(
                            showAllDetails ? 'less' : 'more',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF627487),
                              fontSize: 16.sp,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 23.h),
                    Container(
                      height: showAllDetails ? 210.h : 140.h,
                      // width: 360.w,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),   //prevent internal scroll
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 180 / 58,
                        ),
                        shrinkWrap: true, //tells GridView to take only as much height as needed.
                        itemCount: showAllDetails ? 6 : 4,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 180.w,
                            height: 58.h,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0.35, -0.29),
                                end: Alignment(0.55, 1.70),
                                colors: [
                                  Colors.black,
                                  Colors.white.withValues(alpha: 0),
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
                            child: Row(
                              children: [
                                SizedBox(width: 15.w),
                                Icon(
                                  cardetailIcons[index],
                                  size: 22.sp,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 6.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 7.h),
                                    Text(
                                      carDetailsItem[index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: const Color(0xFFA7B0BB),
                                        fontSize: 12.sp,
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      detailsValue[index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        Text(
                          'Car Overview',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.white,
                          size: 17.sp,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Registration Year',
                          style: TextStyle(
                            color: const Color(0xFFA7B0BB),
                            fontSize: 17.sp,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.50,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '2015',
                          style: TextStyle(
                            color: const Color(0xFFF7F5F2),
                            fontSize: 17.sp,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.50,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.security_sharp,
                          color: Colors.white,
                          size: 17.sp,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Insurance Validity',
                          style: TextStyle(
                            color: const Color(0xFFA7B0BB),
                            fontSize: 17.sp,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.50,
                          ),
                        ),
                        SizedBox(width: 91.w),
                        Flexible(
                          child: Text(
                            'Third Party Insurance',
                            style: TextStyle(
                              color: const Color(0xFFF7F5F2),
                              fontSize: 17.sp,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.50,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 90.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: 430.w,
            height: 99.h,
            decoration: ShapeDecoration(
              color: const Color(0x82C2C2C2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
              ),
            ),
            child: Row(
              children: [
                SizedBox(width: 49.w),
                Text(
                  '${widget.price}\$',
                  style: TextStyle(
                    color: const Color(0xFF000B17),
                    fontSize: 20.sp,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '/Day',
                  style: TextStyle(
                    color: const Color(0xFF000B17),
                    fontSize: 15.sp,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(width: 41.w),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => Rentingdetails(
                              Vehiclename: widget.vname,
                              Vehicleimg: widget.img[0], 
                              VehicleColors: widget.color, 
                              vprice: widget.price.toString(),
                              vid: widget.id.toString()
                            ),
                      ),
                    );
                  },
                  child: Container(
                    width: 213.w,
                    height: 50.h,
                    decoration: ShapeDecoration(
                      gradient: RadialGradient(
                        center: Alignment(0.42, -0.70),
                        radius: 2.03,
                        colors: [
                          const Color(0xFFD39906),
                          const Color(0xFFFFCE50),
                          const Color(0xFFD39906),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Rent Now',
                        style: TextStyle(
                          color: const Color(0xFFF7F5F2),
                          fontSize: 20.sp,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
