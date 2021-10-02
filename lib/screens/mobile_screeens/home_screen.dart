
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

          Expanded(
            child: GridProductWidget(product: homeAdminController.allProduct,),
          ),
        ],
      ),
    );
  }
}
