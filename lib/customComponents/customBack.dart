
import 'package:app2/Home/Intro.dart';
import 'package:app2/QuestionScreens/bookedScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class customBack extends StatefulWidget {

  int back;

  customBack({Key? key,
    required this.back,

  }) : super(key: key);

  @override
  State<customBack> createState() => _customBackState();
}

class _customBackState extends State<customBack> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if(widget.back == 1){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => IntroScreen()));
          }else if(widget.back == 2){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => bookScreen()));
          }

        });
      },
      child: Container(
        child: SvgPicture.asset(
          'images/close.svg',
          height: 52.h,
        ),
      ),
    );
  }
}
