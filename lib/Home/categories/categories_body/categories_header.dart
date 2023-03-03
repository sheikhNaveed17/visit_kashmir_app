import 'package:app2/Home/main_home/Components/icn_btn_with_count.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Config/configuration.dart';

class CategoriesHeader extends StatefulWidget {

  final String? title;
  bool showIcons = true;

  CategoriesHeader({super.key, this.title, required this.showIcons});

  @override
  State<CategoriesHeader> createState() => _CategoriesHeaderState();
}

class _CategoriesHeaderState extends State<CategoriesHeader> {
  int count = 0;

  List<String> interest = [
    'Recommended',
    'Top Tier',
    'Most Viewed',
    'Popular',
    'Budget Friendly'
  ];

  List<String>? selectedUserList = [];

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Icon(Icons.arrow_back_ios, color: ePrimary,),
            IconBtnWithCounter(
              svgSrc: "images/ios_back.svg",
              press: () {
                Navigator.pop(context);
              },
            ),

            SizedBox(
              width: 10.w,
            ),

            Expanded(
              child: Center(
                child: Text(widget.title as String, style: bold18),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Visibility(
              visible: widget.showIcons as bool,
              child: IconBtnWithCounter(
                svgSrc: "images/bookmark.svg",
                press: () {},
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Visibility(
              visible: widget.showIcons as bool,
              child: IconBtnWithCounter(
                svgSrc: "images/Bell.svg",
                numOfitem: 3,
                press: () {},
              ),
            ),

          ],
        ),
      ),
    );
  }

}
