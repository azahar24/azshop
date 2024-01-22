import 'dart:convert';

import 'package:azshop/controllers/product_provider.dart';
import 'package:azshop/models/sneaker_model.dart';
import 'package:azshop/services/helper.dart';
import 'package:azshop/views/shared/custom_field.dart';
import 'package:azshop/views/shared/reuseable_text.dart';
import 'package:azshop/views/ui/product_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

import '../shared/appstyle.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100.h,
        backgroundColor: Colors.black,
        elevation: 0,
        title: CustomField(
          hintText: 'Search for a product',
          controller: search,
          onEditingComplete: () {
            setState(() {});
          },
          prefixIcon: GestureDetector(
            onTap: () {},
            child: Icon(
              AntDesign.camera,
              color: Colors.black,
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: Icon(
              AntDesign.search1,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: search.text.isEmpty
          ? Container(
              height: 600.h,
              padding: EdgeInsets.all(18.h),
              margin: EdgeInsets.only(right: 50.w),
              child: Image.asset('assets/images/Pose23.png'),
            )
          : FutureBuilder<List<Sneakers>>(
              future: Helper().search(search.text),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: reusableText(
                      text: 'Error Retriving the data',
                      style: appstyle(
                        18.sp,
                        Colors.black,
                        FontWeight.bold,
                      ),
                    ),
                  );
                } else if (snapshot.data!.isEmpty) {
                  return Center(
                    child: reusableText(
                      text: 'Product not found',
                      style: appstyle(
                        18.sp,
                        Colors.black,
                        FontWeight.bold,
                      ),
                    ),
                  );
                } else {
                  final shoes = snapshot.data;
                  return ListView.builder(
                      itemCount: shoes!.length,
                      itemBuilder: ((context, index) {
                        final shoe = shoes[index];
                        return GestureDetector(
                          onTap: () {
                            productProvider.shoesSizes = shoe.sizes;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductPage(sneakers: shoe),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.all(8.h),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.r),
                              ),
                              child: Container(
                                height: 85.h,
                                width: 325.w,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade500,
                                          spreadRadius: 5,
                                          blurRadius: 0.3,
                                          offset: const Offset(0, 1))
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(12.h),
                                          child: CachedNetworkImage(
                                            imageUrl: shoe.imageUrl[0],
                                            width: 70.w,
                                            height: 70.h,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 10.h, top: 12.h),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              reusableText(
                                                text: shoe.name,
                                                style: appstyle(
                                                  14.sp,
                                                  Colors.black,
                                                  FontWeight.w600,
                                                ),
                                              ),
                                               const SizedBox(height: 5,),
                                              reusableText(
                                                text: shoe.category,
                                                style: appstyle(
                                                  12.sp,
                                                  Colors.grey.shade600,
                                                  FontWeight.w600,
                                                ),
                                              ),
                                               const SizedBox(height: 5,),
                                              reusableText(
                                                text: "\$ ${shoe.price}",
                                                style: appstyle(
                                                  12.sp,
                                                  Colors.grey.shade600,
                                                  FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }));
                }
              },
            ),
    );
  }
}
