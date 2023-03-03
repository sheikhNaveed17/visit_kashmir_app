import 'dart:convert';

import 'package:app2/Authentaction/otp/otp_screen.dart';
import 'package:app2/Config/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Network/ApiBaseClient/ApiConstants.dart';
import '../../../Network/ApiBaseClient/Base_client.dart';
import '../../../constants.dart';
import '../../components/custom_surfix_icon.dart';
import '../../components/default_button.dart';
import '../../components/form_error.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  bool callDone = true;
  var phonenumber;

  final List<String> errors = [];

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    BaseClient baseClient = BaseClient();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildPhoneFormField(),
          SizedBox(height: 8.h),
          FormError(errors: errors),
          SizedBox(height: 20.h),
          callDone
              ? DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                setState(() {
                  callDone = false;
                });

                var dataa = {'phone': '$phonenumber'};
                var res = await baseClient.post(
                  user_login,
                  jsonEncode(dataa),
                );
                if (res == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 4),
                      backgroundColor: primaryLightYellow,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      content: Text("Couldn't verify Credentials.", style: buttonInsideText,),
                    ),
                  );
                  setState(() {
                    callDone = true;
                  });
                } else if (res == 403 || res == 404) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 4),
                      backgroundColor: primaryLightYellow,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      content: Text("Credentials don't match!", style: buttonInsideText,),
                    ),
                  );
                  setState(() {
                    callDone = true;
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 4),
                      backgroundColor: primaryLightYellow,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      content: Text(
                        "Verification code has been\nsent Successfully", style: buttonInsideText,),
                    ),
                  );
                  navOtp();
                  print("reached");
                }
              }
            },
          )
              : CircularProgressIndicator(
            color: primaryYellow,
          ),
        ],
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phonenumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        } else if (phoneValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidPhoneError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        } else if (!phoneValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidPhoneError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone",
        hintText: "eg. 9191919191",
        hintStyle: TextStyle(color: Colors.grey.shade400),
        labelStyle: TextStyle(
            fontSize: 16.sp,
            color: bigFont,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: primaryYellow),
            gapPadding: 10.w),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: primaryYellow),
            gapPadding: 10.w),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: primaryYellow),
            gapPadding: 10.w),
        contentPadding: const EdgeInsets.all(22),
        focusColor: bigFont,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSurffixIcon(svgIcon: "images/call.svg"),
      ),
    );
  }

  void navOtp() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OtpScreen(data: phonenumber, EndPoint: user_verifyLogin),
      ),
    );
  }

  // void navLogin() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => OtpScreen(data: phonenumber),
  //     ),
  //   );
  // }
}
