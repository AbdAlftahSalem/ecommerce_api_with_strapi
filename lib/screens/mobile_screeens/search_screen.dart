import 'package:ecommerce_api/const.dart';
import 'package:ecommerce_api/controllers/search_controller.dart';
import 'package:ecommerce_api/screens/mobile_screeens/details_product_screen.dart';
import 'package:ecommerce_api/screens/widget/custem_text.dart';
import 'package:ecommerce_api/screens/widget/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController iconSearchFiled = TextEditingController();
  SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      init: SearchController(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0.w , vertical: 2.0.h),
            child: Column(
              children: [
                spaceBetween(high: 2.0.h),
                searchFiled(),
                searchController.searchText == "" &&
                        searchController.searchProduct.length == 0
                    ? CustomText(
                        txt: "Search item",
                        alignment: Alignment.center,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      )
                    : searchController.searchProduct.length == 0 &&
                            searchController.searchText != ""
                        ? Image.asset('assets/image/Empty-pana.png')
                        : Expanded(
                            flex: 8,
                            child: ListView.separated(
                              itemBuilder: (context, index) => InkWell(
                                onTap: ()=>Get.to(DetailsProductScreen(product: searchController.searchProduct[index])),
                                child: Container(
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "$URL${searchController.searchProduct[index].image!}"),
                                      ),
                                      spaceBetween(width: 5.0.w),
                                      CustomText(
                                        txt: searchController
                                            .searchProduct[index].title,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                                  spaceBetween(high: 2.0.h),
                              itemCount: searchController.searchProduct.length,
                            ),
                          ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget searchFiled() {
    return CustomTextFormField(
      color: Colors.black,
      hintTxt: "Search for the best product",
      keyboardType: TextInputType.text,
      icon: Icons.cancel_outlined,
      onPressedIcon: () => iconSearchFiled.clear(),
      onSaved: (val) {
        // authController.newUser.email = val;
      },
      onChange: (val) {
        searchController.searchText = val;
        searchController.searchSubjectMethod();
      },
      validator: (value) {
        if (value.isEmpty) {
          return "Required";
        } else
          return null;
      },
      controller: iconSearchFiled,
    );
  }
}
