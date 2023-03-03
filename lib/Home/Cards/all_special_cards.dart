import 'package:app2/Home/Cards/card_scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../categories/categories_body/categories_header.dart';

class ALLSpecialCards extends StatefulWidget {
  const ALLSpecialCards({Key? key}) : super(key: key);

  @override
  State<ALLSpecialCards> createState() => _ALLSpecialCardsState();
}

class _ALLSpecialCardsState extends State<ALLSpecialCards> {
  @override
  Widget build(BuildContext context) {
    var title = "Suggested Plans";
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CategoriesHeader(title: title, showIcons: true),
            SizedBox(height: 2.h, ),
            const CardScroll(),
          ],
        ),
      ),
    );
  }
}
