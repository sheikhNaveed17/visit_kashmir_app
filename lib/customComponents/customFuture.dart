import 'dart:ui';

import 'package:app2/DataModel/filterModel/getTop3Filter.dart';
import 'package:app2/Home/main_home/Components/section_file.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Config/configuration.dart';
import '../Home/categories/categories_body/body.dart';
import '../Network/ApiBaseClient/Base_client.dart';
import '../whereToGo/DetailScreen/detailsScreen.dart';

class CustomFuture extends StatefulWidget {

  final String title;
  final String endPoint;
  final String displayTitle;
  final String singleEndPoint;
  dynamic jSon_convert;
  dynamic singleJsonConvert;

  CustomFuture(
      {Key? key,
      required this.title,
      required this.endPoint,
      required this.displayTitle,
      required this.singleEndPoint,
      required this.jSon_convert,
      required this.singleJsonConvert})
      : super(key: key);

  @override
  State<CustomFuture> createState() => _CustomFutureState();
}

class _CustomFutureState extends State<CustomFuture> {
  BaseClient _baseClient = BaseClient();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _baseClient.post(
        widget.endPoint,
        getTop3FilterToJson(
          GetTop3Filter(
            limit: 3,
            page: 0,
            sort: Sort(rating: -1),
          ),
        ),
      ),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          // print(snapshot.data);
          // final top3Places = top3PlacesFromJson(snapshot.data);
          final top3 = widget.jSon_convert(snapshot.data);
          // print(top3);
          print(top3.data[1].coordinates?.coordinates[0]);

          return Padding(
            padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
            child: Column(
              children: [
                SectionTitle(
                  title: widget.title,
                  press: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CategoriesBody(
                          title: widget.displayTitle,
                          dynamicEndPoint: widget.endPoint,
                          Single_EndPoint: widget.singleEndPoint,
                          jSon_convert: widget.jSon_convert,
                          SingleJsonConvert: widget.singleJsonConvert,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 200.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: top3.data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 20, right: 10, bottom: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  dynamicID: top3.data[index].id,
                                  SingleEndPoint: widget.singleEndPoint,
                                  jSonConvert: widget.singleJsonConvert,
                                ),
                              ),
                            );
                            print(widget.jSon_convert);
                          },
                          child: CachedNetworkImage(
                            // imageUrl: placeData[index].imageUrl[0],
                            imageUrl: top3.data[index].images[0],
                            imageBuilder: (context, imageProvider) => Container(
                              // width: 165.2.w,
                              width: 155.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.fill,
                                ),
                                shape: BoxShape.rectangle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                    BorderRadius.circular(18),
                                                color: Colors.white
                                                    .withOpacity(0.3),
                                              ),
                                              height: 30.h,
                                              width: 46.w,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.star_rate_rounded,
                                                    size: 18.sp,
                                                    color: Colors.orangeAccent,
                                                  ),
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
                                                sigmaX: xBlur, sigmaY: yBlur),
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
                                            color:
                                                Colors.white.withOpacity(0.3),
                                          ),
                                          // height: 30.h,
                                          width: double.infinity,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
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
                                                    top3.data[index].name,
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
                            ),
                            placeholder: (context, url) => Container(
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                Image.asset("images/filenotfound.jpg"),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
