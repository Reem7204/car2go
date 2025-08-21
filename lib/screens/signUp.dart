import 'package:car2go/bloc/bloc/signup_bloc.dart';
import 'package:car2go/model/signUpModel.dart';
import 'package:car2go/screens/login.dart';
import 'package:car2go/widgets/buttondesign.dart';
import 'package:car2go/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  late SignUpModel signUpModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 32, 47),
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 147.h,),
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
          SizedBox(height: 78.h,),
          CustomTextfield(label: 'Full Name', controller: fullnameController, type: 'text'),
          SizedBox(height: 20.h,),
          CustomTextfield(label: 'Email Address', controller: emailController, type: 'email'),
          SizedBox(height: 20.h,),
          CustomTextfield(label: 'Phone Number', controller: phonenoController, type: 'phone'),
          SizedBox(height: 20.h,),
          CustomTextfield(label: 'Password', controller: passwordController, type: 'password'),
          SizedBox(height: 85.h,),
          BlocListener<SignupBloc,SignupState>(
            listener: (context, state) {
              if (state is SignupStateLoading) {
                showDialog(
                      context: context, 
                      barrierDismissible: false,   // user cannot close manually
                      builder: (BuildContext context) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },);
                      // Navigator.pop(context);
              }
              if (state is SignupStateError) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.red,)
                    );
              }
              if (state is SignupStateLoaded) {
                signUpModel = BlocProvider.of<SignupBloc>(context).signUpModel;
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.green,)
                );
                print("New User ID: ${state.user.id}");
                print("User Email: ${state.user.email}");
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
              }
            },
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<SignupBloc>(context).add(FetchSignupEvent(fullName: fullnameController.text, email: emailController.text, phone: phonenoController.text, password: passwordController.text));
              },
              child: Buttondesign(text: 'Sign Up', type: 'loginButton'),
            ),),
          
          SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                      'Have an account? ',
                      style: TextStyle(
                        color: const Color(0xFFDDE0E3),
                        fontSize: 16.sp,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: const Color(0xFF0078FF),
                          fontSize: 16.sp,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),])
          ],
        ),
      ),
    );
  }
}