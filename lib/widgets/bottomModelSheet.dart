import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

class Bottommodelsheet extends StatefulWidget {
  Bottommodelsheet({
    super.key,
    required this.modelTitle,
    this.items,
    required this.selectedValue,
    required this.type,
    
  });
  final String modelTitle;
  List<Map<String, dynamic>>? items;
  final String selectedValue;
  final String type;
  // List<
  @override
  State<Bottommodelsheet> createState() => _BottommodelsheetState();
}

class _BottommodelsheetState extends State<Bottommodelsheet> {
  late String selectedYear;
  late List<String> years;
  late int selectedIndex;
  double modelSheetHeight = 40;
  final List<String> modelsLists= ['200SX','240SX','300ZX','350Z','370Z','Infiniti'];

  void initState() {
    super.initState();
    selectedYear = DateTime.now().year.toString();
    years = List.generate(36, (index) => (1990 + index).toString());
    selectedIndex = years.indexOf(selectedYear);
  }
  @override
  Widget build(BuildContext context) {
    Widget content;
    switch (widget.type) {
      case 'vehicle':
        content = _buildListView();
        modelSheetHeight += (50 * widget.items!.length).h;
        break;
      case 'year':
        content = Expanded(child: _buildYearPicker());
        modelSheetHeight += 200.h;
        break;
      case 'model':
        content = Expanded(child: _buildModelList());
        modelSheetHeight += (50 * modelsLists.length);
        break;  
      default:
        content = Center(child: Text('No content'));
        break;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: modelSheetHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  widget.modelTitle,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Divider(),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildListView() {
    return Expanded(
      child: ListView(
        children:
            widget.items!.map((item) {
              return ListTile(
                leading: Image.asset(
                  item['image'],
                  width: 30.w,
                  height: 30.h,
                  fit: BoxFit.contain,
                ),
                title: Text(item['label'], style: TextStyle(fontSize: 18.sp)),
                onTap: () {
                  Navigator.pop(context, item['label']);
                },
              );
            }).toList(),
      ),
    );
  }

  Widget _buildYearPicker() {
    return Column(
      children: [
        Expanded(
          child: CupertinoPicker(
                        scrollController: FixedExtentScrollController(initialItem: selectedIndex),
                        itemExtent: 40,
                        onSelectedItemChanged: (index) {
                          setState(() {
                            selectedYear = years[index];
                          });
                        },
                        children: years
                            .map((year) => Center(child: Text(year, style: TextStyle(fontSize: 20.sp))))
                            .toList(),
                      ),
        ),
        CupertinoButton(
        child: Container(
                  width: 347.w,
                  height: 50.h,
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                  child: Center(
                    child: Text(
                    'Select',
                    style: TextStyle(
                      color: const Color(0xFFF7F5F2),
                      fontSize: 20.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                                    ),
                  ),
                ),
        onPressed: () {
          Navigator.pop(context, selectedYear);
        },
      ),
      ],
    );
  }
  Widget _buildModelList() {
    return Column(
      children: [
        Container(
                  width: 347.w,
                  height: 54.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: const Color(0xFF000B17),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10.w,),
                      Icon(Icons.search),
                      SizedBox(width: 10.w,),
                      Text(
                  'Search here',
                  style: TextStyle(
                    color: const Color(0xFF000B17),
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListView.builder(
                      itemCount: modelsLists.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context, modelsLists[index]);
                            },
                            child: Text(
                                              modelsLists[index],
                                              style: TextStyle(
                                                color: const Color(0xFF000B17),
                                                fontSize: 16.sp,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                          ),
                        );
                                    },),
                  ))
      ],
    );
  }
}
