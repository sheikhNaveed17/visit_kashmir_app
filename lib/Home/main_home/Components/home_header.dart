import 'package:app2/Home/main_home/Components/icn_btn_with_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          SizedBox(width: 5.w),
          IconBtnWithCounter(
            svgSrc: "images/bookmark.svg",
            press: () {},
          ),
          SizedBox(width: 5.w),
          IconBtnWithCounter(
            svgSrc: "images/Bell.svg",
            numOfitem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}