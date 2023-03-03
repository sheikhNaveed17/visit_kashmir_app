// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:app2/Config/configuration.dart';
import 'package:app2/DataModel/categoryModel.dart';
import 'package:app2/Network/ApiBaseClient/Base_client.dart';
import 'package:app2/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Network/ApiBaseClient/ApiConstants.dart';
import 'categories_body/body.dart';
import 'categories_body/scroll_list.dart';

class Categories extends StatefulWidget {
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> with TickerProviderStateMixin {
  final controller = ScrollController();

  BaseClient _baseClient = BaseClient();

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 8, bottom: 10),
      child: SizedBox(
        height: 110.h,
        child: FutureBuilder(
          future: _baseClient.get(categories_list),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              print(snapshot.data);
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<dynamic> cat = categoryFromJson(snapshot.data);
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cat.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    icon: cat[index].icon,
                    text: cat[index].text,
                    press: () {
                      print(
                        cat[index].icon,
                      );
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const ScrollList(),
                      //   ),
                      // );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.icon,
    required this.text,
    required this.press,
  });

  final String icon;
  final String text;
  final GestureTapCallback press;

  // final dynamic ad = Icons.add;
  @override
  Widget build(BuildContext context) {
    // print(icon);
    String iconC = 'e407  ';
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 80.w,
        child: Column(
          children: [
            Container(
              height: 55.h,
              width: 55.w,
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                IconData(int.parse('0x$icon'), fontFamily: 'MaterialIcons'),
                color: ePrimary,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              style: buttonInsideText,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
