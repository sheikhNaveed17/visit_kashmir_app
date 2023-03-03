import 'package:app2/Home/Search/components/Search_field.dart';
import 'package:app2/Home/main_home/Components/icn_btn_with_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchHeader extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconBtnWithCounter(
            svgSrc: "images/ios_back.svg",
            press: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(width: 5.w),
          Search_Field(),
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