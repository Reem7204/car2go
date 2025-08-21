import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Rentingdetails extends StatefulWidget {
  const Rentingdetails({super.key, required this.Vehiclename, required this.Vehicleimg, required this.VehicleColors, required this.vprice});
  final String Vehiclename;
  final String Vehicleimg;
  final String VehicleColors;
  final String vprice;

  @override
  State<Rentingdetails> createState() => _RentingdetailsState();
}

class _RentingdetailsState extends State<Rentingdetails> {
  DateTime? selectedDate;
  DateTime? selectedReturnDate;

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _pickReturnDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedReturnDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedReturnDate) {
      setState(() {
        selectedReturnDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        title: Text(
          'Renting Details',
          style: TextStyle(
            color: const Color(0xFFF7F5F2),
            fontFamily: 'SF Pro Display',
            letterSpacing: 0.24,
          ),
        ),
        actions: [],
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Container(
                width: 380.w,
                height: 123.h,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.35, -0.29),
                    end: Alignment(0.55, 1.70),
                    colors: [Colors.black, Colors.white.withValues(alpha: 0)],
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: const Color(0xFF58606A)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10.w,),
                    Container(
                      width: 127.w,
                      height: 102.h,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.Vehicleimg),
                          // image: NetworkImage(widget.Vehicleimg),
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ),
                    SizedBox(width: 27.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h,),
                        Text(
                          widget.Vehiclename,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFF7F5F2),
                            fontSize: 20.sp,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          widget.VehicleColors,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF627487),
                            fontSize: 16.sp,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '${widget.vprice}\$/Day',
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
              ),
              SizedBox(height: 42.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Row(
                  children: [
                    Icon(Icons.calendar_today_outlined, color: Colors.white,),
                    SizedBox(width: 10.w),
                    Text(
                      'Select Date',
                      style: TextStyle(
                        color: const Color(0xFFF7F5F2),
                        fontSize: 16.sp,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 23.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _pickDate(context);
                      },
                      child: Container(
                        width: 148.w,
                        height: 80.h,
                        child: Column(
                          children: [
                            Container(
                              width: 148.w,
                              height: 55.h,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    color: const Color(0xFF627487),
                                  ),
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  selectedDate != null
                                      ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                                      : "dd/mm/yyyy",
                                  style: TextStyle(
                                    color: const Color(0xFF627487),
                                    fontSize: 16.sp,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Pickup Date',
                                  style: TextStyle(
                                    color: const Color(0xFF627487),
                                    fontSize: 14.sp,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w,),
                    Icon(
                      Icons.arrow_right_alt_sharp,
                      color: const Color(0xFF627487),
                    ),
                    SizedBox(width: 12.w,),
                    GestureDetector(
                      onTap: () {
                        _pickReturnDate(context);
                      },
                      child: Container(
                        height: 80.h,
                        width: 148.w,
                        child: Column(
                          children: [
                            Container(
                              width: 148.w,
                              height: 55.h,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    color: const Color(0xFF627487),
                                  ),
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  selectedReturnDate != null
                                      ? "${selectedReturnDate!.day}/${selectedReturnDate!.month}/${selectedReturnDate!.year}"
                                      : "dd/mm/yyyy",
                                  style: TextStyle(
                                    color: const Color(0xFF627487),
                                    fontSize: 16.sp,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Return Date',
                                  style: TextStyle(
                                    color: const Color(0xFF627487),
                                    fontSize: 14.sp,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 44.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Row(
                  children: [
                    Icon(Icons.location_on_outlined,color: Colors.white,),
                    SizedBox(width: 10.w),
                    Text(
                      'Select Location',
                      style: TextStyle(
                        color: const Color(0xFFF7F5F2),
                        fontSize: 16.sp,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22.h,),
              Container(
                width: 352.w,
                        height: 80.h,
                        child: Column(
              children: [
                Container(
                    width: 352.w,
                    height: 55.h,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: const Color(0xFF627487),
                        ),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Text(
                      'Type your location or search in map',
                      style: TextStyle(
                        color: const Color(0xFF627487),
                        fontSize: 16.sp,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                      ),
                                      ),
                                      Spacer(),
                                      Center(child: Icon(Icons.location_searching_outlined,color: const Color(0xFF627487),))
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Pickup location',
                        style: TextStyle(
                          color: const Color(0xFF627487),
                          fontSize: 14.sp,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
              ],
                        ),
              ),
              SizedBox(
                height: 26.h,
              ),
              Container(
                width: 352.w,
                        height: 80.h,
                        child: Column(
              children: [
                Container(
                    width: 352.w,
                    height: 55.h,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: const Color(0xFF627487),
                        ),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Text(
                      'Type your location or search in map',
                      style: TextStyle(
                        color: const Color(0xFF627487),
                        fontSize: 16.sp,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                      ),
                                      ),
                                      Spacer(),
                                      Center(child: Icon(Icons.location_searching_outlined,color: const Color(0xFF627487),))
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Return location',
                        style: TextStyle(
                          color: const Color(0xFF627487),
                          fontSize: 14.sp,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
              ],
                        ),
              ),
              SizedBox(height: 43.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Row(
                  children: [
                    Icon(Icons.payment_sharp,color: Colors.white,),
                    SizedBox(width: 10.w),
                    Text(
                      'Payment Method',
                      style: TextStyle(
                        color: const Color(0xFFF7F5F2),
                        fontSize: 16.sp,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.h,),
              Container(
                      width: 352.w,
                      height: 55.h,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: const Color(0xFF627487),
                          ),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Icon(Icons.payments_outlined,color: const Color(0xFF627487),),
                            SizedBox(width: 12.w,),
                            Text(
                        '**** **** ***5 6324',
                        style: TextStyle(
                          color: const Color(0xFF627487),
                          fontSize: 16.sp,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                        ),
                                        ),
                                        
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 14.h,),
              Container(
                      width: 352.w,
                      height: 55.h,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: const Color(0xFF627487),
                          ),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Icon(Icons.payments_outlined,color: const Color(0xFF627487),),
                            SizedBox(width: 12.w,),
                            Text(
                        'Cash',
                        style: TextStyle(
                          color: const Color(0xFF627487),
                          fontSize: 16.sp,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                        ),
                                        ),
                                        
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
