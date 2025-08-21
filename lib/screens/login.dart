
import 'package:car2go/bloc/bloc/login_bloc.dart';
import 'package:car2go/model/loginModel.dart';
import 'package:car2go/screens/bottomnav.dart';
import 'package:car2go/screens/home.dart';
import 'package:car2go/screens/signUp.dart';
import 'package:car2go/widgets/buttondesign.dart';
import 'package:car2go/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late LoginModel loginModel;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: const Color.fromARGB(255, 18, 32, 47),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(height: 146.h),
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
              SizedBox(height: 68.h),
              CustomTextfield(
                label: 'Email',
                controller: emailController,
                type: 'email',
              ),
              SizedBox(height: 20.h),
              CustomTextfield(
                label: 'Password',
                controller: passwordController,
                type: 'password',
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: const Color(0xFFDDE0E3),
                        fontSize: 16.sp,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 88.h),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginStateLoading) {
                    showDialog(
                      context: context, 
                      builder: (BuildContext context) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },);
                      Navigator.pop(context);
                  }
                  if (state is LoginStateError) {
                    // Navigator.pop(context); //Close loading dialog if open
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.red,)
                    );
                  }
                  if (state is LoginStateLoaded) {
                    loginModel = BlocProvider.of<LoginBloc>(context).loginModel;
                    Navigator.pop(context);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Bottomnav()));
                  }
                },
                child: GestureDetector(
                onTap: () {
                  BlocProvider.of<LoginBloc>(context).add(FetchLoginEvent(email:emailController.text, password:passwordController.text));
                },
                child: Buttondesign(text: 'Sign In', type: 'loginButton'),
              ),
              ),
              
              SizedBox(height: 20.h),
              Buttondesign(text: 'Sign In with Google', type: 'loginButton'),
              SizedBox(height: 20.h),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
