import 'package:car2go/screens/account.dart';
import 'package:car2go/screens/addCar.dart';
import 'package:car2go/screens/buyCar.dart';
import 'package:car2go/screens/home.dart';
import 'package:car2go/screens/message.dart';
import 'package:car2go/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int _selectedScreen = 0;
  final screens = [Home(), Search(), Addcar(), Message(), Account()];
  void onTapped(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedScreen],
      bottomNavigationBar: Container(
        width: 388.w,
        height: 74.h,
        decoration: ShapeDecoration(
          color: Colors.white.withValues(alpha: 0.51),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          
        ),
        
        child: ClipRRect(
          borderRadius: BorderRadius.only(
      topLeft: Radius.circular(16.r),
      topRight: Radius.circular(16.r),
      bottomLeft: Radius.circular(16.r),
      bottomRight: Radius.circular(16.r)
    ),
          child: BottomNavigationBar(
            currentIndex: _selectedScreen,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.blueGrey,
            onTap: onTapped,
            showUnselectedLabels: true,
            selectedLabelStyle:  TextStyle(
                    color: const Color(0xFF1F354D),
                    fontSize: 10.sp,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w300,
                  ),
                  iconSize: 28.sp,
            unselectedLabelStyle:  TextStyle(
                    color: const Color(0xFF1F354D),
                    fontSize: 10.sp,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w300,
                  ),     
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home',),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline_rounded,color: Colors.amber,),
                label: 'Add Car',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message_outlined),
                label: 'Message',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_sharp),
                label: 'Account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
