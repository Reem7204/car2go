import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Allchat extends StatefulWidget {
  const Allchat({super.key});

  @override
  State<Allchat> createState() => _AllchatState();
}

class _AllchatState extends State<Allchat> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<String> names = ['Raj', 'Rohan'];
  final List<Map<String, dynamic>> messages = [
    {'text': 'Hello', 'isMe': false},
    {'text': 'Hello', 'isMe': true},
  ];

  void _showModalChat() {
    showModalBottomSheet(
      // isScrollControlled: true, 
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.85,
          maxChildSize: 0.95,
          minChildSize: 0.6,
          builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            child: Column(
              children: [
                SizedBox(height: 12.h),
                Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    // reverse: true,
                    padding: EdgeInsets.all(16),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final isMe = messages[index]['isMe'];
                      return Align(
                        alignment:
                            isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 6),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: isMe ? Colors.black : Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            messages[index]['text'],
                            style: TextStyle(
                              color: isMe ? Colors.white : Colors.black,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                _buildInputBar(), // Reuse your input bar
              ],
            ),
          );
        },
        );
      },
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(15.0),
          child: GestureDetector(
            onTap: _showModalChat,
            child: Container(
              height: 60.h,
              child: Row(
                children: [
                  Container(
                    width: 62.w,
                    height: 62.w,
                    
                    decoration: ShapeDecoration(
                      // image: DecorationImage(
                      //   image: NetworkImage("https://placehold.co/62x62"),
                      //   fit: BoxFit.cover,
                      // ),
                      color: Colors.grey,
                      shape: OvalBorder(
                        
                      ),
                    ),
                    child: Icon(Icons.person,size: 30.sp,color: Colors.blueGrey,),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8.h,),
                        Text(
                          names[index],
                          style: TextStyle(
                            color: const Color(0xFFF7F5F2),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Hello',
                                style: TextStyle(
                                  color: const Color(0xFF627487),
                                  fontSize: 15.sp,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              '5 min',
                              style: TextStyle(
                                color: const Color(0xFF627487),
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  Widget _buildInputBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          Icon(Icons.attach_file, color: Colors.grey),
          SizedBox(width: 8.w),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type your message',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.black),
            onPressed: () {
              if (_controller.text.trim().isNotEmpty) {
                setState(() {
                  messages.add({
                    'text': _controller.text.trim(),
                    'isMe': true,
                  });
                  _controller.clear();
                });
              }
              // Scroll to the bottom after the frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
            },
          )
        ],
      ),
    );
  }
}
