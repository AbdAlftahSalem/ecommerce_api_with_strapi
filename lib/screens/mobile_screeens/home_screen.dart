import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_api/const.dart';
import 'package:ecommerce_api/controllers/home_admin_controller.dart';
import 'package:ecommerce_api/screens/widget/grid_product_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {

  HomeAdminController homeAdminController =Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          spaceBetween(high: 1.0.h),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              height: 20.0.h,
              onPageChanged: (v, r) {},
            ),
            items: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(2.0.w),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2.0.w),
                    topRight: Radius.circular(2.0.w),
                    bottomLeft: Radius.circular(2.0.w),
                    bottomRight: Radius.circular(2.0.w),
                  ),
                  child: Image.network(
                    'https://jooinn.com/images/young-man-7.jpg',
                    fit: BoxFit.cover,
                    height: 20.0.h,
                    width: 100.0.w,
                  ),
                ),
              ),
            ],
          ),
          spaceBetween(high: 3.0.h),
          Expanded(
            child: GridProductWidget(product: homeAdminController.allProduct,),
          ),
        ],
      ),
    );
  }
}
