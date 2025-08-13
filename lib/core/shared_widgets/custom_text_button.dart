import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';

class CustomTextButton extends StatefulWidget {
  CustomTextButton({
    super.key,
    required this.text,
    required this.onpressed,
    this.fontWeight,
    this.textDecoration,
    this.alignment,
    this.color,
    this.fontsize,
  });

  String text;
  final VoidCallback onpressed;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final Alignment? alignment;
  final Color? color;
  final double? fontsize;

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(alignment: widget.alignment),
      onPressed: widget.onpressed,
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: widget.fontsize ?? 13.sp,
          fontWeight: widget.fontWeight ?? FontWeight.w400,
          decoration: widget.textDecoration ?? TextDecoration.underline,
          decorationColor: ColorsManager.mainblue,
          color: widget.color ?? ColorsManager.mainblue,
        ),
      ),
    );
  }
}
