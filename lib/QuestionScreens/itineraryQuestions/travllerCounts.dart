import 'package:app2/Config/configuration.dart';
import 'package:app2/customComponents/customBasicUI.dart';
import 'package:app2/customComponents/customButton.dart';
import 'package:app2/customComponents/customOption.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class travellerCounts extends StatefulWidget {

  var data;
  travellerCounts({Key? key, required this.data}) : super(key: key);

  @override
  State<travellerCounts> createState() => _travellerCountsState();
}

class _travellerCountsState extends State<travellerCounts> {

  int _adults = 0;

  int _childs = 0;


  String question = "How many members\nare you?";

  bool isIconVisible = false;
  var btnBgColor = transparent;
  var textClr = buttonInsideText;


  void _adultIncrementCounter(){
    setState(() {
      if(_adults >= 0){
        _adults++;
      }
    });
  }

  void _adultDecrementCounter(){
    setState(() {
      if(_adults != 0){
        _adults--;
      }
    });
  }


  void _childIncrementCounter(){
    setState(() {
      if(_childs >= 0){
        _childs++;
      }
    });
  }

  void _childDecrementCounter(){
    setState(() {
      if(_childs != 0){
        _childs--;
      }
    });
  }



  @override
  Widget build(BuildContext context) {

    widget.data.query?.adults = 0;
    widget.data.query?.childrens = 0;

    return customBasicUI(
      countBar: 0.8,
      questionCounter: 5,
      count: 4,
      WidgetList: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Image.asset(
                'images/toureeType.png',
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
                          shape: CircleBorder(),
                        ),
                        onPressed: (){
                          _adultDecrementCounter();
                          widget.data.query?.adults = _adults;
                        },
                        child: Icon(Icons.remove),
                      ),

                      customOption(
                        message: '$_adults Adults',
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
                          shape: CircleBorder(),
                        ),
                        onPressed: (){
                          _adultIncrementCounter();
                          widget.data.query?.adults = _adults;
                        },
                        child: Icon(Icons.add),
                      ),


                    ],
                  ),





                ],
              ),

              SizedBox(
                height: 12.h,
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
                          shape: CircleBorder(),
                        ),
                        onPressed: (){
                          _childDecrementCounter();
                          widget.data.query?.childrens = _childs;
                        },
                        child: Icon(Icons.remove),
                      ),


                      customOption(
                        message: '$_childs Childs',
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
                          shape: CircleBorder(),
                        ),
                        onPressed: (){
                          _childIncrementCounter();
                          widget.data.query?.childrens = _childs;
                        },
                        child: Icon(Icons.add),
                      ),


                    ],
                  ),

                ],
              ),


            ],
          ),
        ),
        const Spacer(),
        Align(
          alignment: FractionalOffset.bottomRight,
            child: customButton(
              page: 7,
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
