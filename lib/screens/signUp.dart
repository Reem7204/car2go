import 'package:car2go/widgets/buttondesign.dart';
import 'package:car2go/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonenoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 32, 47),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(onTap: () => Navigator.pop(context),child: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50.h,),
            Text(
            'Create New Account',
            style: TextStyle(
              color: const Color(0xFFF6F6F6),
              fontSize: 28.sp,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w700,
              letterSpacing: 0.70,
            ),
          ),
          SizedBox(height: 50.h,),
          CustomTextfield(label: 'Full Name', controller: fullnameController, type: 'text'),
          CustomTextfield(label: 'Email Address', controller: emailController, type: 'email'),
          CustomTextfield(label: 'Phone Number', controller: phonenoController, type: 'phone'),
          CustomTextfield(label: 'Password', controller: passwordController, type: 'password'),
          SizedBox(height: 50.h,),
          Buttondesign(text: 'Sign Up', type: 'loginButton'),
          
          ],
        ),
      ),
    );
  }
}