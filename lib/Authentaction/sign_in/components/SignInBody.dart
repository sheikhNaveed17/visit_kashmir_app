import 'package:app2/Authentaction/sign_in/components/Sign_in_form.dart';
import 'package:app2/Authentaction/sign_up/sign_up_screen.dart';
import 'package:app2/Config/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../customComponents/customAuthBasicUI.dart';

class SignInBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomAuthBasicUI(
        title: 'Sign In',
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
                      "Welcome back",
                      style: TextStyle(
                        color: primaryYellow,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Please Enter You Credentials",
                      style: buttonInsideText,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40.h),
                    SignInForm(),
                    SizedBox(height: 10.h),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Don't have an Account? Sign Up.",
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
