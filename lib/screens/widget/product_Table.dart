import 'package:ecommerce_api/models/product_model.dart';
import 'package:ecommerce_api/screens/mobile_screeens/details_product_screen.dart';
import 'package:ecommerce_api/screens/windows/details_product_window_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custem_text.dart';

class ProductTable extends StatelessWidget {
  List<ProductsModel> product;

  ProductTable({required this.product});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      showCheckboxColumn: false,
      columns: [
        DataColumn(
          label: CustomText(
            txt: "ID",
            fontWeight: FontWeight.w900,
          ),
        ),
        DataColumn(
          label: CustomText(
            txt: "Image product",
            fontWeight: FontWeight.w900,
          ),
        ),
        DataColumn(
          label: CustomText(
            txt: "Category",
            fontWeight: FontWeight.w900,
          ),
        ),
        DataColumn(
          label: CustomText(
            txt: "Color",
            fontWeight: FontWeight.w900,
          ),
        ),
        DataColumn(
          label: CustomText(
            txt: "price",
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
      rows: product.map((e) {
        return DataRow(
            onSelectChanged: (newValue) {
              Get.to(()=>DetailsProductWindowScreen(product: e, index: 0,));
            },
            cells: [
          DataCell(
            CustomText(
              txt: '#${e.id}',
              alignment: Alignment.centerLeft,
            ),
          ),
          DataCell(
            CustomText(
              txt: e.title,
              alignment: Alignment.centerLeft,
            ),
          ),
          DataCell(
            CustomText(
              txt: e.category!.title,
              alignment: Alignment.centerLeft,
            ),
          ),
          DataCell(
            CustomText(
              txt: e.color,
              alignment: Alignment.centerLeft,
            ),
          ),
          DataCell(
            CustomText(
              txt: '${e.price}\$',
              alignment: Alignment.centerLeft,
            ),
          ),
        ]);
      }).toList(),
    );
  }
}
