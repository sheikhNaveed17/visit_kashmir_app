

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class cameraAccess extends StatefulWidget {

  @override
  State<cameraAccess> createState() => _cameraAccessState();

}

class _cameraAccessState extends State<cameraAccess> {

  File? _image;
  final imagePicker = ImagePicker();

  Future getImage() async{
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if( image ==  null) return;

    final imageTem = File(image.path);
    setState(() {
      this._image = imageTem;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }

}
