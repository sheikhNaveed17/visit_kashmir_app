import 'package:app2/Config/configuration.dart';
import 'package:app2/customComponents/customBasicUI.dart';
import 'package:app2/customComponents/customButton.dart';
import 'package:app2/customComponents/customOption.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class stayingDays extends StatefulWidget {
  var data;

  stayingDays({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<stayingDays> createState() => _stayingDaysState();
}

class _stayingDaysState extends State<stayingDays> {
  int _counter = 4;

  int _nightCounter = 3;

  String question = "How many days you are staying\nin Paradise?";
  String message = "Note : 'N' refers to Nights & 'D' refers to Days.";

  bool isIconVisible = false;
  var btnBgColor = transparent;
  var textClr = buttonInsideText;

  void _incrementCounter() {
    setState(() {
      if (_counter >= 1) {
        _counter++;
        _nightCounter++;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter != 1) {
        _counter--;
        _nightCounter--;
      }
    });
  }

  var now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    widget.data.query?.totalDaysStay = _counter;

    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    widget.data.query?.arrivalDate = formattedDate;

    selectDate() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2050),
      ).then((value) {
        setState(() {
          now = value!;
          widget.data.query?.arrivalDate = formattedDate;
        });
      });
    }

    return customBasicUI(
      countBar: 0.4,
      questionCounter: 5,
      count: 2,
      WidgetList: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Image.asset(
                'images/stayingDays.png',
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
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(14.w, 14.h),
                          primary: primaryYellow,
                          shape: const CircleBorder(),
                        ),
                        onPressed: () {
                          _decrementCounter();
                          widget.data.query?.totalDaysStay = _counter;
                        },
                        child: const Icon(Icons.remove),
                      ),
                      customOption(
                        message: '$_nightCounter N / $_counter D',
                        btnColo: btnBgColor,
                        btnTextClrTap: textClr,
                        iconColor: white,
                        isIconShow: false,
                        width: 168,
                        height: 53,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(14.w, 14.h),
                          primary: primaryYellow,
                          shape: const CircleBorder(),
                        ),
                        onPressed: () {
                          _incrementCounter();
                          widget.data.query?.totalDaysStay = _counter;
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 24,
                  ),
                  customOption(
                    message: formattedDate,
                    btnColo: btnBgColor,
                    btnTextClrTap: textClr,
                    iconColor: white,
                    isIconShow: false,
                    width: 168,
                    height: 53,
                  ),
                  InkWell(
                    onTap: () {
                      selectDate();
                    },
                    child:
                        Icon(Icons.date_range_outlined, color: primaryYellow),
                  ),
                ],
              ),

              const SizedBox(height: 10,),

              Align(
                alignment: Alignment.center,
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: info,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Align(
          alignment: FractionalOffset.bottomRight,
          child: customButton(
            page: 5,
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
