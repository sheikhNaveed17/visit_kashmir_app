import 'dart:convert';

import 'package:app2/Authentaction/sign_up/UpdateUser/CompleteProfileScreen.dart';
import 'package:app2/Network/ApiBaseClient/Base_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Config/configuration.dart';
import '../../../DataModel/UserModel/OtpModel.dart';
import '../../../Home/main_home/main_home.dart';
import '../../../Network/ApiBaseClient/ApiConstants.dart';
import '../../../constants.dart';
import '../../components/default_button.dart';

class OtpForm extends StatefulWidget {
  dynamic data;
  dynamic endPoint;

  OtpForm({Key? key, this.data, this.endPoint}) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  bool callDone = true;

  var id;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode?.dispose();
    pin3FocusNode?.dispose();
    pin4FocusNode?.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    var otp1, otp2, otp3, otp4;
    var finalOtp;
    var res;
    print(widget.endPoint);
    BaseClient baseClient = BaseClient();
    return Form(
      child: Column(
        children: [
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 60.h,
                child: TextFormField(
                  autofocus: true,
                  obscureText: true,
                  style: TextStyle(fontSize: 24.sp),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode!);
                    otp1 = value;
                  },
                ),
              ),
              SizedBox(
                width: 60.h,
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24.sp),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin3FocusNode!);
                    otp2 = value;
                  },
                ),
              ),
              SizedBox(
                width: 60.h,
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24.sp),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin4FocusNode!);
                    otp3 = value;
                  },
                ),
              ),
              SizedBox(
                width: 60.h,
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24.sp),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin4FocusNode?.unfocus();
                      otp4 = value;
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          callDone
              ? DefaultButton(
                  text: "Continue",
                  press: () async {
                    setState(() {
                      callDone = false;
                    });
                    print("hey");
                    if (otp1 == null ||
                        otp2 == null ||
                        otp3 == null ||
                        otp4 == null) {
                      print("invalid");
                    } else {
                      finalOtp = '$otp1$otp2$otp3$otp4';
                      print(finalOtp);
                    }
                    var dataa = {'phone': widget.data, 'code': finalOtp};
                    if(widget.endPoint == user_verifyLogin){
                      print(widget.endPoint);
                      res = await baseClient.loginVerify(
                        widget.endPoint,
                        jsonEncode(dataa),
                      );
                    }else{
                      print(widget.endPoint);
                      res = await baseClient.post(
                        widget.endPoint,
                        jsonEncode(dataa),
                      );
                    }

                    if (res == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 4),
                          backgroundColor: primaryLightYellow,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          content: const Text("Couldn't verify this time."),
                        ),
                      );
                      setState(() {
                        callDone = true;
                      });
                    } else {
                      if (widget.endPoint == user_verifyLogin) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 4),
                            backgroundColor: primaryLightYellow,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            content: const Text("OTP Verified Successfully"),
                          ),
                        );
                        navHome();
                        setState(() {
                          callDone = true;
                        });
                      } else {
                        var data = OtpModelFromJson(res);
                        print("here");
                        print(data.user?.id);
                        id = data.user?.id;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 4),
                            backgroundColor: primaryLightYellow,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            content: const Text("OTP Verified Successfully"),
                          ),
                        );
                        nav();
                        setState(() {
                          callDone = true;
                        });
                      }
                    }
                  })
              : CircularProgressIndicator(
                  color: primaryYellow,
                ),
        ],
      ),
    );
  }

  void nav() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CompleteProfileScreen(data: id)),
    );
  }

  void navHome() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MainHome(),
      ),
    );
  }
}
