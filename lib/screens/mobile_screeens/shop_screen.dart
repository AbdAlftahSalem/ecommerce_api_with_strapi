import 'package:ecommerce_api/const.dart';
import 'package:ecommerce_api/controllers/home_admin_controller.dart';
import 'package:ecommerce_api/controllers/home_user_controller.dart';
import 'package:ecommerce_api/screens/widget/custem_text.dart';
import 'package:ecommerce_api/screens/widget/grid_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ShopScreen extends StatelessWidget {
  HomeAdminController homeAdminController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeUserController>(
      init: HomeUserController(),
      builder: (controller) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 1.0.h),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () =>
                          controller.chooseCat(controller.allCat[index]),
                      child: CustomText(
                        txt: controller.allCat[index],
                        color: controller.productCategory ==
                                controller.allCat[index]
                            ? primaryColor
                            : Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        spaceBetween(width: 3.0.w),
                    itemCount: controller.allCat.length,
                  ),
                ),
                spaceBetween(high: 2.0.h),
                Expanded(
                  flex: 20,
                  child: GridProductWidget(
                    product: controller.productWithCat,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
