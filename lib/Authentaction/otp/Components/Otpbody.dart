import 'package:app2/Config/configuration.dart';
import 'package:app2/customComponents/customAuthBasicUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'otp_form.dart';

class OtpBody extends StatelessWidget {
  dynamic data;
  dynamic EndPoint;
  OtpBody({
    Key? key,
    this.data,
    this.EndPoint
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAuthBasicUI(
      WidgetList: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "OTP Verification",
                    style: TextStyle(
                      color: primaryYellow,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text("We sent your code to +$data", style: buttonInsideText),
                  buildTimer(),
                  SizedBox(height: 60.h),
                  OtpForm(data: data, endPoint: EndPoint),
                  SizedBox(height: 60.h),

                  GestureDetector(
                    onTap: () {
                      // OTP code resend
                    },
                    child: Text(
                      "Resend OTP Code",
                      style: buttonInsideText,
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ],
      title: "",
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in ", style: buttonInsideText),
        TweenAnimationBuilder(
          tween: Tween(begin: 70.0, end: 0.00),
          duration: const Duration(seconds: 70),
          builder: (_, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: primaryYellow),
          ),
          onEnd: () {

          },
        ),
      ],
    );
  }
}
