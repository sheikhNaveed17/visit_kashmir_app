import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Config/configuration.dart';

class FormError extends StatelessWidget {
  FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index])),
    );
  }

  Padding formErrorText({required String error}) {
    return Padding(
    padding:  EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SvgPicture.asset(
            "images/error.svg",
            height: 24.h,
            width: 24.w,
            color: Colors.redAccent,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(error, style: buttonInsideText),
        ],
      ),
    );
  }
}