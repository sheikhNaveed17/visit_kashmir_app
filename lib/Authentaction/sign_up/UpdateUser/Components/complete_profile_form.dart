import 'package:app2/DataModel/UserModel/userUpdateProfile.dart';
import 'package:app2/Home/Intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Config/configuration.dart';
import '../../../../DataModel/recommendationModel/dataModel.dart';
import '../../../../Network/ApiBaseClient/ApiConstants.dart';
import '../../../../Network/ApiBaseClient/Base_client.dart';
import '../../../../constants.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';

class CompleteProfileForm extends StatefulWidget {

  dynamic data;

  CompleteProfileForm({Key? key, this.data}) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String? firstName;
  String? lastName;
  String? email;
  bool callDone = true;

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
    print(widget.data);
    BaseClient baseClient = BaseClient();
    dynamic id = widget.data;
    String singleGet = user_update;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: 30.h),
          buildLastNameFormField(),
          SizedBox(height: 30.h),
          buildEmailFormField(),
          FormError(errors: errors),
          SizedBox(height: 25.h),
          callDone
              ? DefaultButton(
                  text: "continue",
                  press: () async {
                    print("object");
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print("hey");
                      setState(() {
                        callDone = false;
                      });


                      var data = userUpdateProfileOptionalToJson(
                          UserUpdateProfileOptional(
                              firstname: firstName,
                              lastname: lastName,
                              email: email
                          ),);

                      print(data);

                      var res = await baseClient.patch(
                        '$singleGet$id',
                          data,
                      );
                      if (res == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 4),
                            backgroundColor: primaryLightYellow,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            content: Text(
                              "Couldn't Update Profile! Try again Later",
                              style: buttonInsideText,
                            ),
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
                              "Profile Update Successful.",
                              style: buttonInsideText,
                            ),
                          ),
                        );
                        navMain();
                        setState(() {
                          callDone = true;
                        });
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

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "e.g JohnDoe@gmail.com",
        hintStyle: TextStyle(color: Colors.grey.shade400),
        labelStyle: inputStyle,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        border: inputBorder,
        contentPadding: const EdgeInsets.all(22),
        focusColor: bigFont,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSurffixIcon(svgIcon: "images/mail.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "e.g John",
        hintStyle: TextStyle(color: Colors.grey.shade400),
        labelStyle: inputStyle,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        border: inputBorder,
        contentPadding: const EdgeInsets.all(22),
        focusColor: bigFont,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSurffixIcon(svgIcon: "images/first.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kLastNullError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kLastNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "e.g Doe",
        hintStyle: TextStyle(color: Colors.grey.shade400),
        labelStyle: inputStyle,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        border: inputBorder,
        contentPadding: const EdgeInsets.all(22),
        focusColor: bigFont,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSurffixIcon(svgIcon: "images/first.svg"),
      ),
    );
  }

  void navMain() {
    var data = UserDataModel(
      query: Query(
        userBooked: true,
        travelBy: "air",
      ),
    );

    print(data.query?.userBooked);
    print(data.query?.travelBy);

    // data.itineraryForm?.add(
    //   ItineraryForm(
    //
    //   ),
    // );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IntroScreen(
          data: data,
        ),
      ),
    );
  }
}
