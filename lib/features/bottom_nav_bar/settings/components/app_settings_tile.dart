import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_project/core/theming/colors.dart';

class AppSettingsListTile extends StatelessWidget {
  const AppSettingsListTile({
    super.key,
    required this.label,
    required this.style,

    this.onTap,
    required this.widget,
  });

  final String label;
  final TextStyle style;
  final Widget widget;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorsManager.mainblue,
      borderRadius: BorderRadius.circular(10.sp),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10.sp),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  widget,
                  SizedBox(width: 10.w),
                  Text(label, style: style),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Divider(thickness: 0.1, color: ColorsManager.textWhite),
            ],
          ),
        ),
      ),
    );
  }
}
