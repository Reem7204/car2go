import 'package:car2go/screens/bottomnav.dart';
import 'package:car2go/screens/home.dart';
import 'package:car2go/screens/signUp.dart';
import 'package:car2go/widgets/buttondesign.dart';
import 'package:car2go/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 32, 47),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100.h,),
            Center(
              child: Text(
              'Welcome ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFFF6F6F6),
                fontSize: 32.sp,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w700,
                letterSpacing: 0.80,
              ),
                      ),
              
            ),
            SizedBox(height: 70.h,),
            CustomTextfield(label: 'Email', controller: emailController, type: 'email'),
            CustomTextfield(label: 'Password', controller: passwordController, type: 'password'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    
                  }, 
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: const Color(0xFFDDE0E3),
                      fontSize: 16.sp,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                    ),
                  ),),
                  
              ],
            ),
            SizedBox(height: 30.h,),
          GestureDetector(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Bottomnav()));
          },child: Buttondesign(text: 'Sign In', type: 'loginButton')),
          Buttondesign(text: 'Sign In with Google', type: 'loginButton'),
          SizedBox(height: 50.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                    'Don’t have an account ',
                    style: TextStyle(
                      color: const Color(0xFFDDE0E3),
                      fontSize: 16.sp,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: const Color(0xFF0078FF),
                        fontSize: 16.sp,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
            ],
          )
          ],
        ),
      ),
    );
  }
}