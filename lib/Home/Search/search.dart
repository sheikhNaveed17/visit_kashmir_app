import 'package:app2/Home/Search/components/search_body.dart';
import 'package:flutter/material.dart';

class search extends StatelessWidget {
  const search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Search_Body(),
    );
  }
}
