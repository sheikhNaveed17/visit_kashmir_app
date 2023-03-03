import 'package:app2/Home/categories/categories_body/scroll_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Config/configuration.dart';
import 'categories_header.dart';


class CategoriesBody extends StatefulWidget {
  final String? title;
  final String? dynamicEndPoint;
  final String? Single_EndPoint;
  final dynamic jSon_convert;
  final dynamic SingleJsonConvert;

  const CategoriesBody({Key? key, this.dynamicEndPoint, this.jSon_convert, this.Single_EndPoint, this.SingleJsonConvert, this.title }) : super(key: key);

  @override
  State<CategoriesBody> createState() => _CategoriesBodyState();
}

class _CategoriesBodyState extends State<CategoriesBody> {
  @override
  Widget build(BuildContext context) {

    print(widget.dynamicEndPoint);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CategoriesHeader(title: widget.title, showIcons: true),
            // SizedBox(height: 2.h, ),
            ScrollList(dynamicEndPoint: widget.dynamicEndPoint, jSonConvert: widget.jSon_convert, SingleEndPoint: widget.Single_EndPoint as String, SingleJSonConvert: widget.SingleJsonConvert, ),
          ],
        ),
      ),
    );
  }
}
