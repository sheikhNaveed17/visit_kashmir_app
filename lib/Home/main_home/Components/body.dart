import 'package:app2/DataModel/singleModels/single_attractionsModel.dart';
import 'package:app2/DataModel/singleModels/single_eventsModel.dart';
import 'package:app2/Home/main_home/Components/home_header.dart';
import 'package:app2/Home/main_home/Components/image_carousel.dart';
import 'package:app2/Home/main_home/Components/special_offers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Config/configuration.dart';
import '../../../DataModel/3_mainModels/3_RecreationalActivitiesModel.dart';
import '../../../DataModel/3_mainModels/3_attractionsModel.dart';
import '../../../DataModel/3_mainModels/3_eventsModel.dart';
import '../../../DataModel/3_mainModels/3_foodsModel.dart';
import '../../../DataModel/3_mainModels/3_placesModel.dart';
import '../../../DataModel/singleModels/single_foodModel.dart';
import '../../../DataModel/singleModels/single_placeModel.dart';
import '../../../DataModel/singleModels/single_recreationalModel.dart';
import '../../../Network/ApiBaseClient/ApiConstants.dart';
import '../../../customComponents/customFuture.dart';
import '../../categories/categories.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    String Foods = "Foods";
    String Places = "Places";
    String Events = "Events";
    String RecreationalActs = "Recreational Acts";
    String Attractions = "Attractions";

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            HomeHeader(),
            SizedBox(height: 10.h),
            const ImageCarousel(),
            // DiscountBanner(),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Categories",
                  style: bold18,
                ),
              ),
            ),
            Categories(),
            SpecialOffers(),
            SizedBox(height: 15.h),

            // Foods
            CustomFuture(
              endPoint: list_foods,
              title: Foods,
              displayTitle: Foods,
              singleEndPoint: single_foods,
              jSon_convert: the3FoodsModelFromJson,
              singleJsonConvert: singleFoodModelFromJson,
            ),

            // Places
            CustomFuture(
              endPoint: list_places,
              title: Places,
              displayTitle: Places,
              singleEndPoint: single_places,
              jSon_convert: the3PlacesFromJson,
              singleJsonConvert: singlePlaceModelFromJson,
            ),

            //Events
            CustomFuture(
              endPoint: list_events,
              title: Events,
              displayTitle: Events,
              jSon_convert: the3EventsModelFromJson,
              singleEndPoint: single_events,
              singleJsonConvert: singleEventsModelFromJson,
            ),

            //Recreational Activities
            CustomFuture(
              endPoint: list_RecreationalActivities,
              title: RecreationalActs,
              displayTitle: RecreationalActs,
              jSon_convert: the3RecreationalActivitiesModelFromJson,
              singleEndPoint: single_RecreationalActivities,
              singleJsonConvert: singleRecreationalModelFromJson,
            ),


            //Attractions
            CustomFuture(
              endPoint: list_attractions,
              title: Attractions,
              displayTitle: Attractions,
              jSon_convert: top3AttractionsModelFromJson,
              singleEndPoint: single_attractions,
              singleJsonConvert: singleAttractionsModelFromJson,
            ),

            // HomeScrollBody(),
            // const BuildList(),
            // SizedBox(height: getProportionateScreenWidth(30)),
            // PopularProducts(),
            // SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
