import 'package:flutter/material.dart';

import 'Components/VerifyBody.dart';

class CompleteProfileScreen extends StatelessWidget {
  dynamic data;

  CompleteProfileScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: VerifyBody(
        data: data,
      ),
    ));
  }
}
