import 'package:app2/Config/configuration.dart';
import 'package:app2/customComponents/customBack.dart';
import 'package:app2/customComponents/customProgress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAuthBasicUI extends StatefulWidget {

  List<Widget> WidgetList;
  String? title;

  CustomAuthBasicUI({Key? key,
    required this.WidgetList,
    required this.title,
  }) : super(key: key);

  @override
  State<CustomAuthBasicUI> createState() => _CustomAuthBasicUIState();
}

class _CustomAuthBasicUIState extends State<CustomAuthBasicUI> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            //back Button
            customBack(back: 1),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0.h, vertical: 9.w),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 26.5.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.h),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      height: 75.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${widget.title}',
                          style: question,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      width: 320.w,
                      height: 470.h,
                      decoration: BoxDecoration(
                        boxShadow: [
                          shadow,
                        ],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(28),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: widget.WidgetList,
                      ),
                    ),
                    rect2,
                    rect3,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
