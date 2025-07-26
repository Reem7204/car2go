import 'package:car2go/screens/allChat.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu, color: Colors.white),
          title: const Text(
            'Messages',
            style: TextStyle(
              color: Color(0xFFF7F5F2),
              fontSize: 24,
              fontFamily: 'SF Pro Display',
              letterSpacing: 0.24,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            labelStyle: TextStyle(
              color: const Color(0xFFF7F5F2),
                        fontSize: 20,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w600,

            ),
            tabs: [
              Tab( text: 'All Chats',),
              Tab( text: 'Buying'),
              Tab( text: 'Selling'),
            ],
          ),
        ),
        body: Container(
          color: Colors.black,
          child: const TabBarView(
            children: [
              Allchat(),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.message_rounded,size: 100 ,color: Colors.white,),
                    Text('Your message will appear here',style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.message_rounded,size: 100 ,color: Colors.white,),
                    Text('Your message will appear here',style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
