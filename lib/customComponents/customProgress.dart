import 'package:app2/Config/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

class custom_progress extends StatefulWidget {

  double progress;

  custom_progress({
    Key? key,
    required this.progress,
  }) : super(key: key);

  @override
  State<custom_progress> createState() => _custom_progressState();
}

class _custom_progressState extends State<custom_progress> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        LinearPercentIndicator(
          lineHeight: 12.0.h,
          percent: widget.progress,
          progressColor: primaryYellow,
          barRadius: const Radius.circular(20),
        ),
      ],
    );
  }
}
