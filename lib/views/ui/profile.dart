import 'package:azshop/views/shared/reuseable_text.dart';
import 'package:azshop/views/shared/tiles_widget.dart';
import 'package:azshop/views/ui/auth/login.dart';
import 'package:azshop/views/ui/cartpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../shared/appstyle.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE2E2E2),
        elevation: 0,
        leading: Icon(
          MaterialCommunityIcons.qrcode_scan,
          size: 16.sp,
          color: Colors.black,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(right: 16),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                SvgPicture.asset(
                  'assets/images/usa.svg',
                  width: 15.w,
                  height: 25.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Container(
                  height: 15.h,
                  width: 1.w,
                  color: Colors.grey,
                ),
                reusableText(
                    text: " USA",
                    style: appstyle(15.sp, Colors.black, FontWeight.normal)),
                SizedBox(
                  width: 10.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Icon(
                    SimpleLineIcons.settings,
                    color: Colors.black,
                    size: 17.sp,
                  ),
                )
              ]),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60.h,
              decoration: const BoxDecoration(color: Color(0xFFE2E2E2)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(12.w, 10.h, 16.w, 13.h),
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
                                backgroundImage:
                                    AssetImage('assets/images/user.jpeg'),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                reusableText(
                                    text: "username",
                                    style: appstyle(11.sp, Colors.black,
                                        FontWeight.normal)),
                                        reusableText(
                                    text: "azasdfs@gmail.com",
                                    style: appstyle(11.sp, Colors.black,
                                        FontWeight.normal)),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding:  EdgeInsets.all(8.w),
                          child: GestureDetector(
                              onTap: () {},
                              child: Icon(Feather.edit, size: 18.sp,)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 170.h,
                  color: Colors.grey.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TilesWidget(
                        OnTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                        },
                        title: 'My Orders', 
                        leading: MaterialCommunityIcons.truck_fast_outline),

                        TilesWidget(
                        OnTap: (){},
                        title: 'My Fevorites', 
                        leading: MaterialCommunityIcons.heart_outline),

                        TilesWidget(
                        OnTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
                        },
                        title: 'Cart', 
                        leading: Fontisto.shopping_bag_1),
                    ],
                  ),
                ),
                 SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 115.h,
                  color: Colors.grey.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                        TilesWidget(
                        OnTap: (){},
                        title: 'Coupons', 
                        leading: MaterialCommunityIcons.tag_outline),

                        TilesWidget(
                        OnTap: (){},
                        title: 'My Store', 
                        leading: MaterialCommunityIcons.shopping_outline),
                    ],
                  ),
                ),

                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 170.h,
                  color: Colors.grey.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                        TilesWidget(
                        OnTap: (){},
                        title: 'Shipping addresses', 
                        leading: SimpleLineIcons.location_pin),

                        TilesWidget(
                        OnTap: (){},
                        title: 'Settings', 
                        leading: AntDesign.setting
                        ),
                        TilesWidget(
                        OnTap: (){},
                        title: 'Logout', 
                        leading: AntDesign.logout
                        ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
