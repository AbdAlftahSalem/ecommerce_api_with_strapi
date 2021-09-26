import 'package:ecommerce_api/controllers/home_admin_controller.dart';
import 'package:ecommerce_api/screens/widget/custem_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../const.dart';
import 'details_product_same_categories.dart';

class CategoriesScreen extends StatelessWidget {
  HomeAdminController homeAdminController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF7FF),
      appBar: AppBar(),
      body: Row(
        children: homeAdminController.allCategories.map(
          (e) {
            return InkWell(
              onTap: () =>
                  Get.to(() => DetailsProductSameCategories(category: e)),
              child: Container(
                width: 30.0.w,
                height: 5.0.h,
                margin: EdgeInsets.all(2.0.w),
                decoration: BoxDecoration(
                  color: Color(0xFFFFE2EE),
                  borderRadius: BorderRadius.circular(1.0.w),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 1.0.w, top: 0.5.h),
                  child: Row(
                    children: [
                      Image.network(
                        "$URL${e.image!.formats!.thumbnail!.url}",
                        width: 5.0.w,
                        height: 5.0.h,
                      ),
                      spaceBetween(width: 2.0.w),
                      CustomText(
                        txt: e.title,
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
