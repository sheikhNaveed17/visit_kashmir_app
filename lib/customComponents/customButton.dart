import 'package:app2/Config/configuration.dart';
import 'package:app2/DataModel/recommendationModel/dataModel.dart';
import 'package:app2/Network/ApiBaseClient/Base_client.dart';
import 'package:app2/QuestionScreens/itineraryQuestions/daysActivities.dart';
import 'package:app2/QuestionScreens/itineraryQuestions/stayingDays.dart';
import 'package:app2/QuestionScreens/itineraryQuestions/tourerType.dart';
import 'package:app2/QuestionScreens/itineraryQuestions/travllerCounts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Network/ApiBaseClient/ApiConstants.dart';
import '../Recommenditions/days_scroll_area/visitRecommendation.dart';

class customButton extends StatelessWidget {
  final String? text;
  double? hsize;
  double? wsize;
  double? Bhsize;
  double? Bwsize;
  double? Ibrsize;
  double? Ebrsize;
  dynamic prog;
  int? page;
  dynamic data;

  customButton({
    Key? key,
    this.page,
    this.text,
    this.hsize,
    this.wsize,
    this.Bhsize,
    this.Bwsize,
    this.Ibrsize,
    this.Ebrsize,
    this.data,
    this.prog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hsize?.h,
      width: wsize?.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(36),
          bottomRight: Radius.circular(Ebrsize!),
        ),
        color: primaryLightYellow,
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(Bwsize!.w, Bhsize!.h),
            primary: primaryYellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(32),
                bottomRight: Radius.circular(Ibrsize!),
              ),
            ),
          ),
          child: Text(
            text!,
            style: TextStyle(
                fontSize: 16.sp,
                color: white,
                fontWeight: FontWeight.w600,
                fontFamily: 'Montserrat'),
          ),
          onPressed: () async {
            print(page);
            print(data);
            // print(data.itineraryForm);
            if (page == 3) {
              SharedPreferences prefs = await SharedPreferences.getInstance();

              if (data != null) {
                prefs.setString('itinerary', data);
              }

              var saveValue = prefs.getString('itinerary');
              print('here' + saveValue!);

              // ignore: use_build_context_synchronously
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VisitRecommendation(data: saveValue)));
            } else if (page == 4) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      //reached here
                      builder: (context) => stayingDays(data: data)));
            } else if (page == 5) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => tourerType(data: data)));
            } else if (page == 6) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => travellerCounts(data: data)));
            } else if (page == 7) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => daysActivities(data: data)));
            }
            // else if (page == 8) {
            //   print(data.toJson());
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Scaffold(
            //         body: Stack(
            //           children: [DrawerScreen(), HomeScreen()],
            //         ),
            //       ),
            //     ),
            //   );
            // }
          },
        ),
      ),
    );
  }
}
