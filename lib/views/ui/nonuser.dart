import 'package:azshop/views/shared/appstyle.dart';
import 'package:azshop/views/shared/reuseable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'auth/login.dart';

class NonUser extends StatelessWidget {
  const NonUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE2E2E2),
        elevation: 0,
        leading: Icon(MaterialCommunityIcons.qrcode_scan,
        size: 16.sp,
        color: Colors.black,),
        actions: [
          GestureDetector(
            onTap: () {
              
            },
            child: Padding(
              padding:  EdgeInsets.only(right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/usa.svg', width: 15.w, height: 25.h,),
                  SizedBox(width: 5.w,),
                  Container(
                    height: 15.h,
                    width: 1.w,
                    color: Colors.grey,
                  ),
                  reusableText(text: " USA", style: appstyle(15.sp, Colors.black, FontWeight.normal)),
                  SizedBox(width: 10.w,),
                  Padding(
                    padding:  EdgeInsets.only(bottom: 4.h),
                    child: Icon(SimpleLineIcons.settings,
                    color: Colors.black,
                    size: 17.sp,
                    ),
                  )
                ]
              ),
            ),
          )
        ],

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 750.h,
              decoration: const BoxDecoration(
                color:  Color(0xFFE2E2E2)
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(12.w, 10.h, 16.w, 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 35.h,
                              width: 35.w,
                              child: const CircleAvatar(
                                backgroundImage: AssetImage('assets/images/user.jpeg'),
                              ),
                            ),
                            SizedBox(width: 8.w,),
                            reusableText(text: "Hello, Please Login into your Account", style: appstyle(11.sp, Colors.grey.shade600, FontWeight.normal)),
                         ],
                        ),
                           GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 4.h),
                                width: 50.w,
                                height: 30.h,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(Radius.circular(20.r))
                                ),
                                child: Center(child: reusableText(text: "Login", style: appstyle(10.sp, Colors.white, FontWeight.normal))),
                              )
                              )
                          
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}