import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../DataModel/singleModels/UniversalDetailScreenModel.dart';
import '../whereToGo.dart';

import 'package:app2/Config/configuration.dart';
import 'package:app2/DataModel/placesModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Network/ApiBaseClient/Base_client.dart';

class DetailScreen extends StatefulWidget {
  final int? dynamicID;
  final String SingleEndPoint;
  final dynamic jSonConvert;

  DetailScreen({
    required this.dynamicID,
    required this.SingleEndPoint,
    this.jSonConvert,
  }) : super();

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var data;
  BaseClient baseClient = BaseClient();

  LocationData? currentLocaion;

  void getCurrentLocation() {
    Location location = Location();

    location.getLocation().then(
          (location) {
        currentLocaion = location;
      },
    );
  }

  // void getPolyPoints() async {
  //   PolylinePoints polylinePoints = PolylinePoints();
  //
  //   PolylineResult results = polylinePoints.getRouteBetweenCoordinates("AIzaSyCFb-NwtyI0zLL58s5CadAmXVr85-th94M", PointLatLng(, longitude), destination)
  // }

  @override
  void initState() {
    // TODO: implement initState
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    int id = widget.dynamicID as int;
    String singleGet = widget.SingleEndPoint;
    return Scaffold(
      body: FutureBuilder(
        future: baseClient.get('$singleGet$id'),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // print(snapshot.data);
            data = universalDetailScreenModelFromJson(snapshot.data);

            print(data.data.bestTimeToVisit);
            // print(data.data.coordinates?.coordinates[0]);

          }
          return Stack(
            children: [
              ImageView(imageData: data),
              buttonArrow(context),
              GestureDetector(
                onTap: () {},
                child: DraggableScrollableSheet(
                    initialChildSize: 0.5,
                    maxChildSize: 1.0,
                    minChildSize: 0.5,
                    builder: (context, scrollController) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32)),
                        ),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(top: 10, bottom: 25),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 5.h,
                                      width: 35.w,
                                      color: Colors.black12,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                data.data.name,
                                style: subtitle,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(children: [
                                Text(
                                  "Baramulla",
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(color: primaryYellow),
                                ),
                                const Spacer(),
                                Icon(
                                  size: 18.sp,
                                  Icons.thumb_up_alt_rounded,
                                  color: Colors.teal.shade500,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "273 Likes",
                                  style: categorie,
                                ),
                              ]),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Divider(
                                  height: 4.h,
                                ),
                              ),
                              Text(
                                "Description.",
                                style: subtitle,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                data.data.description,
                                style: categorie,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 15),
                                child: Divider(
                                  height: 5.h,
                                ),
                              ),

                              //Closing & opening days
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //
                                  data.data.openingHrs == null
                                      ? const Text("")
                                      : Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Hours",
                                          style: subtitle,
                                        ),
                                        SizedBox(height: 15.h),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            padding:
                                            const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: category,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    32)),
                                            child: Text(
                                              "${data.data.openingHrs.toString()
                                                  .toUpperCase()} - ${data.data
                                                  .closingHrs.toString()
                                                  .toUpperCase()}",
                                              style: categorie,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //
                                  data.data.closingDays.isEmpty
                                      ? const Text("")
                                      : Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Close Days",
                                          style: subtitle,
                                        ),
                                        SizedBox(height: 15.h),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: SizedBox(
                                            height: 38.h,
                                            child: ListView.builder(
                                              scrollDirection:
                                              Axis.horizontal,
                                              itemCount: data.data
                                                  .closingDays.length,
                                              itemBuilder:
                                                  (context, index) {
                                                return Container(
                                                  padding:
                                                  const EdgeInsets
                                                      .all(10),
                                                  decoration: BoxDecoration(
                                                      color: category,
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          32)),
                                                  child: Text(
                                                    data
                                                        .data
                                                        .closingDays[
                                                    index]
                                                        .toString()
                                                        .toUpperCase(),
                                                    style: categorie,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //
                                ],
                              ),

                              //Starting & Ending days
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //
                                  data.data.startingHrs == null
                                      ? const Text("")
                                      : Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Hours",
                                          style: subtitle,
                                        ),
                                        SizedBox(height: 15.h),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            padding:
                                            const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: category,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    32)),
                                            child: Text(
                                              "${data.data.startingHrs
                                                  .toString()
                                                  .toUpperCase()} - ${data.data
                                                  .endingHrs.toString()
                                                  .toUpperCase()}",
                                              style: categorie,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //
                                  data.data.startDate == null
                                      ? const Text("")
                                      : Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Days",
                                          style: subtitle,
                                        ),
                                        SizedBox(height: 15.h),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            padding:
                                            const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: category,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    32)),
                                            child: Text(
                                              "${data.data.startDate
                                                  .toString()
                                                  .toUpperCase()
                                                  .characters
                                                  .take(10)} - ${data.data
                                                  .endDate
                                                  .toString()
                                                  .toUpperCase()
                                                  .characters
                                                  .take(10)}",
                                              style: categorie,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //
                                ],
                              ),

                              data.data.bestTimeToVisit == null
                                  ? const SizedBox(height: 0,)
                                  : Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Best time to visit.",
                                      style: subtitle,
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: category,
                                          borderRadius:
                                          BorderRadius.circular(32)),
                                      child: Text(
                                        data.data.bestTimeToVisit
                                            .toString()
                                            .toUpperCase(),
                                        style: categorie,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Divider(
                                      height: 5.h,
                                    ),
                                  ),
                                ],
                              ),

                              //known For
                              data.data.knownFor.isEmpty
                                  ? const SizedBox(height: 0,)
                                  : Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Known for.",
                                        style: subtitle),
                                  ),
                                  SizedBox(
                                    height: 72.h,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                      data.data.knownFor.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            Container(
                                              padding:
                                              const EdgeInsets.all(
                                                  10),
                                              margin:
                                              const EdgeInsets.only(
                                                  right: 10),
                                              decoration: BoxDecoration(
                                                  color: category,
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(32)),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    data.data
                                                        .knownFor[index]
                                                        .toString()
                                                        .toUpperCase(),
                                                    style: categorie,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),

                              //Must Do
                              data.data.mustDo.isEmpty
                                  ? const SizedBox(height: 0,)
                                  : Column(
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Divider(
                                      height: 5.h,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Must Do.",
                                        style: subtitle),
                                  ),
                                  SizedBox(
                                    height: 72.h,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                      data.data.mustDo.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            Container(
                                              padding:
                                              const EdgeInsets.all(
                                                  10),
                                              margin:
                                              const EdgeInsets.only(
                                                  right: 10),
                                              decoration: BoxDecoration(
                                                  color: category,
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(32)),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    data.data
                                                        .mustDo[index]
                                                        .toString()
                                                        .toUpperCase(),
                                                    style: categorie,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),

                              //Things to do
                              data.data.thingsToDo.isEmpty
                                  ? const SizedBox(height: 0,)
                                  : Column(
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Divider(
                                      height: 5.h,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Things To Do.",
                                        style: subtitle),
                                  ),
                                  SizedBox(
                                    height: 72.h,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                      data.data.thingsToDo.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            Container(
                                              padding:
                                              const EdgeInsets.all(
                                                  10),
                                              margin:
                                              const EdgeInsets.only(
                                                  right: 10),
                                              decoration: BoxDecoration(
                                                  color: category,
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(32)),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    data.data
                                                        .thingsToDo[index]
                                                        .toString()
                                                        .toUpperCase(),
                                                    style: categorie,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),

                              //Review Links
                              data.data.reviewLinks.isEmpty
                                  ? const SizedBox(height: 0,)
                                  : Column(
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Divider(
                                      height: 5.h,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Review Links.",
                                        style: subtitle),
                                  ),
                                  SizedBox(
                                    height: 72.h,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                      data.data.reviewLinks.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            Container(
                                              padding:
                                              const EdgeInsets.all(
                                                  10),
                                              margin:
                                              const EdgeInsets.only(
                                                  right: 10),
                                              decoration: BoxDecoration(
                                                  color: category,
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(32)),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    data.data
                                                        .reviewLinks[index]
                                                        .toString()
                                                        .toUpperCase(),
                                                    style: categorie,
                                                    

                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),


                              //cuisines
                              data.data.cuisines.isEmpty
                                  ? const SizedBox(height: 0,)
                                  : Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Divider(
                                      height: 5.h,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Cuisines.",
                                        style: subtitle),
                                  ),
                                  SizedBox(
                                    height: 72.h,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                      data.data.cuisines.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceEvenly,
                                            children: [
                                        Container(
                                        padding:
                                        const EdgeInsets.all(
                                            10),
                                        margin:
                                        const EdgeInsets.only(
                                            right: 10),
                                        decoration: BoxDecoration(
                                        color: category,
                                        borderRadius:
                                        BorderRadius
                                            .circular(32)),
                                        child: Row(
                                        children: [
                                        Text(
                                        data.data
                                            .cuisines[index]
                                            .toString()
                                            .toUpperCase(),
                                        style: categorie,
                                        ),
                                        ],
                                        ),
                                        ),
                                        ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),

                              //Seniour Room
                              data.data.seniorCetizenCompatibility == null
                                  ? const SizedBox(height: 0)
                                  : Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Divider(
                                      height: 5.h,
                                    ),
                                  ),
                                  Text(
                                    "Senior Citizen Compatibility.",
                                    style: subtitle,
                                  ),
                                  SizedBox(height: 15.h),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: category,
                                          borderRadius:
                                          BorderRadius.circular(32)),
                                      child: Text(
                                        data.data.seniorCetizenCompatibility ==
                                            true
                                            ? "Yes"
                                            : "No",
                                        style: categorie,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              //Rest Room
                              data.data.restroomAvailability == null
                                  ? const SizedBox(height: 0,)
                                  : Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Divider(
                                      height: 5.h,
                                    ),
                                  ),
                                  Text(
                                    "Rest Room Availability.",
                                    style: subtitle,
                                  ),
                                  SizedBox(height: 15.h),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: category,
                                          borderRadius:
                                          BorderRadius.circular(32)),
                                      child: Text(
                                        data.data.restroomAvailability ==
                                            true
                                            ? "Yes"
                                            : "No",
                                        style: categorie,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //
                                  data.data.pureVeg == null
                                      ? const SizedBox(height: 0,)
                                      : Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              vertical: 15),
                                          child: Divider(
                                            height: 5.h,
                                          ),
                                        ),
                                        Text(
                                          "Pure Veg Food.",
                                          style: subtitle,
                                        ),
                                        SizedBox(height: 15.h),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            padding:
                                            const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: category,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    32)),
                                            child: Text(
                                              data.data.pureVeg == true
                                                  ? "Yes"
                                                  : "No",
                                              style: categorie,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  //
                                  data.data.petsAllowed == null
                                      ? const SizedBox(height: 0,)
                                      : Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              vertical: 15),
                                          child: Divider(
                                            height: 5.h,
                                          ),
                                        ),
                                        Text(
                                          "Pets Allowed.",
                                          style: subtitle,
                                        ),
                                        SizedBox(height: 15.h),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            padding:
                                            const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: category,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    32)),
                                            child: Text(
                                              data.data.petsAllowed ==
                                                  true
                                                  ? "Yes"
                                                  : "No",
                                              style: categorie,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              //modeOfPayment
                              data.data.modeOfPayment.isEmpty
                                  ? const SizedBox(height: 0,)
                                  : Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Divider(
                                      height: 5.h,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Mode of Payments.",
                                        style: subtitle),
                                  ),
                                  SizedBox(
                                    height: 72.h,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                      data.data.modeOfPayment.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            Container(
                                              padding:
                                              const EdgeInsets.all(
                                                  10),
                                              margin:
                                              const EdgeInsets.only(
                                                  right: 10),
                                              decoration: BoxDecoration(
                                                  color: category,
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(32)),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    data.data
                                                        .modeOfPayment[index]
                                                        .toString()
                                                        .toUpperCase(),
                                                    style: categorie,
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),

                              //modeOfBooking
                              data.data.modeOfBooking.isEmpty
                                  ? const SizedBox(height: 0,)
                                  : Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Divider(
                                      height: 5.h,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Mode of Bookings.",
                                        style: subtitle),
                                  ),
                                  SizedBox(
                                    height: 72.h,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                      data.data.modeOfBooking.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            Container(
                                              padding:
                                              const EdgeInsets.all(
                                                  10),
                                              margin:
                                              const EdgeInsets.only(
                                                  right: 10),
                                              decoration: BoxDecoration(
                                                  color: category,
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(32)),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    data.data
                                                        .modeOfBooking[index]
                                                        .toString()
                                                        .toUpperCase(),
                                                    style: categorie,
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),

                              //extras
                              data.data.extras.isEmpty
                                  ? const SizedBox(height: 0,)
                                  : Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Divider(
                                      height: 5.h,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Extras.",
                                        style: subtitle),
                                  ),
                                  SizedBox(
                                    height: 72.h,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                      data.data.extras.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            Container(
                                              padding:
                                              const EdgeInsets.all(
                                                  10),
                                              margin:
                                              const EdgeInsets.only(
                                                  right: 10),
                                              decoration: BoxDecoration(
                                                  color: category,
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(32)),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    data.data
                                                        .extras[index]
                                                        .toString()
                                                        .toUpperCase(),
                                                    style: categorie,
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10),
                                child: Divider(
                                  height: 5.h,
                                ),
                              ),

                              Text(
                                "Map Location.",
                                style: subtitle,
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              SizedBox(
                                height: 200.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: GoogleMap(
                                    initialCameraPosition: CameraPosition(
                                        target: LatLng(
                                            data.data.coordinates
                                                ?.coordinates[1],
                                            data.data.coordinates
                                                ?.coordinates[0]),
                                        zoom: 12),
                                    markers: {
                                      Marker(
                                        markerId: const MarkerId("source"),
                                        position: LatLng(
                                            data.data.coordinates
                                                ?.coordinates[1],
                                            data.data.coordinates
                                                ?.coordinates[0]),
                                      ),
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          );
        },
      ),
    );
  }
}

buttonArrow(BuildContext context) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 45.h,
          width: 45.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 55.h,
              width: 55.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
