import 'package:app2/Config/configuration.dart';
import 'package:app2/Home/Cards/all_special_cards.dart';
import 'package:app2/Home/main_home/Components/section_file.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialOffers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: SectionTitle(
            title: "Suggested Plans",
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ALLSpecialCards(),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image:
                    'https://images.unsplash.com/photo-1621232051504-dc6f30ba8bc6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=8',
                category: "Hill-Station RoundTrip",
                numOfBrands: 5,
                press: () {
                  print("hi");
                },
              ),
              SpecialOfferCard(
                image:
                    'https://images.unsplash.com/photo-1568454537842-d933259bb258?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                category: "Great Lakes Trek",
                numOfBrands: 4,
                press: () {},
              ),
              SizedBox(
                width: 20.w,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  SpecialOfferCard({
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  });

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: press,
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
                        imageUrl: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vZHxlbnwwfDB8MHx8&auto=format&fit=crop&w=500&q=60",
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.fill
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
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                            text: "$numOfBrands Places",
                            style: buttonInsideText),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
