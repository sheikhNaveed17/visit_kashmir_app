import 'package:app2/Config/configuration.dart';
import 'package:app2/DataModel/singleModels/single_attractionsModel.dart';
import 'package:app2/DataModel/singleModels/single_eventsModel.dart';
import 'package:app2/DataModel/singleModels/single_foodModel.dart';
import 'package:app2/Recommenditions/days_scroll_area/components/ListIndCatView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../DataModel/recommendationModel/VisitRecommend.dart';
import '../../../DataModel/recommendationModel/saveRecommendationModel.dart';
import '../../../Network/ApiBaseClient/ApiConstants.dart';
import '../../../Network/ApiBaseClient/Base_client.dart';

class Daycards extends StatefulWidget {
  dynamic data;

  Daycards({Key? key, this.data}) : super(key: key);

  @override
  State<Daycards> createState() => _DaycardsState();
}

class _DaycardsState extends State<Daycards> {
  BaseClient base = BaseClient();

  dynamic postData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: FutureBuilder(
        future: base.post(onboarding, widget.data),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final visitRecommend = visitRecommendFromJson(snapshot.data);
            postData = visitRecommend.data;
            for (int x = 1; x <= visitRecommend.data!.length; x++) {
              for (int y = 0;
                  y < visitRecommend.data![x.toString()]!.length;
                  y++) {}
            }

            print(postData);

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (int x = 1; x <= visitRecommend.data!.length; x++)
                          ExpansionTile(
                            title: Text(
                              'Day $x',
                              style: Light42,
                            ),
                            leading: Icon(
                              Icons.calendar_month_rounded,
                              color: primaryYellow,
                            ),
                            children: [
                              for (int y = 0;
                                  y <
                                      visitRecommend
                                          .data![x.toString()]!.length;
                                  y++)
                                ExpansionTile(
                                  title: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.place_rounded,
                                        color: primaryYellow,
                                      ),
                                      title: Text(
                                        visitRecommend
                                            .data![x.toString()]![y].keys.first
                                            .toString(),
                                        // "b",
                                        style: Light42,
                                      ),
                                    ),
                                  ),
                                  children: [
                                    //Attractions
                                    Padding(
                                      padding: const EdgeInsets.only(left: 60),
                                      child: GestureDetector(
                                        onTap: () {
                                          var d = visitRecommend
                                              .data![x.toString()]![y]
                                              .keys
                                              .first
                                              .toString();
                                          print(visitRecommend
                                              .data![x.toString()]![y][d]
                                              ?.attractions);
                                          if (visitRecommend
                                              .data![x.toString()]![y][d]!
                                              .attractions!
                                              .isEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor: primaryYellow,
                                                duration:
                                                    const Duration(seconds: 1),
                                                content: const Text(
                                                    "No Attraction Found Currently!"),
                                              ),
                                            );
                                          } else {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ListIndCatView(
                                                          RecommendData:
                                                              visitRecommend
                                                                  .data![
                                                                      x.toString()]![
                                                                      y][d]
                                                                  ?.attractions,
                                                          Json:
                                                              singleAttractionsModelFromJson,
                                                          endPoint:
                                                              single_attractions,
                                                          title: "Attractions.",
                                                        )));
                                          }
                                        },
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.local_attraction,
                                            color: primaryYellow,
                                          ),
                                          title: Text(
                                            "Attractions.",
                                            // "b",
                                            style: A42,
                                          ),
                                        ),
                                      ),
                                    ),

                                    //foodplaces
                                    Padding(
                                      padding: const EdgeInsets.only(left: 60),
                                      child: GestureDetector(
                                        onTap: () {
                                          var d = visitRecommend
                                              .data![x.toString()]![y]
                                              .keys
                                              .first
                                              .toString();
                                          print(visitRecommend
                                              .data![x.toString()]![y][d]
                                              ?.foodplaces);
                                          if (visitRecommend
                                              .data![x.toString()]![y][d]!
                                              .foodplaces!
                                              .isEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor: primaryYellow,
                                                duration:
                                                    const Duration(seconds: 1),
                                                content: const Text(
                                                    "No Food Places Found Currently!"),
                                              ),
                                            );
                                          } else {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ListIndCatView(
                                                          RecommendData:
                                                              visitRecommend
                                                                  .data![
                                                                      x.toString()]![
                                                                      y][d]
                                                                  ?.foodplaces,
                                                          Json:
                                                              singleFoodModelFromJson,
                                                          endPoint:
                                                              single_foods,
                                                          title: "Food Places.",
                                                        )));
                                          }
                                        },
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.restaurant,
                                            color: primaryYellow,
                                          ),
                                          title: Text(
                                            "Food Places.",
                                            // "b",
                                            style: A42,
                                          ),
                                        ),
                                      ),
                                    ),

                                    //events
                                    Padding(
                                      padding: const EdgeInsets.only(left: 60),
                                      child: GestureDetector(
                                        onTap: () {
                                          var d = visitRecommend
                                              .data![x.toString()]![y]
                                              .keys
                                              .first
                                              .toString();
                                          print(visitRecommend
                                              .data![x.toString()]![y][d]
                                              ?.events);
                                          if (visitRecommend
                                              .data![x.toString()]![y][d]!
                                              .events!
                                              .isEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor: primaryYellow,
                                                duration:
                                                    const Duration(seconds: 1),
                                                content: const Text(
                                                    "No Events Found Currently!"),
                                              ),
                                            );
                                          } else {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ListIndCatView(
                                                          RecommendData:
                                                              visitRecommend
                                                                  .data![
                                                                      x.toString()]![
                                                                      y][d]
                                                                  ?.events,
                                                          Json:
                                                              singleEventsModelFromJson,
                                                          endPoint:
                                                              single_events,
                                                          title: "Events.",
                                                        )));
                                          }
                                        },
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.event_available_outlined,
                                            color: primaryYellow,
                                          ),
                                          title: Text(
                                            "Events.",
                                            // "b",
                                            style: A42,
                                          ),
                                        ),
                                      ),
                                    ),

                                    //recreationalActivities
                                    Padding(
                                      padding: const EdgeInsets.only(left: 60),
                                      child: GestureDetector(
                                        onTap: () {
                                          var d = visitRecommend
                                              .data![x.toString()]![y]
                                              .keys
                                              .first
                                              .toString();
                                          print(visitRecommend
                                              .data![x.toString()]![y][d]
                                              ?.recreationalActivities);
                                          if (visitRecommend
                                              .data![x.toString()]![y][d]!
                                              .recreationalActivities!
                                              .isEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor: primaryYellow,
                                                duration:
                                                    const Duration(seconds: 1),
                                                content: const Text(
                                                    "No Recreational Activities Found Currently!"),
                                              ),
                                            );
                                          } else {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ListIndCatView(
                                                          RecommendData: visitRecommend
                                                              .data![
                                                                  x.toString()]![
                                                                  y][d]
                                                              ?.recreationalActivities,
                                                          Json:
                                                              singleAttractionsModelFromJson,
                                                          endPoint:
                                                              single_attractions,
                                                          title:
                                                              "Recreational Activities.",
                                                        )));
                                          }
                                        },
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.repeat_rounded,
                                            color: primaryYellow,
                                          ),
                                          title: Text(
                                            "Recreational Activities.",
                                            // "b",
                                            style: A42,
                                          ),
                                        ),
                                      ),
                                    ),

                                    //
                                    //
                                  ],
                                ),
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(26),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            height: 70.h,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(26),
                                  bottomLeft: Radius.circular(26)),
                            ),
                            child: Center(
                              child: Text("cancel", style: A42),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            height: 70.h,
                            decoration: BoxDecoration(
                              color: primaryYellow,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(26),
                                  bottomRight: Radius.circular(26)),
                            ),
                            child: Center(
                              child: GestureDetector(
                                onTap: () async {
                                  // print("hit");
                                  // var response = await base.post(saveRecommendation, saveRecommendationToJson(SaveRecommendation(userId: 33, userRecommendations: UserRecommendation(data: ))));
                                  //
                                  // if (response != null) {
                                  //   print("Success");
                                  // } else {
                                  //   print("no Success");
                                  // }
                                },
                                child: Text("Save", style: A42),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
