import 'package:app2/Config/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

class Search_Field extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: kSecondaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          onChanged: (value) {

          },
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: "Search",
            hintStyle: categorie,
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
