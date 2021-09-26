import 'package:ecommerce_api/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../const.dart';

class CustomDropdownButton extends StatefulWidget {

  List<String> listDrop;
  String val;


  CustomDropdownButton({required this.listDrop,required this.val});

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {


  ProductController addProductController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Theme.of(context).textTheme.bodyText1!.color!,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Text('Chose ss'),
          dropdownColor: Theme.of(context).scaffoldBackgroundColor,
          items: widget.listDrop.map(
            (item) {
              return DropdownMenuItem(
                value: item,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                  child: Text(
                    item,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1!.color!),
                  ),
                ),
              );
            },
          ).toList(),
          isExpanded: true,
          value: widget.val,
          onChanged: (value) {
            setState(() {
              addProductController.newProduct.size = value.toString();
            });
          },
        ),
      ),
    );
  }
}
