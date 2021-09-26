import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../const.dart';

class CustomOutLineButton extends StatelessWidget {
  String? txt;
  Color? colorTxt;
  Color? borderColor;
  Function? onPresses;

  CustomOutLineButton({
    this.txt,
    this.colorTxt,
    this.borderColor,
    this.onPresses,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(
        txt!,
        style: TextStyle(color: colorTxt),
      ),
      onPressed: () => onPresses!(),
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        side: BorderSide(color: primaryColor, width: 0.3.w),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(1.0.w))),
      ),
    );
  }
}
