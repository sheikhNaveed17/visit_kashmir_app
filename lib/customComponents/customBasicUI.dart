import 'package:app2/Config/configuration.dart';
import 'package:app2/customComponents/customBack.dart';
import 'package:app2/customComponents/customProgress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customBasicUI extends StatefulWidget {

  List<Widget> WidgetList;
  dynamic countBar ;
  int? questionCounter;
  int? count;

  customBasicUI({Key? key,
    required this.WidgetList,
    required this.countBar,
    required this.questionCounter,
    required this.count,
  }) : super(key: key);

  @override
  State<customBasicUI> createState() => _basicUiState();
}

class _basicUiState extends State<customBasicUI> {

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 60.h,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Text(
                          'Questions ${widget.count} / ${widget.questionCounter}',
                          style: question,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  custom_progress(progress: widget.countBar),

                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    width: 320.w,
                    height: 450.h,
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
                      children: widget.WidgetList,
                    ),
                  ),
                  rect2,
                  rect3,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
