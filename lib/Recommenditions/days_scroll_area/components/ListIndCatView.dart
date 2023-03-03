import 'dart:ui';
import 'package:app2/whereToGo/DetailScreen/detailsScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Config/configuration.dart';
import '../../../Home/categories/categories_body/categories_header.dart';
import '../../../constants.dart';

class ListIndCatView extends StatefulWidget {
  dynamic RecommendData;
  dynamic Json;
  dynamic endPoint;
  String title;

  ListIndCatView({Key? key, this.RecommendData, this.Json, this.endPoint, required this.title}) : super(key: key);

  @override
  State<ListIndCatView> createState() => _ListIndCatViewState();
}

class _ListIndCatViewState extends State<ListIndCatView> {
  @override
  Widget build(BuildContext context) {
    var imageUrl = "";
    bool urlC = true;

    if (widget.RecommendData[1]['images'][0] == null) {
      urlC = false;
    } else {
      urlC = true;
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CategoriesHeader(title: widget.title, showIcons: false),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 1.8),
                itemCount: widget.RecommendData.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(
                                dynamicID: widget.RecommendData[index]['_id'],
                                jSonConvert: widget.Json,
                                SingleEndPoint: widget.endPoint,
                              ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Material(
                        elevation: 3,
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: kSecondaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.all(5),
                          child: SizedBox(
                            width: 242.w,
                            height: 110.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Expanded(
                                        child: CachedNetworkImage(
                                          imageUrl: urlC
                                              ? widget.RecommendData[index]
                                          ['images'][0]
                                              : "",
                                          imageBuilder:
                                              (context, imageProvider) =>
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.fill),
                                                ),
                                              ),
                                          placeholder: (context, url) =>
                                              Container(
                                                alignment: Alignment.center,
                                                child:
                                                const CircularProgressIndicator(),
                                              ),
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                                  "images/filenotfound.jpg",
                                                  fit: BoxFit.fill),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            ClipRect(
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                  sigmaY: xBlur,
                                                  sigmaX: yBlur,
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        18),
                                                    color: Colors.black
                                                        .withOpacity(0.3),
                                                  ),
                                                  height: 30.h,
                                                  width: 52.w,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      Icon(
                                                        Icons.star_rate_rounded,
                                                        size: 18.sp,
                                                        color:
                                                        Colors.orangeAccent,
                                                      ),
                                                      SizedBox(width: 5.w),
                                                      Text("4.3",
                                                          style: rating_fCard),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            ClipRect(
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: xBlur,
                                                    sigmaY: yBlur),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withOpacity(0.3),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  height: 30.h,
                                                  width: 30.w,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.favorite,
                                                      size: 18.sp,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        ClipRect(
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaY: yBlur, sigmaX: xBlur),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(18),
                                                color: Colors.white
                                                    .withOpacity(0.3),
                                              ),
                                              // height: 30.h,
                                              width: double.infinity,
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(5.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.pin_drop,
                                                      size: 18.sp,
                                                      color: Colors.red,
                                                    ),
                                                    SizedBox(
                                                      width: 6.w,
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        widget.RecommendData[
                                                        index]['name'],
                                                        style: Cardname,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
