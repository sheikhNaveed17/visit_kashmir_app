import 'package:app2/Config/configuration.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';

class CardScroll extends StatefulWidget {
  const CardScroll({Key? key}) : super(key: key);

  @override
  State<CardScroll> createState() => _CardScrollState();
}

class _CardScrollState extends State<CardScroll> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 2.2),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print(index+1);
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
                                  imageUrl:
                                      "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vZHxlbnwwfDB8MHx8&auto=format&fit=crop&w=500&q=60",
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: imageProvider, fit: BoxFit.fill),
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
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                              vertical: 10.h,
                            ),
                            child: Text.rich(
                              TextSpan(
                                style: TextStyle(color: Colors.white),
                                children: [
                                  TextSpan(
                                    text: "Special Offer",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                      text: "Places", style: buttonInsideText),
                                ],
                              ),
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
    );
  }
}
