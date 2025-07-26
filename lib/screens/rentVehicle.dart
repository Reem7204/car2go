import 'package:car2go/screens/price.dart';
import 'package:car2go/widgets/bottomModelSheet.dart';
import 'package:car2go/widgets/dropDownDesign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

class Rentvehicle extends StatefulWidget {
  const Rentvehicle({super.key});

  @override
  State<Rentvehicle> createState() => _RentvehicleState();
}

class _RentvehicleState extends State<Rentvehicle> {
  String? selectedValue = 'Car';
  String? selectedCarBrand = '';
  String? selectedYear = 'Add Model Year';
  String? selectedModel = 'Add Model Type';
  final List<Map<String, dynamic>> items = [
    {"label": "Car", "image": 'assets/carIcon.png'},
    {"label": "Motorcycle", "image": 'assets/motorCycleIcon.png'},
  ];
  final List<Map<String, dynamic>> carBrand = [
    {'label': 'Toyota', 'image': 'assets/toyota.png'},
    {'label': 'Nissan', 'image': 'assets/nissan.png'},
    {'label': 'Lexus', 'image': 'assets/lexus.png'},
    {'label': 'Benz', 'image': 'assets/benz.png'},
    {'label': 'Ford', 'image': 'assets/ford.png'},
    {'label': 'BMW', 'image': 'assets/bmw.png'},
  ];
  final List<Map<String, dynamic>> bikeBrand = [
    {'label': 'Kawasaki', 'image': 'assets/k.png'},
    {'label': 'BMW', 'image': 'assets/bmw.png'},
    {'label': 'Ducati', 'image': 'assets/ducati.png'},
    {'label': 'Honda', 'image': 'assets/honda.png'},
  ];

  void _showVehiclePicker() async {
    final result = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Bottommodelsheet(
          modelTitle: 'Selected Vehicle Type',
          items: items,
          selectedValue: selectedValue ?? 'Car',
          type: 'vehicle',
        );
      },
    );
    if (result != null) {
      setState(() {
        selectedValue = result;
      });
    }
  }

  void _showCarBrandPicker() async {
    final result = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Bottommodelsheet(
          modelTitle: 'Brands',
          items: selectedValue == 'Car' ? carBrand : bikeBrand,
          selectedValue:
              selectedValue == 'Car'
                  ? selectedCarBrand ?? 'Toyota'
                  : selectedCarBrand ?? 'Kawasaki',
          type: 'vehicle',
        );
      },
    );
    if (result != null) {
      setState(() {
        selectedCarBrand = result;
      });
    }
  }

  void _showModelYearPicker() async {
    final result = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Bottommodelsheet(
          modelTitle: 'Model Year',

          selectedValue: selectedYear ?? '',
          type: 'year',
        );
      },
    );
    if (result != null) {
      setState(() {
        selectedYear = result;
      });
    }
  }

  void _showModelPicker() async {
    final result = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Bottommodelsheet(
          modelTitle: 'Model',

          selectedValue: selectedModel ?? '',
          type: 'model',
        );
      },
    );
    if (result != null) {
      setState(() {
        selectedModel = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios_new),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add  your vehicle',
              style: TextStyle(
                color: const Color(0xFF000B17),
                fontSize: 20.sp,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () => _showVehiclePicker(),
              child: Dropdowndesign(
                items: items,
                selectedValue: selectedValue ?? 'Car',
                type: 'Icon&Text',
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              'Brand',
              style: TextStyle(
                color: const Color(0xFF000B17),
                fontSize: 14.sp,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () => _showCarBrandPicker(),
              child: Dropdowndesign(
                items: selectedValue == 'Car' ? carBrand : bikeBrand,
                selectedValue:
                    selectedValue == 'Car'
                        ? selectedCarBrand ?? 'Toyota'
                        : selectedCarBrand ?? 'Kawasaki',
                type: 'Icon&Text',
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Model',
              style: TextStyle(
                color: const Color(0xFF000B17),
                fontSize: 14.sp,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () => _showModelPicker(),
              child: Container(
                width: 378.w,
                height: 60.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: const Color(0xFF627487)),
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 10.w),

                      Text(selectedModel!, style: TextStyle(fontSize: 18.sp)),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Year',
              style: TextStyle(
                color: const Color(0xFF000B17),
                fontSize: 14.sp,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () => _showModelYearPicker(),
              child: Container(
                width: 378.w,
                height: 60.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: const Color(0xFF627487)),
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 10.w),

                      Text(selectedYear!, style: TextStyle(fontSize: 18.sp)),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      bottomSheet: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Price()));
          },
          child: Container(
            width: 347.w,
            height: 56.h,
            decoration: ShapeDecoration(
              color: const Color(0xFF000B17),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Center(
              child: Text(
                'Next',
                style: TextStyle(
                  color: const Color(0xFFF7F5F2),
                  fontSize: 20.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
