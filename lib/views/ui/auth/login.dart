import 'package:azshop/views/shared/appstyle.dart';
import 'package:azshop/views/shared/custom_textfield.dart';
import 'package:azshop/views/shared/reuseable_text.dart';
import 'package:azshop/views/ui/auth/registrason.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 50.h,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
        decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 0.5, image: AssetImage('assets/images/bg.jpg'))),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            reusableText(
                text: "WellCome",
                style: appstyle(26.sp, Colors.white, FontWeight.w600)),
            reusableText(
                text: "Fill in your details to login your account",
                style: appstyle(13.sp, Colors.white, FontWeight.normal)),
            SizedBox(height: 50.h),

            CustomTextField(
              keyboard: TextInputType.emailAddress,
              hintText: "Email", 
              controller: email,
              validator: (email) {
                if(email!.isEmpty || !email.contains("@")) {
                  return 'Please provide valid email';
                } else {
                  return null;
                }
                
              },
              ),
            SizedBox(height: 15.h),
            CustomTextField(
              hintText: "Password", 
              controller: password,
              validator: (password) {
                if(password!.isEmpty || password.length < 7) {
                  return 'Password too weak';
                } else {
                  return null;
                }
                
              },
              ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Registration()));
                },
                child: reusableText(
                    text: "Register",
                    style: appstyle(13.sp, Colors.white, FontWeight.normal)),
              ),
            ),
            SizedBox(height: 40.h),
            GestureDetector(
              onTap: () {
                
              },
              child: Container(
                height: 55.h,
                width: 300.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r)
                ),
                child: Center(
                  child: reusableText(
                      text: "Register",
                      style: appstyle(16.sp, Colors.black, FontWeight.bold)),
                ),
              )
              )

          ],
        ),
      ),
    );
  }
}
