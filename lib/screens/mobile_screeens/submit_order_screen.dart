import 'package:ecommerce_api/const.dart';
import 'package:ecommerce_api/screens/mobile_screeens/home_screen_user.dart';
import 'package:ecommerce_api/screens/widget/custem_text.dart';
import 'package:ecommerce_api/screens/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SubmitOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          spaceBetween(high: 30.0.h),
          Image.asset(
            'assets/image/tick.png',
            width: 40.0.w,
            height: 20.0.h,
          ),
          spaceBetween(high: 2.0.h),
          CustomText(
            txt:
                "Your request was created successfully . \n\n Delivery within 24 hours of ordering date",
            color: Theme.of(context).textTheme.bodyText1!.color,
            alignment: Alignment.center,
            textAlign: TextAlign.center,
          ),
          spaceBetween(high: 30.0.h),
          CustomButton(
            txt: "Confirm order",
            colorTxt: Colors.white,
            colorButton: primaryColor,
            borderRadius: 2.0.w,
            width: 85.0.w,
            onPressed: ()=>Get.offAll(HomeScreenUser()),
          ),
        ],
      ),
    );
  }
}
