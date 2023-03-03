import 'package:app2/Config/camerAccess.dart';
import 'package:app2/Config/configuration.dart';
import 'package:app2/Home/halfWay.dart';
import 'package:app2/customComponents/customBasicUI.dart';
import 'package:app2/customComponents/customOption.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class itineraryUpload extends StatefulWidget {

  var data;

  itineraryUpload({Key? key, required this.data}) : super(key: key);

  @override
  State<itineraryUpload> createState() => _itineraryUploadState();
}

class _itineraryUploadState extends State<itineraryUpload> {



  String question = "Hey ! Can you please share your travel itinerary ?";

  String yes = "Upload Docs.";
  String no = "Take a Picture";

  @override
  Widget build(BuildContext context) {
    return customBasicUI(
      questionCounter: 2,
      count: 2,
      countBar: 1.0,
      WidgetList: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Image.asset(
                'images/page2.png',
                height: 130.h,
                width: 130.w,
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                question,
                textAlign: TextAlign.center,
                style: internalQ,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "To help you get most out from your trip !",
                textAlign: TextAlign.center,
                style: info,
              ),
              SizedBox(
                height: 12.h,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    print("yes");
                  });
                },
                child: customOption(
                  message: yes,
                  btnColo: transparent,
                  btnTextClrTap: buttonInsideText,
                  isIconShow: true,
                  icon: Icons.cloud_upload,
                  iconColor: primaryYellow,
                  width: 300,
                  height: 53,
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    print("no");
                    cameraAccess();

                  });
                },
                child: customOption(
                  message: no,
                  btnColo: transparent,
                  btnTextClrTap: buttonInsideText,
                  isIconShow: true,
                  icon: Icons.camera_alt_rounded,
                  iconColor: primaryYellow,
                  width: 300,
                  height: 53,
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.data.itineraryType ="manual Form";
                    print(widget.data.toJson());
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => halfWay(data: widget.data)));
                  });
                },
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: "Don’t have an Itinerary ? No worries !\n",
                    style: info2,
                    children: [
                      TextSpan(
                        text:
                            "Answer “5” question to help us mould a great trip for you.",
                        style: info,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
