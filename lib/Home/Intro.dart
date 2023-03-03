import 'package:app2/DataModel/recommendationModel/dataModel.dart';
import 'package:app2/customComponents/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Config/configuration.dart';

class IntroScreen extends StatefulWidget {

  var data;

  IntroScreen({Key? key, this.data}) : super(key: key);


  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/hey.png',
                        height: 200.h,
                      )
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Text.rich(
                    TextSpan(
                      text: "Let's make \n",
                      style: light42,
                      children: [
                        TextSpan(
                          text: "your dream vaccation.",
                          style: semiBold46,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    "By Taking a few simple steps, we can help you to better connect to new places, make amazing memories, truly feel at home in a strange land, and always have the best stories to tell.",
                    style: medium16,
                  ),
                ],
              ),
            ),
            SizedBox(height: 27.h),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomRight,
                child: customButton(
                  page: 4,
                  text: "Let's do this.",
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
      ),
    );
  }
}
