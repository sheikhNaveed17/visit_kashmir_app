import 'package:app2/Config/configuration.dart';
import 'package:app2/customComponents/customBasicUI.dart';
import 'package:app2/customComponents/customButton.dart';
import 'package:app2/customComponents/customOption.dart';
import 'package:app2/customComponents/customProgress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class travelType extends StatefulWidget {


  var data;
  travelType({Key? key, required this.data}) : super(key: key);

  @override
  State<travelType> createState() => _travelTypeState();
}

class _travelTypeState extends State<travelType> {

  String yes = "By Road";
  String no = "By Air";
  String question = "How are you going to\nTravel?";


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
      countBar: 0.2,
      questionCounter: 5,
      count: 1,
      WidgetList: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Image.asset(
                    'images/road.png',
                    height: 130.h,
                    width: 130.w,
                  ),

                  Image.asset(
                    'images/air.png',
                    height: 130.h,
                    width: 130.w,
                  ),

                ],
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
                    print("Road");
                    btnBgColor = primaryYellow;
                    btnBgColor2 = transparent;
                    textClr = buttonInsideTextTap;
                    textClr2 = buttonInsideText;
                    isIconVisible = true;
                    isIconVisible2 = false;
                    widget.data.travelBy ="Road";
                    print(widget.data.toJson());
                  });
                },
                child: customOption(
                  message: yes,
                  btnColo: btnBgColor,
                  btnTextClrTap: textClr,
                  isIconShow: isIconVisible,
                  icon: Icons.directions_car,
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
                    print("Air");
                    btnBgColor2 = primaryYellow;
                    btnBgColor = transparent;
                    textClr2 = buttonInsideTextTap;
                    textClr = buttonInsideText;
                    isIconVisible = false;
                    isIconVisible2 = true;
                    widget.data.travelBy="Air";
                    print(widget.data.toJson());
                  });
                },
                child: customOption(
                  message: no,
                  btnColo: btnBgColor2,
                  btnTextClrTap: textClr2,
                  isIconShow: isIconVisible2,
                  icon: Icons.flight_takeoff,
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
            page: 4,
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
