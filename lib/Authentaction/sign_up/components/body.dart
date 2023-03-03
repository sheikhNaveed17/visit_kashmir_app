import 'package:app2/Authentaction/sign_in/sign_in_screen.dart';
import 'package:app2/Config/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../customComponents/customAuthBasicUI.dart';
import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomAuthBasicUI(
        title: 'Sign Up',
        WidgetList: [
          SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      "Register Account",
                      style: TextStyle(
                        color: primaryYellow,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "Complete your details",
                      style: buttonInsideText,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30.h),
                    SignUpForm(),
                    SizedBox(height: 10.h),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Already have an Account? Sign In.",
                        style: info2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 18.h),
                    Text(
                      'By continuing your confirm that you agree \nwith our Term and Condition',
                      textAlign: TextAlign.center,
                      style: privacy,
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
