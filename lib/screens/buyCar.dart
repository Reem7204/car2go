import 'package:car2go/bloc/bloc/rent_cars_bloc.dart';
import 'package:car2go/model/carModel.dart';
import 'package:car2go/screens/productDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Buycar extends StatefulWidget {
  const Buycar({super.key});

  @override
  State<Buycar> createState() => _BuycarState();
}

class _BuycarState extends State<Buycar> {
  final List<Map<String, dynamic>> carBrand = [
    {'label': 'Toyota', 'image': 'assets/toyota.png'},
    {'label': 'Nissan', 'image': 'assets/nissan.png'},
    {'label': 'Lexus', 'image': 'assets/lexus.png'},
    {'label': 'Benz', 'image': 'assets/benz.png'},
    {'label': 'Ford', 'image': 'assets/ford.png'},
    {'label': 'BMW', 'image': 'assets/bmw.png'},
  ];
  final List<Map<String, dynamic>> carDetails = [
    {'label': 'Audi R8 Coupe', 'image': 'assets/AudiR8.png'},
    {'label': 'Ferrari 296 GTB', 'image': 'assets/Ferrari.png'},
    {'label': 'BMW the i5', 'image': 'assets/BMWi5.png'},
    {'label': 'BMW the X4', 'image': 'assets/BMWX4.png'},
  ];
  late List<MapModel> carModel;
  @override
  void initState() {
    BlocProvider.of<RentCarsBloc>(context).add(FetchRentCarEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(height: 94.h),
              Row(
                children: [
                  Container(
                    width: 245.w,
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
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(Icons.search, color: Colors.white),
                          ),

                          hintText: 'Search your dream car..',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 23.w),
                  Container(
                    width: 48.w,
                    height: 48.h,
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
                  SizedBox(width: 14.w),
                  Container(
                    width: 45.w,
                    height: 45.h,
                    clipBehavior: Clip.none,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
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
                        child: Center(
                          child: Image.asset(
                            carBrand[index]['image'],
                            width: 44.w,
                            height: 36.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 28.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
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
              ),
              SizedBox(height: 19.h),

              Container(
                // width: 387.w,
                height: 223.h,
                child: BlocBuilder<RentCarsBloc, RentCarsState>(
                  builder: (context, state) {
                    if (state is RentCarBlocLoading) {
                      print('++++++++++++++++');
                      return Center(child: CircularProgressIndicator());
                    }

                    if (state is RentCarBlocError) {
                      print('-----------------');
                      return RefreshIndicator(
                        onRefresh: () async {
                          BlocProvider.of<RentCarsBloc>(
                            context,
                          ).add(FetchRentCarEvent());
                        },
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: Center(
                              child: Text('Oops something went wrong'),
                            ),
                          ),
                        ),
                      );
                    }

                    if (state is RentCarBlocLoaded) {
                      print('=================');
                      carModel =
                          BlocProvider.of<RentCarsBloc>(context).rentModel;

                      return ListView.builder(
                        // padding: EdgeInsets.symmetric(horizontal: 12),
                        itemCount: carModel.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          // final car = carModel.data!.searchResults![index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => Productdetails(
                                        rating: carModel[index].rating!,
                                        seats:
                                            carModel[index].noOfSeats
                                                .toString(),
                                        doors:
                                            carModel[index].noOfDoors
                                                .toString(),
                                        price:
                                            carModel[index].rentPrice!.toInt(),
                                        transmission:
                                            carModel[index].gearType.toString(),
                                        vname: carModel[index].brand.toString(),
                                        img: carModel[index].photos!.toList(),
                                        color:
                                            carModel[index].vehicleColor
                                                .toString(),
                                      ),
                                ),
                                // MaterialPageRoute(builder: (context) => Productdetails(rating: car.ratingInfo!.average!.toDouble(), seats: car.vehicleInfo!.seats.toString(), doors: car.vehicleInfo!.doors.toString(), price: car.pricingInfo!.basePrice!.toDouble(), transmission: car.vehicleInfo!.transmission.toString(), vname: car.vehicleInfo!.vName.toString(), img: car.vehicleInfo!.imageUrl ?? 'https://via.placeholder.com/150',)),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Container(
                                width: 185.w,
                                height: 223.h,
                                decoration: ShapeDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment(0.35, -0.29),
                                    end: Alignment(0.55, 1.70),
                                    colors: [
                                      Colors.black,
                                      Colors.white.withValues(alpha: .001),
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
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 177.w,
                                        height: 146.h,
                                        decoration: ShapeDecoration(
                                          image: DecorationImage(
                                            // image: NetworkImage(car.vehicleInfo!.imageUrl ?? 'https://via.placeholder.com/150',),
                                            image: NetworkImage(
                                              carModel[index].photos![0],
                                            ),
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

                                      SizedBox(height: 13.h),
                                      Row(
                                        children: [
                                          Text(
                                            // car.vehicleInfo!.vName.toString(),
                                            carModel[index].brand.toString(),
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
                                      Row(
                                        // mainAxisAlignment: m,
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.white,
                                            size: 14.sp,
                                          ),
                                          Expanded(
                                            child: Text(
                                              carModel[index].ownerPlace
                                                  .toString(),
                                              // maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: const Color(0xFFF7F5F2),
                                                fontSize: 13.sp,
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: 0.50,
                                              ),
                                            ),
                                          ),
                                          // Spacer(),
                                          Text(
                                            // '\$${car.pricingInfo!.basePrice} / day',
                                            '\$${carModel[index].rentPrice}/day',

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
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'High Mileage',
                      style: TextStyle(
                        color: const Color(0xFFF7F5F2),
                        fontSize: 22.sp,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'View all',
                      style: TextStyle(
                        color: const Color(0xFFF7F5F2),
                        fontSize: 15.sp,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              SizedBox(
                height: 223.h,
                child: BlocBuilder<RentCarsBloc, RentCarsState>(
                  builder: (context, state) {
                    if (state is RentCarBlocLoading) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (state is RentCarBlocError) {
                      return RefreshIndicator(
                        onRefresh: () async {
                          BlocProvider.of<RentCarsBloc>(
                            context,
                          ).add(FetchRentCarEvent());
                        },
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: Center(
                              child: Text('Oops something went wrong'),
                            ),
                          ),
                        ),
                      );
                    }

                    if (state is RentCarBlocLoaded) {
                      carModel =
                          BlocProvider.of<RentCarsBloc>(context).rentModel;

                      return ListView.builder(
                        // padding: EdgeInsets.symmetric(horizontal: 12),
                        // itemCount: carModel.data!.searchResults!.length,
                        itemCount: carModel.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          // final car = carModel.data!.searchResults![index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => Productdetails(
                                        rating: carModel[index].rating!,
                                        seats:
                                            carModel[index].noOfSeats
                                                .toString(),
                                        doors:
                                            carModel[index].noOfDoors
                                                .toString(),
                                        price:
                                            carModel[index].rentPrice!.toInt(),
                                        transmission:
                                            carModel[index].gearType.toString(),
                                        vname: carModel[index].brand.toString(),
                                        img: carModel[index].photos!.toList(),
                                        color:
                                            carModel[index].vehicleColor
                                                .toString(),
                                      ),
                                ),
                                // MaterialPageRoute(builder: (context) => Productdetails(rating: car.ratingInfo!.average!.toDouble(), seats: car.vehicleInfo!.seats.toString(), doors: car.vehicleInfo!.doors.toString(), price: car.pricingInfo!.basePrice!.toDouble(), transmission: car.vehicleInfo!.transmission.toString(), vname: car.vehicleInfo!.vName.toString(), img: car.vehicleInfo!.imageUrl ?? 'https://via.placeholder.com/150',)),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Container(
                                width: 185.w,
                                height: 223.h,
                                decoration: ShapeDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment(0.35, -0.29),
                                    end: Alignment(0.55, 1.70),
                                    colors: [
                                      Colors.black,
                                      Colors.white.withValues(alpha: .001),
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
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 177.w,
                                        height: 146.h,
                                        decoration: ShapeDecoration(
                                          image: DecorationImage(
                                            // image: NetworkImage(car.vehicleInfo!.imageUrl ?? 'https://via.placeholder.com/150',),
                                            image: NetworkImage(
                                              carModel[index].photos![0],
                                            ),
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

                                      SizedBox(height: 13.h),
                                      Row(
                                        children: [
                                          Text(
                                            // car.vehicleInfo!.vName.toString(),
                                            carModel[index].brand.toString(),
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
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.white,
                                            size: 14.sp,
                                          ),
                                          Expanded(
                                            child: Text(
                                              carModel[index].ownerPlace
                                                  .toString(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: const Color(0xFFF7F5F2),
                                                fontSize: 13.sp,
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: 0.50,
                                              ),
                                            ),
                                          ),
                                          // Spacer(),
                                          Text(
                                            // '\$${car.pricingInfo!.basePrice} / day',
                                            '\$${carModel[index].rentPrice}/day',
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
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ),
              SizedBox(height: 80.h),
            ],
          ),
        ),
      ),
    );
  }
}
