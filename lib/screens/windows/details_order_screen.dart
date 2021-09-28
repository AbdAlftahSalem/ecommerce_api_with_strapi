import 'package:ecommerce_api/const.dart';
import 'package:ecommerce_api/models/checkout_model.dart';
import 'package:ecommerce_api/screens/widget/custem_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class DetailsOrderScreen extends StatelessWidget {
  CheckoutModel checkout;

  DetailsOrderScreen({required this.checkout});

  @override
  Widget build(BuildContext context) {
    dynamic dateOrder = DateFormat.yMMMMEEEEd().format(
        DateTime.parse(checkout.dateOfOrder!));
    return Scaffold(
      backgroundColor: Color(0xFFFAF7FF),
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 1.0.h),
        child: Column(
          children: [
            CustomText(
              txt: "ID order : ${checkout.id}",
              fontWeight: FontWeight.w500,
            ),
            spaceBetween(high: 0.5.h),
            CustomText(
              txt: "Customer name : ${checkout.customerName}",
              fontWeight: FontWeight.w500,
            ),
            spaceBetween(high: 0.5.h),
            CustomText(
              txt: "Customer ID : ${checkout.customerId}",
              fontWeight: FontWeight.w500,
            ),
            spaceBetween(high: 0.5.h),
            CustomText(
              txt: "Customer E_mail : ${checkout.customerEmail}",
              fontWeight: FontWeight.w500,
            ),
            spaceBetween(high: 0.5.h),
            CustomText(
              txt: "Customer street : ${checkout.customerStreet}",
              fontWeight: FontWeight.w500,
            ),
            spaceBetween(high: 0.5.h),
            CustomText(
              txt: "Customer city : ${checkout.customerCity}",
              fontWeight: FontWeight.w500,
            ),
            spaceBetween(high: 0.5.h),
            // DateFormat.yMMMMEEEEd().format(aDateTime)
            CustomText(
              txt: "Date of order : $dateOrder",
              fontWeight: FontWeight.w500,
            ),
            spaceBetween(high: 0.5.h),
            CustomText(
              txt: "Price : ${checkout.price}",
              fontWeight: FontWeight.w500,
            ),
            spaceBetween(high: 2.0.h),
            CustomText(
              txt: "All products",
              fontWeight: FontWeight.w800,
            ),
            spaceBetween(high: 1.0.h),
            Expanded(
              flex: 9,
              child: Container(
                color: Color(0xFFFAF7FF),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      dynamic dateOrder = DateFormat.yMMMMEEEEd().format(
                          DateTime.parse(checkout.orders![index].dateProduct!));
                      return cardProduct(
                        titleProduct: checkout.orders![index].titleProduct,
                        imageProduct: checkout.orders![index].imageProduct,
                        colorProduct: checkout.orders![index].colorProduct,
                        idProduct: checkout.orders![index].idProduct,
                        priceProduct: checkout.orders![index].priceProduct,
                        dateOrder: dateOrder,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        spaceBetween(high: 1.0.h),
                    itemCount: checkout.orders!.length,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardProduct({
    String? idProduct,
    imageProduct,
    titleProduct,
    colorProduct,
    priceProduct,
    dateOrder,
  }) {

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFE3E0F3),
        borderRadius: BorderRadius.circular(1.0.w),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              txt: idProduct,
              alignment: Alignment.center,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0.w),
              child: Image.network(
                "$URL$imageProduct",
                width: 5.0.w,
                height: 5.0.h,
              ),
            ),
            CustomText(
              txt: titleProduct,
            ),
            CustomText(
              txt: dateOrder,
              color: Colors.green,
            ),
            CustomText(
              txt: colorProduct,
              color: Colors.green,
            ),
            CustomText(
              txt: "$priceProduct\$",
            ),
          ],
        ),
      ),
    );
  }
}
