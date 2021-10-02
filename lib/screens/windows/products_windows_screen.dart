import 'package:ecommerce_api/const.dart';
import 'package:ecommerce_api/controllers/home_admin_controller.dart';
import 'package:ecommerce_api/screens/widget/custem_text.dart';
import 'package:ecommerce_api/screens/widget/custom_text_form_field.dart';
import 'package:ecommerce_api/screens/widget/product_Table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'details_product_window_screen.dart';

class ProductsWindowsScreen extends StatelessWidget {
  HomeAdminController homeAdminController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeAdminController>(
      init: HomeAdminController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Color(0xFFFAF7FF),
          appBar: AppBar(),
          body: Column(
            children: [
              spaceBetween(high: 1.0.h),
              Expanded(
                child: SizedBox(
                  width: 50.0.w,
                  child: CustomTextFormField(
                    color: Colors.black,
                    hintTxt: "search",
                    icon: Icons.search,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (val) {
                      // authController.newUser.email = val;
                    },
                    onChange: (val) {
                      // authController.newUser.email = val;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Required";
                      } else
                        return null;
                    },
                    controller: TextEditingController(text: "Search product"),
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  color: Color(0xFFFAF7FF),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                    child: ListView(
                      children: <Widget>[
                        ProductTable(product: homeAdminController.allProduct,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
