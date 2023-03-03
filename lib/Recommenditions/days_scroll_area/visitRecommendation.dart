import 'package:app2/Recommenditions/days_scroll_area/components/visitbody.dart';
import 'package:flutter/material.dart';

class VisitRecommendation extends StatefulWidget {
  dynamic data;

  VisitRecommendation({Key? key, this.data}) : super(key: key);

  @override
  State<VisitRecommendation> createState() => _VisitRecommendationState();
}

class _VisitRecommendationState extends State<VisitRecommendation> {


  @override
  Widget build(BuildContext context) {
    return VisitBody(data: widget.data);
  }
}
