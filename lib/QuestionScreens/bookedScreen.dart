import 'package:app2/Config/configuration.dart';
import 'package:app2/DataModel/recommendationModel/dataModel.dart';
import 'package:app2/customComponents/customBasicUI.dart';
import 'package:app2/customComponents/customButton.dart';
import 'package:app2/customComponents/customOption.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class bookScreen extends StatefulWidget {

  var data;

  bookScreen({Key? key, this.data}) : super(key: key);

  @override
  State<bookScreen> createState() => _bookScreenState();
}

class _bookScreenState extends State<bookScreen> {
  String yes = "Yes, Just a few days before.";
  String no = "No, Book your magical journey.";
  String question = "Have you already booked your trip?";

  bool isIconVisible = false;
  bool isIconVisible2 = false;

  var btnBgColor = transparent;
  var btnBgColor2 = transparent;

  var textClr = buttonInsideText;
  var textClr2 = buttonInsideText;

  // var textClrTap = buttonInsideTextTap;

  @override
  Widget build(BuildContext context) {
    return customBasicUI(
      countBar: 0.5,
      questionCounter: 2,
      count: 1,
      WidgetList: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Image.asset(
                'images/page1.png',
                height: 130.h,
                width: 130.w,
              ),

              Text(
                question,
                textAlign: TextAlign.center,
                style: internalQ,
              ),

              SizedBox(
                height: 18.h,
              ),

              //Yes

              GestureDetector(
                onTap: () {
                  setState(() {
                    btnBgColor = primaryYellow;
                    btnBgColor2 = transparent;
                    textClr = buttonInsideTextTap;
                    textClr2 = buttonInsideText;
                    isIconVisible = true;
                    isIconVisible2 = false;
                    widget.data.booked = true;
                    print(widget.data.toJson());
                  });
                },
                child: customOption(
                  message: yes,
                  btnColo: btnBgColor,
                  btnTextClrTap: textClr,
                  isIconShow: isIconVisible,
                  icon: Icons.done_all,
                  iconColor: white,
                  width: 300,
                  height: 53,
                ),
              ),

              SizedBox(
                height: 18.h,
              ),

              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.data.booked = false;
                    print(widget.data.toJson());
                    btnBgColor2 = primaryYellow;
                    btnBgColor = transparent;
                    textClr2 = buttonInsideTextTap;
                    textClr = buttonInsideText;
                    isIconVisible = false;
                    isIconVisible2 = true;
                  });
                },
                child: customOption(
                  message: no,
                  btnColo: btnBgColor2,
                  btnTextClrTap: textClr2,
                  isIconShow: isIconVisible2,
                  icon: Icons.done_all,
                  iconColor: white,
                  width: 300,
                  height: 53,
                ),
              ),
            ],
          ),
        ),

        const Spacer(),
        Align(
          alignment: FractionalOffset.bottomRight,
          child: customButton(
            page: 2,
            text: "Next",
            hsize: 63,
            wsize: 141,
            Bwsize: 132,
            Bhsize: 56,
            Ebrsize: 28,
            Ibrsize: 28,
            data: widget.data,
          ),
        ),
      ],
    );
  }
}
