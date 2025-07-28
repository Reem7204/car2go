import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dropdowndesign extends StatefulWidget {
  const Dropdowndesign({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.type,
  });
  final List<Map<String, dynamic>> items;
  final String selectedValue;
  final String type;
  @override
  State<Dropdowndesign> createState() => _DropdowndesignState();
}

class _DropdowndesignState extends State<Dropdowndesign> {
  
   
  @override
  Widget build(BuildContext context) {
    Widget content;
    switch (widget.type) {
      case 'Icon&Text':
        content = _buildIconText();
        print(widget.items);
        break;
      case 'Year':
        content = _buildYear();
        break;
      default:
        content = Center(child: Text('No content'));
        break;
    }
    return Container(
      width: 378.w,
      height: 60.h,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: const Color(0xFF627487)),
          borderRadius: BorderRadius.circular(3.r),
        ),
      ),
      child: Padding(padding: const EdgeInsets.all(8.0), child: content),
    );
  }

  Widget _buildIconText() {
    final selectedItem = widget.items.firstWhere(
  (e) => e['label'] == widget.selectedValue,
  orElse: () => widget.items.first, // fallback to the first item
);

    return Row(
      children: [
        SizedBox(width: 17.w),
        Image.asset(selectedItem['image'],
          width: 58.w,
          height: 23.h,
          fit: BoxFit.contain,
        ),
        SizedBox(width: 27.w),
        Text(selectedItem['label'], style: TextStyle(fontSize: 18.sp)),
        Spacer(),
        Icon(Icons.keyboard_arrow_down_rounded),
        SizedBox(width: 18.w,)
      ],
    );
  }

  Widget _buildYear() {
    return Text('');
              
  }
}
