import 'package:car2go/screens/account.dart';
import 'package:car2go/screens/addCar.dart';
import 'package:car2go/screens/buyCar.dart';
import 'package:car2go/screens/home.dart';
import 'package:car2go/screens/message.dart';
import 'package:car2go/screens/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';


class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int _selectedScreen = 0;
  final screens = [Home(), Search(), Addcar(), Message(), Account()];
  final List<Map<String, dynamic>> _items = [
    {'icon': CupertinoIcons.home, 'label': 'Home', 'color' : Color(0xFF1F354D)},
    {'icon': CupertinoIcons.search, 'label': 'Search', 'color' : Color(0xFF1F354D)},
    {'icon': CupertinoIcons.add, 'label': 'Add Car', 'color' : Colors.amber},
    {'icon': CupertinoIcons.chat_bubble, 'label': 'Message', 'color' : Color(0xFF1F354D)},
    {'icon': CupertinoIcons.person, 'label': 'Account', 'color' : Color(0xFF1F354D)},
  ];
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
          color: Colors.white.withValues(alpha: 0.71),
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
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(_items.length, (index) {
            final item = _items[index];
            final isSelected = index == _selectedScreen;
          
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedScreen = index;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    padding: EdgeInsets.symmetric(horizontal: isSelected ? 12 : 0),
                    decoration: isSelected
                        ? BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(16.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          )
                        : null,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Icon(
                            item['icon'],
                            color: item['color'],
                            size:  28.sp,
                          ),
                          SizedBox(height: 6),
                                        Text(
                      item['label'],
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: const Color(0xFF1F354D),
                        fontWeight: FontWeight.normal,
                      ),
                                        ),
                        ],
                      ),
                    ),
                    
                  ),
                  
                ],
              ),
            );
          }),)
        ),
      ),
    );
  }
}
