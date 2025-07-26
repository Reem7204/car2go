// ignore_for_file: collection_methods_unrelated_type

import 'package:car2go/bloc/bloc/car_bloc.dart';
import 'package:car2go/model/carModel.dart';
import 'package:car2go/screens/productDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> carBrand = [
    {'label': 'Toyota', 'image': 'assets/toyota.png'},
    {'label': 'Nissan', 'image': 'assets/nissan.png'},
    {'label': 'Lexus', 'image': 'assets/lexus.png'},
    {'label': 'Benz', 'image': 'assets/benz.png'},
    {'label': 'Ford', 'image': 'assets/ford.png'},
    {'label': 'BMW', 'image': 'assets/bmw.png'},
  ];
  late MapModel carModel;
  @override
  void initState() {
    BlocProvider.of<CarBloc>(context).add(FetchCarEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: null, backgroundColor: Colors.black),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                      Container(
                        width: 40.w,
                        height: 40.h,
                        clipBehavior: Clip.none,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Icon(Icons.notifications_none_sharp),
                      ),
                    ],
                  ),
                  SizedBox(height: 19.h),
                  Row(
                    children: [
                      Container(
                        width: 292.w,
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
                              icon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.search, color: Colors.white),
                              ),

                              hintText: 'Search your dream car..',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 7.w),
                      Container(
                        width: 40.w,
                        height: 40.h,
                        clipBehavior: Clip.none,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Icon(
                          Icons.display_settings_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
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
                            width: 75.w,
                            height: 60.h,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF3F3F3),
                              shape: OvalBorder(),
                            ),
                            child: Image.asset(carBrand[index]['image']),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 27.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nearby',
                        textAlign: TextAlign.center,
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
                  SizedBox(height: 15.h),
                ],
              ),
            ),
          ),
          BlocBuilder<CarBloc, CarState>(
  builder: (context, state) {
    if (state is CarBlocLoading) {
      return SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (state is CarBlocError) {
      return SliverToBoxAdapter(
        child: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<CarBloc>(context).add(FetchCarEvent());
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Center(child: Text('Oops something went wrong')),
            ),
          ),
        ),
      );
    }

    if (state is CarBlocLoaded) {
      carModel = BlocProvider.of<CarBloc>(context).carModel;

      return SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final car = carModel.data!.searchResults![index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Productdetails(rating: car.ratingInfo!.average!.toDouble(), seats: car.vehicleInfo!.seats.toString(), doors: car.vehicleInfo!.doors.toString(), price: car.pricingInfo!.basePrice!.toDouble(), transmission: car.vehicleInfo!.transmission.toString(), vname: car.vehicleInfo!.vName.toString(), img: car.vehicleInfo!.imageUrl ?? 'https://via.placeholder.com/150',)),
                  );
                },
                child: Container(
                  width: 185.w,
                  height: 270.h,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.35, -0.29),
                      end: Alignment(0.55, 1.70),
                      colors: [Colors.black, Colors.white.withValues(alpha: .001)],
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: const Color(0xFF58606A),
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                                    width: 177.w,
                                    height: 136.h,
                                    decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage(car.vehicleInfo!.imageUrl ?? 'https://via.placeholder.com/150',),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      topRight: Radius.circular(8.r),
                    ),
                  ),
                                    ),
                                  ),
                      
                  
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              car.vehicleInfo!.vName.toString(),
                              textAlign: TextAlign.center,
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Kottakal',
                              style: TextStyle(
                                color: const Color(0xFFF7F5F2),
                                          fontSize: 13.sp,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w300,
                                          letterSpacing: 0.50,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '\$ ${car.pricingInfo!.basePrice} / day',
                              style: TextStyle(
                                color: const Color(0xFFFFD66D),
                                          fontSize: 13.sp,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: carModel.data!.searchResults!.length,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 185 / 270,
          ),
        ),
      );
    }

    return SliverToBoxAdapter(child: SizedBox());
  },
)

        ],
      ),
    );
  }
}
