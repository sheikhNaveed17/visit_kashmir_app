import 'package:app2/Config/configuration.dart';
import 'package:app2/Home/Search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => search(),
            ),
          );
        },
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
              prefixIcon: const Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}

// TextField(
// onChanged: (value) {},
// decoration: InputDecoration(
// enabledBorder: InputBorder.none,
// focusedBorder: InputBorder.none,
// hintText: "Search",
// hintStyle: categorie,
// prefixIcon: Icon(Icons.search),
// ),
// ),
