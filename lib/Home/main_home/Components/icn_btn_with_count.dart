import 'package:app2/Config/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';



class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    required this.svgSrc,
    this.numOfitem = 0,
    required this.press,
  });

  final String svgSrc;
  final int numOfitem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none, children: [
          Container(
            padding: EdgeInsets.all(12),
            height: 42.h,
            width: 42.w,
            decoration: BoxDecoration(
              color: Colors.black12.withOpacity(0.1),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(14),
            ),
            child: SvgPicture.asset(svgSrc,
            height: 30.h,
            width: 30.w,),
          ),
          if (numOfitem != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: 16.h,
                width: 16.w,
                decoration: BoxDecoration(
                  color: ePrimary,
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfitem",
                    style: TextStyle(
                      fontSize: 10.sp,
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}