import 'package:flutter/material.dart';

import 'Components/Otpbody.dart';

class OtpScreen extends StatelessWidget {
  dynamic data;
  dynamic EndPoint;
  OtpScreen({
    Key? key,
    this.data,
    this.EndPoint
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(data);
    print(EndPoint);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: OtpBody(data: data, EndPoint: EndPoint),
      ),
    );
  }
}
