import 'package:app2/Config/configuration.dart';
import 'package:app2/Home/main_home/Components/section_file.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildList extends StatefulWidget {
  const BuildList({Key? key}) : super(key: key);

  @override
  State<BuildList> createState() => _BuildListState();
}

class _BuildListState extends State<BuildList>
    with SingleTickerProviderStateMixin {

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  bool isGrid = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: SectionTitle(
            title: "Trave Places",
            press: () {
              print("object");
            },
          ),
        ),

        // isGrid
        //     ? Padding(
        //       padding: const EdgeInsets.all(20.0),
        //       child: GridView.builder(
        //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //             crossAxisCount: 2,
        //             mainAxisExtent: 170,
        //             crossAxisSpacing: 15,
        //             mainAxisSpacing: 15,
        //           ),
        //           itemCount: placeData.length,
        //           primary: false,
        //           shrinkWrap: true,
        //           itemBuilder: (context, index) {
        //             return GestureDetector(
        //               onTap: () {
        //                 Navigator.of(context).push(MaterialPageRoute(
        //                     builder: (context) => DetailScreen(
        //                           placesmodel: placeData[index],
        //                         )));
        //               },
        //               child: CachedNetworkImage(
        //                 imageUrl: placeData[index].imageUrl[0],
        //                 imageBuilder: (context, imageProvider) => Container(
        //                   decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(14),
        //                     image: DecorationImage(
        //                         image: imageProvider, fit: BoxFit.fill
        //                     ),
        //                     // shape: BoxShape.rectangle,
        //                   ),
        //                   child: Padding(
        //                     padding: const EdgeInsets.all(12.0),
        //                     child: Column(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: [
        //                         Row(
        //                           mainAxisAlignment:
        //                               MainAxisAlignment.spaceBetween,
        //                           children: [
        //                             Container(
        //                               decoration: BoxDecoration(
        //                                 borderRadius: BorderRadius.circular(18),
        //                                 color: Colors.white70,
        //                               ),
        //                               height: 30.h,
        //                               width: 46.w,
        //                               child: Row(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.center,
        //                                 children: [
        //                                   Icon(
        //                                     Icons.star_rate_rounded,
        //                                     size: 18.sp,
        //                                     color: Colors.orangeAccent,
        //                                   ),
        //                                   Text("4.3", style: rating),
        //                                 ],
        //                               ),
        //                             ),
        //                             Container(
        //                               decoration: const BoxDecoration(
        //                                 color: Colors.white24,
        //                                 shape: BoxShape.circle,
        //                               ),
        //                               height: 30.h,
        //                               width: 30.w,
        //                               child: GestureDetector(
        //                                 onTap: () {
        //                                   setState(() {});
        //                                 },
        //                                 child: Icon(
        //                                   Icons.favorite,
        //                                   size: 18.sp,
        //                                   color: Colors.red,
        //                                 ),
        //                               ),
        //                             ),
        //                           ],
        //                         ),
        //                         Container(
        //                           decoration: BoxDecoration(
        //                             borderRadius: BorderRadius.circular(18),
        //                             color: Colors.black45,
        //                           ),
        //                           // height: 30.h,
        //                           width: double.infinity,
        //                           child: Padding(
        //                             padding: const EdgeInsets.all(5.0),
        //                             child: Row(
        //                               mainAxisAlignment:
        //                                   MainAxisAlignment.start,
        //                               children: [
        //                                 Icon(
        //                                   Icons.location_on,
        //                                   size: 18.sp,
        //                                   color: Colors.red,
        //                                 ),
        //                                 SizedBox(
        //                                   width: 6.w,
        //                                 ),
        //                                 Expanded(
        //                                   flex: 2,
        //                                   child: Text(
        //                                     placeData[index].placeName,
        //                                     style: Cardname,
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //                 placeholder: (context, url) => Container(
        //                   alignment: Alignment.center,
        //                   child: const CircularProgressIndicator(),
        //                 ),
        //                 errorWidget: (context, url, error) =>
        //                     Image.asset("images/filenotfound.jpg"),
        //               ),
        //             );
        //           },
        //         ),
        //     ) :
        SizedBox(
          height: 200.h,
          child: Container(
            padding: const EdgeInsets.only(left: 12, top: 12),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => DetailScreen(
                      //       placesmodel: placeData[index],
                      //     ),
                      //   ),
                      // );
                    },
                    child: CachedNetworkImage(
                      imageUrl: "",
                      imageBuilder: (context, imageProvider) => Container(
                        width: 165.2.w,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: Colors.white70,
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
                                        Text("4.3", style: rating),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white70,
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
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.black45,
                                ),
                                // height: 30.h,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 18.sp,
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        width: 6.w,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          "na",
                                          style: Cardname,
                                        ),
                                      ),
                                    ],
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
        ),
      ],
    );
  }
}
