import 'package:app2/Config/configuration.dart';
import 'package:app2/customComponents/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class halfWay extends StatefulWidget {

  var data;

  halfWay({Key? key, required this.data}) : super(key: key);

  @override
  State<halfWay> createState() => _halfWayState();
}

class _halfWayState extends State<halfWay> {
  @override
  Widget build(BuildContext context) {
    // var b = widget.data;
    // print(b.query);
    return Scaffold(
      body: Column(
        children: [

          SizedBox(height: 40.h),

          Align(
            alignment: Alignment.topLeft,
            child: Icon(Icons.close, color: primaryYellow, size: 28.sp),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 25.h),

                Center(
                  child: Text(
                    "Hey Buddy !",
                    style: semiBold46,
                  ),
                ),
                SizedBox(height: 20.h),

                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "We’re glad you’re\nhere, here are your recommendations.",
                    style: Light42,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/halfWay.png',
                      height: 190.h,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "And yeah ! thanks for showing such an intrest\nin “Our App”. We will keep looking forword to\nimprove your experince further.",
                    style: medium16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 27.h),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomRight,
              child: customButton(
                  page: 3,
                  text: "Show",
                  hsize: 80,
                  wsize: 200,
                  Bhsize: 72,
                  Bwsize: 191,
                  Ebrsize: 0,
                  Ibrsize: 0,
                  data: widget.data,

              ),
            ),
          ),
        ],
      ),
    );
  }
}
