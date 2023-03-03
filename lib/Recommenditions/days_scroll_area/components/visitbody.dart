import 'package:app2/Recommenditions/days_scroll_area/components/dayCards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Config/configuration.dart';

class VisitBody extends StatefulWidget {
  dynamic data;

  VisitBody({Key? key, this.data}) : super(key: key);

  @override
  State<VisitBody> createState() => _VisitBodyState();
}

class _VisitBodyState extends State<VisitBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: Text("Days", style: semiBold46),
              ),
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                child: Daycards(data: widget.data),
              ),
              // Expanded(child: Text("data"))
            ],
          ),
        ),
      ),
    );
  }
}
