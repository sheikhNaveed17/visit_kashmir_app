import 'package:app2/Config/configuration.dart';
import 'package:app2/DataModel/carouselModel.dart';
import 'package:app2/customComponents/ListBuild.dart';
import 'package:app2/customComponents/customHeroCarousel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: AnimatedContainer(
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor)
            ..rotateY(isDrawerOpen ? -0.0 : 0),
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
              color: Colors.white,
              // color: primaryYellow,
              borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isDrawerOpen
                          ? IconButton(
                              icon: const Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                setState(() {
                                  xOffset = 0;
                                  yOffset = 0;
                                  scaleFactor = 1;
                                  isDrawerOpen = false;
                                });
                              },
                            )
                          : IconButton(
                              icon: const Icon(Icons.menu),
                              onPressed: () {
                                setState(() {
                                  xOffset = 230;
                                  yOffset = 150;
                                  scaleFactor = 0.6;
                                  isDrawerOpen = true;
                                });
                              }),
                      Column(
                        children:  [
                          Text('Travello.', textAlign: TextAlign.center, style: bold18),
                        ],
                      ),
                      // const Icon(Icons.notifications_active_rounded),
                      const CircleAvatar()
                    ],
                  ),
                ),


                //Carousel
                Column(
                  children: [
                    Container(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 1.9,
                          viewportFraction: .8,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                        ),
                        items: Category.categories
                            .map((category) =>
                                HeroCarouseCard(category: category))
                            .toList(),
                      ),
                    ),
                  ],
                ),

                //Categories
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Categories", style: subtitle),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    SizedBox(
                      height: 72,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                margin: const EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                    color: category,
                                    borderRadius: BorderRadius.circular(32)),
                                child: Row(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: categories[index]['iconPath'],
                                      imageBuilder: (context, imageProvider) =>
                                          CircleAvatar(
                                        backgroundImage: imageProvider,
                                        radius: 20.h,
                                      ),
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          CircleAvatar(
                                        backgroundImage: const AssetImage(
                                            "images/filenotfound.jpg"),
                                        radius: 20.h,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      categories[index]['name'],
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

                const BuildList(),

                SizedBox(
                  height: 100.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
