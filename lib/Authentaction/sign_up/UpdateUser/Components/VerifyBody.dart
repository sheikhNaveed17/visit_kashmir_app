import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Config/configuration.dart';
import 'complete_profile_form.dart';

class VerifyBody extends StatelessWidget {

  dynamic data;

  VerifyBody({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Text(
                  "Complete Profile.",
                  style: TextStyle(
                    color: primaryYellow,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Please Complete your Profile Details",
                  textAlign: TextAlign.center,
                  style: buttonInsideText,
                ),
                SizedBox(height: 40.h),
                CompleteProfileForm(
                  data: data,
                ),
                SizedBox(height: 10.h),
                Text(
                    "By continuing your confirm that you agree \nwith our Term and Condition",
                    textAlign: TextAlign.center,
                    style: privacy,
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
