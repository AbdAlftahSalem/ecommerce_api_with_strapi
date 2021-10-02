import 'package:ecommerce_api/const.dart';
import 'package:ecommerce_api/controllers/auth_controller.dart';
import 'package:ecommerce_api/screens/widget/custem_text.dart';
import 'package:ecommerce_api/screens/widget/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class UserWindowsScreen extends StatelessWidget {
  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color(0xFFFAF7FF),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 1.0.h),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: 40.0.w,
                child: CustomTextFormField(
                  color: Colors.black,
                  hintTxt: "search",
                  icon: Icons.search,
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (val) {
                    // authController.newUser.email = val;
                  },
                  onChange: (val) {
                    // authController.newUser.email = val;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Required";
                    } else
                      return null;
                  },
                  controller: TextEditingController(text: "Search product"),
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    allUsersTable(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DataTable allUsersTable() {
    return DataTable(
      columns: [
        DataColumn(
          label: CustomText(
            txt: "ID user",
            fontWeight: FontWeight.w900,
          ),
        ),
        DataColumn(
          label: CustomText(
            txt: "User name",
            fontWeight: FontWeight.w900,
          ),
        ),
        DataColumn(
          label: CustomText(
            txt: "Email user",
            fontWeight: FontWeight.w900,
          ),
        ),
        DataColumn(
          label: CustomText(
            txt: "Phone user",
            fontWeight: FontWeight.w900,
          ),
        ),
        DataColumn(
          label: CustomText(
            txt: "Profile completed",
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
      rows: authController.allUser.map((e) {
        return DataRow(cells: [
          DataCell(
            CustomText(
              txt: '#${e.id}',
              alignment: Alignment.centerLeft,
            ),
          ),
          DataCell(
            CustomText(
              txt: e.username,
              alignment: Alignment.centerLeft,
            ),
          ),
          DataCell(
            CustomText(
              txt: e.email!,
              alignment: Alignment.centerLeft,
            ),
          ),
          DataCell(
            CustomText(
              txt: e.phone,
              alignment: Alignment.centerLeft,
            ),
          ),
          DataCell(
            CustomText(
              txt: e.confirmed.toString(),
              alignment: Alignment.centerLeft,
            ),
          ),
        ]);
      }).toList(),
    );
  }
}
