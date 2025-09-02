import 'dart:ui';

import 'package:car2go/bloc/bloc/rent_cars_bloc.dart';
import 'package:car2go/bloc/bloc/rent_order_bloc.dart';
import 'package:car2go/model/rentOrder.dart';
import 'package:car2go/screens/bottomnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Rentingdetails extends StatefulWidget {
  const Rentingdetails({
    super.key,
    required this.Vehiclename,
    required this.Vehicleimg,
    required this.VehicleColors,
    required this.vprice,
    required this.vid,
  });
  final String Vehiclename;
  final String Vehicleimg;
  final String VehicleColors;
  final String vprice;
  final String vid;

  @override
  State<Rentingdetails> createState() => _RentingdetailsState();
}

class _RentingdetailsState extends State<Rentingdetails> {
  DateTime? selectedDate;
  DateTime? selectedReturnDate;
  late RentOrder rentOrder;
  TextEditingController pickUpLocation = TextEditingController();
  TextEditingController returnLocation = TextEditingController();

  final storage = FlutterSecureStorage();

  Future<String?> getLoginId() async {
    return await storage.read(key: 'login_id');
  }

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

  int getRentalDays() {
    if (selectedDate != null && selectedReturnDate != null) {
      return selectedReturnDate!.difference(selectedDate!).inDays;
    }
    return 0;
  }

  double getTotalPrice() {
    int days = getRentalDays();
    double pricePerDay = double.tryParse(widget.vprice) ?? 0;
    return days > 0 ? days * pricePerDay : 0;
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
                    SizedBox(width: 10.w),
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
                    SizedBox(width: 27.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h),
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
                    Icon(Icons.calendar_today_outlined, color: Colors.white),
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
              SizedBox(height: 23.h),
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
                            SizedBox(height: 5.h),
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
                    SizedBox(width: 12.w),
                    Icon(
                      Icons.arrow_right_alt_sharp,
                      color: const Color(0xFF627487),
                    ),
                    SizedBox(width: 12.w),
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
                            SizedBox(height: 5.h),
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
              SizedBox(height: 44.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Row(
                  children: [
                    Icon(Icons.location_on_outlined, color: Colors.white),
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
              SizedBox(height: 22.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27.0),
                child: TextField(
                  controller: pickUpLocation,
                  decoration: InputDecoration(
                    hintText: " Type your location or search in map",
                    hintStyle: TextStyle(
                      color: const Color(0xFF627487),
                      fontSize: 16.sp,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                    ),
                    suffixIcon: Icon(
                      Icons.location_searching_outlined,
                      color: const Color(0xFF627487),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xFF627487)),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27.0),
                child: Row(
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
              ),

              SizedBox(height: 26.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27.0),
                child: TextField(
                  controller: returnLocation,
                  decoration: InputDecoration(
                    hintText: " Type your location or search in map",
                    hintStyle: TextStyle(
                      color: const Color(0xFF627487),
                      fontSize: 16.sp,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                    ),
                    suffixIcon: Icon(
                      Icons.location_searching_outlined,
                      color: const Color(0xFF627487),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xFF627487)),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27.0),
                child: Row(
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
              ),

              SizedBox(height: 43.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Row(
                  children: [
                    Icon(Icons.payment_sharp, color: Colors.white),
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
              SizedBox(height: 18.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '**** **** ***5 6324',
                    hintStyle: TextStyle(
                      color: const Color(0xFF627487),
                      fontSize: 16.sp,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: Icon(
                      Icons.payments_outlined,
                      color: const Color(0xFF627487),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xFF627487)),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),

              SizedBox(height: 14.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cash',
                    hintStyle: TextStyle(
                      color: const Color(0xFF627487),
                      fontSize: 16.sp,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: Icon(
                      Icons.payments_outlined,
                      color: const Color(0xFF627487),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xFF627487)),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),

              SizedBox(height: 14.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Add payment method',
                    hintStyle: TextStyle(
                      color: const Color(0xFF627487),
                      fontSize: 16.sp,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: Icon(
                      Icons.add_box_outlined,
                      color: const Color(0xFF627487),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xFF627487)),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
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
            height: 156.h,
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
                SizedBox(width: 25.w),

                Column(
                  children: [
                    SizedBox(height: 52.h),
                    Text(
                      'RENTAL PRICE FOR ',
                      style: TextStyle(
                        color: const Color(0xFF1F354D),
                        fontSize: 15,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      getRentalDays() > 0
                          ? "${getRentalDays()} Days - ${getTotalPrice()}\$"
                          : "Select dates",
                      style: TextStyle(
                        color: const Color(0xFFF7F5F2),
                        fontSize: 20,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 33.w),
                BlocListener<RentOrderBloc, RentOrderState>(
                  listener: (context, state) {
                    if (state is RentOrderBlocLoading) {
                      showDialog(
                        context: context,
                        barrierDismissible: false, // user cannot close manually
                        builder: (BuildContext context) {
                          return Center(child: CircularProgressIndicator());
                        },
                      );
                    }
                    if (state is RentOrderBlocError) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Something went wrong'),
                        backgroundColor: Colors.red,)
                    );
                    }
                    if (state is RentOrderBlocLoaded) {
                      rentOrder =
                          BlocProvider.of<RentOrderBloc>(context).rentOrder;
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Bottomnav()),
                      );
                    }
                  },
                  child: GestureDetector(
                    onTap: () async {
                      String? loginId = await getLoginId();

                      BlocProvider.of<RentOrderBloc>(context).add(
                        FetchRentOrderEvent(
                          vehicle: widget.vid,
                          user: loginId.toString(),
                          pickupDate: selectedDate.toString(),
                          returnDate: selectedReturnDate.toString(),
                          pickupLocation: pickUpLocation.text,
                          returnLocation: returnLocation.text,
                          amount: getTotalPrice().toInt(),
                        ),
                      );
                    },
                    child: Container(
                      width: 161.w,
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
                          'Pay Now',
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
