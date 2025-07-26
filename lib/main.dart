import 'package:car2go/bloc/bloc/car_bloc.dart';
import 'package:car2go/screens/accountDetails.dart';
import 'package:car2go/screens/addCar.dart';
import 'package:car2go/screens/bottomnav.dart';
import 'package:car2go/screens/intro.dart';
import 'package:car2go/screens/message.dart';
import 'package:car2go/screens/productDetails.dart';
import 'package:car2go/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => CarBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360,690),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
      
          scaffoldBackgroundColor: Colors.black,
        ),
        home: const Intro()
        // Intro(),
      ),
    );
  }
}

