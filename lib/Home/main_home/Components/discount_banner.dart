import 'package:app2/Config/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountBanner extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 90,
      width: double.infinity,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 20.w,
      ),
      decoration: BoxDecoration(
        color: primaryYellow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(text: "A Summer Surpise\n", style: categorie),
            TextSpan(
              text: "Cashback 20%",
              style: semiBold28,
            ),
          ],
        ),
      ),
    );
  }
}