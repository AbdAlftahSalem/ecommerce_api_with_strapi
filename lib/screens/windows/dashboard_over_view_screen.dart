import 'package:ecommerce_api/const.dart';
import 'package:ecommerce_api/controllers/auth_controller.dart';
import 'package:ecommerce_api/controllers/home_admin_controller.dart';
import 'package:ecommerce_api/screens/widget/custem_text.dart';
import 'package:ecommerce_api/screens/widget/custom_button.dart';
import 'package:ecommerce_api/screens/windows/products_windows_screen.dart';
import 'package:ecommerce_api/screens/windows/user_windows_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'add_new_product_screen.dart';
import 'categories_screen.dart';
import 'login_windows_screen.dart';
import 'order_screen.dart';

class DashboardOverViewScreen extends StatelessWidget {
  AuthController authController = Get.find();
  HomeAdminController homeAdminController = Get.put(HomeAdminController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeAdminController>(
        init: HomeAdminController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Color(0xFFFAF7FF),
            appBar: AppBar(
              title: CustomText(
                txt: "Admin Panel",
                color: Colors.white,
              ),
              elevation: 0,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 1.0.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        txt: "Overview",
                        color: Colors.black,
                        fontSize: 8.0.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomButton(
                        borderRadius: 0.5.w,
                        colorButton: primaryColor,
                        width: 20.0.w,
                        txt: "+ Add product",
                        colorTxt: Colors.white,
                        onPressed: () => Get.to(() => AddNewProductScreen()),
                      ),
                    ],
                  ),
                  spaceBetween(high: 1.5.h),
                  Container(
                    color: Color(0xFFFAF7FF),
                    child: Wrap(
                      children: [
                        InkWell(
                          child: cardOverView(
                            'All Users',
                            authController.allUser.length.toString(),
                          ),
                          onTap: () => Get.to(() => UserWindowsScreen()),
                        ),
                        cardOverView('Users sign up last 24 hours ', "30"),
                        InkWell(
                          onTap: () => Get.to(() => ProductsWindowsScreen()),
                          child: cardOverView('Products',
                              homeAdminController.allProduct.length),
                        ),
                        InkWell(
                          onTap: () => Get.to(() => CategoriesScreen()),
                          child: cardOverView('All categories',
                              homeAdminController.allCategories.length),
                        ),
                        InkWell(
                          onTap: () => Get.to(() => OrderScreen()),
                          child: cardOverView('All order',
                              homeAdminController.allChekOut.length),
                        ),
                        cardOverView('Order last 24 hours', "30"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            drawer: drawer(),
          );
        });
  }

  Container cardOverView(String? title, num) {
    return Container(
      width: 30.0.w,
      height: 5.0.h,
      margin: EdgeInsets.all(2.0.w),
      decoration: BoxDecoration(
        color: Color(0xFFFFE2EE),
        borderRadius: BorderRadius.circular(1.0.w),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 1.0.w, top: 0.5.h),
        child: CustomText(
          txt: "$title \n\n $num",
        ),
      ),
    );
  }

  Drawer drawer() {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.0.w),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'http://www.iloveindia.com/astrology/sun-signs/images/sagittarius-man.jpg'),
              radius: 12.0.w,
            ),
            spaceBetween(high: 1.0.h),
            InkWell(
              onTap: () => Get.to(() => DashboardOverViewScreen()),
              child: Row(
                children: [
                  Icon(
                    Icons.workspaces_filled,
                    color: Colors.black,
                  ),
                  spaceBetween(width: 2.0.w),
                  CustomText(
                    txt: "Overview",
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            spaceBetween(high: 1.0.h),
            InkWell(
              onTap: () => Get.to(() => UserWindowsScreen()),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  spaceBetween(width: 2.0.w),
                  CustomText(
                    txt: "Users",
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            spaceBetween(high: 1.0.h),
            InkWell(
              onTap: () => Get.to(() => ProductsWindowsScreen()),
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.dumpster,
                    color: Colors.black,
                  ),
                  spaceBetween(width: 2.0.w),
                  CustomText(
                    txt: "Products",
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            spaceBetween(high: 1.0.h),
            InkWell(
              onTap: () => Get.to(() => OrderScreen()),
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.cashRegister,
                    color: Colors.black,
                  ),
                  spaceBetween(width: 2.0.w),
                  CustomText(
                    txt: "Orders",
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            Spacer(),
            CustomButton(
              borderRadius: 0.5.w,
              colorButton: Colors.red,
              width: 20.0.w,
              txt: "Logout",
              colorTxt: Colors.white,
              onPressed: () => Get.to(() => LoginWindowsScreen()),
            ),
            spaceBetween(high: 2.0.h),
          ],
        ),
      ),
    );
  }

  Expanded basicCard(String title, num) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFE3E0F3),
          borderRadius: BorderRadius.circular(2.0.w),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 0.5.h),
          child: CustomText(
            txt: '$title \n\n $num',
            color: Colors.black,
          ),
        ),
        margin: EdgeInsets.all(1.0.w),
      ),
    );
  }
}
