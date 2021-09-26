import 'package:ecommerce_api/const.dart';
import 'package:ecommerce_api/controllers/auth_controller.dart';
import 'package:ecommerce_api/screens/widget/custem_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {
  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 30.0.h,
            width: 100.0.w,
            color: primaryColor,
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "$URL${authController.currentUser.profilePic!}"),
                  radius: 18.0.w,
                ),
                spaceBetween(high: 3.0.h),
                CustomText(
                  txt: authController.currentUser.username,
                  color: Colors.white,
                  alignment: Alignment.center,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0.h),
            child: Container(
              width: 100.0.w,
              height: 60.0.h,
              color: Theme.of(context).accentColor,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 12.0.h, left: 10.0.w, right: 8.0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    userDetails(context , "Username" , authController.currentUser.username),
                    userDetails(context , "Email" , authController.currentUser.email),
                    userDetails(context , "Password" , "*********"),
                    userDetails(context , "Phone" , authController.currentUser.phone),
                    spaceBetween(high: 2.0.h),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 55.0.w, left: 10.0.w),
            child: Container(
              width: 80.0.w,
              height: 10.0.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2.0.w),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      spaceBetween(high: 3.0.h),
                      CustomText(
                        txt: "   20 \n Point",
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      spaceBetween(high: 3.0.h),
                      CustomText(
                        txt: "   20 \n Coupons",
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      spaceBetween(high: 3.0.h),
                      CustomText(
                        txt: "   20 \$ \n Wallet",
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row userDetails(BuildContext context , String title , mainText) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              txt: title,
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
            spaceBetween(high: 1.0.h),
            CustomText(
              txt: mainText,
              color: Theme.of(context).textTheme.bodyText1!.color,
              fontWeight: FontWeight.w300,
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_forward_ios_sharp,
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}
