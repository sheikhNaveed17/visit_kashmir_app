import 'dart:ui';

import 'package:app2/Config/configuration.dart';
import 'package:app2/Home/main_home/main_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Authentaction/sign_in/sign_in_screen.dart';
import '../Recommenditions/days_scroll_area/visitRecommendation.dart';

class ScreenSelection extends StatefulWidget {
  @override
  State<ScreenSelection> createState() => _ScreenSelectionState();
}

class _ScreenSelectionState extends State<ScreenSelection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  height: 100.h,
                  width: 100.w,
                  child: Image.asset("images/wizard_bg.jpg"),
                ),
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 2.0,
                  sigmaY: 2.0,
                ),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),

            //
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      "We’re glad you’re\nhere, Let’s get started.",
                      style: Light42White,
                    ),
                  ),
                ),

                //

                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 13,
                        mainAxisExtent: 60,
                        childAspectRatio: 3,
                      ),
                      itemCount: wizardSelection.length,
                      itemBuilder: (BuildContext context, index) {
                        return InkWell(
                          onTap: () async {
                            if (index == 0) {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              var saveValue = prefs.getString('itinerary');
                              var bearer = prefs.getString('Bearer');
                              print(saveValue);
                              print(bearer);
                              if (prefs.getString('itinerary') != null) {
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VisitRecommendation(
                                                data: saveValue)));
                              } else {
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignInScreen()));
                              }
                            } else if (index == 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainHome()));
                            } else if (index == 2) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text(
                                    "Bookings feature will be coming soon!"),
                              ));
                            } else if (index == 3) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                duration: Duration(seconds: 1),
                                content:
                                    Text("Cabs feature will be coming soon!"),
                              ));
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              // color: Colors(wizardSelection[index]['name']),
                              color: wizardSelection[index]['themeBgColor']
                                  as Color,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        wizardSelection[index]['name'],
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Montserrat',
                                          color: wizardSelection[index]
                                              ['themeFontColor'] as Color,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(
                                        Icons.arrow_circle_right_outlined,
                                        color: wizardSelection[index]
                                            ['themeActionColor'] as Color,
                                        size: 26.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                      color: Colors.black26,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        textAlign: TextAlign.center,
                        "Privacy Policy",
                        style: smallTextWhite,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
