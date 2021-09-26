import 'package:ecommerce_api/const.dart';
import 'package:ecommerce_api/controllers/cart_controller.dart';
import 'package:ecommerce_api/controllers/checkout_controller.dart';
import 'package:ecommerce_api/screens/widget/custem_text.dart';
import 'package:ecommerce_api/screens/widget/custom_button.dart';
import 'package:ecommerce_api/screens/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'confirmation_order_screen.dart';

class DeliveryDataScreen extends StatelessWidget {

  CheckoutController checkoutController =Get.put(CheckoutController());
  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          txt: "Delivery data",
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.0.w),
        child: Column(
          children: [
            spaceBetween(high: 3.0.h),
            countryFiled(),
            streetFiled(),
            Spacer(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    txt: "Sub total : ",
                    color: Colors.grey,
                  ),
                  CustomText(
                    txt: "${cartController.priceAllProduct} \$",
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            spaceBetween(high: 1.0.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    txt: "Tax(15%) :",
                    color: Colors.grey,
                  ),
                  CustomText(
                    txt: "15\$",
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            spaceBetween(high: 1.0.h),
            Divider(
              thickness: 0.1.h,
              color: Colors.white,
              endIndent: 7.0.w,
              indent: 7.0.w,
            ),
            spaceBetween(high: 1.0.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    txt: "Total :",
                    color: Colors.grey,
                  ),
                  CustomText(
                    txt: "${cartController.priceAllProduct + 15} \$",
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            spaceBetween(high: 1.0.h),
            CustomButton(
              txt: "Checkout",
              colorTxt: Colors.white,
              colorButton: primaryColor,
              borderRadius: 2.0.w,
              width: 85.0.w,
              onPressed: () => Get.to(()=>ConfirmationOrderScreen()),
            ),
            spaceBetween(high: 1.0.h),

          ],
        ),
      ),
    );
  }

  Widget countryFiled() {
    return CustomTextFormField(
      color: Colors.black,
      hintTxt: "Enter your country",
      keyboardType: TextInputType.text,
      icon: Icons.cancel_outlined,
      onSaved: (val) {
        checkoutController.checkoutModel.customerCity =val;
      },
      onChange: (val) {
        checkoutController.checkoutModel.customerCity =val;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "Required";
        } else
          return null;
      },
    );
  }

  Widget streetFiled() {
    return CustomTextFormField(
      color: Colors.black,
      hintTxt: "Enter your street",
      keyboardType: TextInputType.text,
      icon: Icons.cancel_outlined,
      onSaved: (val) {
        checkoutController.checkoutModel.customerStreet=val;
      },
      onChange: (val) {
        checkoutController.checkoutModel.customerStreet=val;
        print(checkoutController.checkoutModel.customerStreet);
      },
      validator: (value) {
        if (value.isEmpty) {
          return "Required";
        } else
          return null;
      },
    );
  }

}
