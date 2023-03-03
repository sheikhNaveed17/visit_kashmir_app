import 'package:app2/Config/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customOption extends StatefulWidget {
  String message;
  Color btnColo;
  TextStyle btnTextClrTap;
  IconData? icon;
  Color? iconColor;
  bool isIconShow;
  int width;
  int height;

  customOption({
    Key? key,

    this.isIconShow = false,
    this.iconColor,
    this.icon,
    required this.height,
    required this.width,
    required this.btnTextClrTap,
    required this.btnColo,
    required this.message,
  }) : super(key: key);

  @override
  State<customOption> createState() => _customOptionState();
}

class _customOptionState extends State<customOption> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height.h,
      width: widget.width.w,
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: radius),
        borderRadius: const BorderRadius.all(Radius.circular(13.0) //
            ),
        color: widget.btnColo,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: widget.isIconShow,
            child: Icon(
              widget.icon,
              color: widget.iconColor,
              size: 26.sp,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(widget.message,
              textAlign: TextAlign.center, style: widget.btnTextClrTap),
        ],
      ),
    );
  }
}
