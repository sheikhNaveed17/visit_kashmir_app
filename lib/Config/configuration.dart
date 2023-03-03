import 'package:app2/DataModel/placesModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Colors
Color primaryGreen = const Color(0xff416d6d);

Color primaryYellow = const Color(0xffFCA82F);

Color primaryLightYellow = const Color(0xffFED69D);

Color primaryBG = const Color(0xff6469D4);

Color smallFont = const Color(0xff89A4C5);

Color bigFont = const Color(0xff294D77);

Color white = const Color(0xffffffff);

Color secondRectangle = const Color(0x99ffffff);

Color category = const Color(0x99F4F4F4);

Color thirdRectangle = const Color(0x33ffffff);

Color bgColor = const Color(0xff6469D4);

Color radius = const Color(0xffD9D9D9);

Color transparent = const Color(0x00ffffff);

//Explore colors
Color ePrimary = const Color(0xff20B08E);

Color eFont = const Color(0xff000000);

// Text Styles

TextStyle privacy =TextStyle(
fontSize: 10.5.sp,
fontWeight: FontWeight.w600,
fontFamily: 'Montserrat',
color: smallFont,
);

TextStyle semiBold46 = TextStyle(
  fontSize: 46.sp,
  color: bigFont,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
);

TextStyle semiBold28 = TextStyle(
  fontSize: 28.sp,
  color: bigFont,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
);

TextStyle light42 = TextStyle(
  fontSize: 34.sp,
  fontWeight: FontWeight.w300,
  fontFamily: 'Montserrat',
  color: bigFont,
);

TextStyle Light42 = TextStyle(
  fontSize: 22.sp,
  fontWeight: FontWeight.w300,
  fontFamily: 'Montserrat',
  color: bigFont,
);

TextStyle A42 = TextStyle(
  fontSize: 16.sp,
  fontWeight: FontWeight.w500,
  fontFamily: 'Montserrat',
  color: bigFont,
);

TextStyle Light42White = TextStyle(
  fontSize: 24.sp,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
  color: white,
);

TextStyle bold18 = TextStyle(
  fontSize: 18.sp,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
  color: bigFont,
);

TextStyle bold14 = TextStyle(
  fontSize: 14.sp,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
  color: bigFont,
);

TextStyle medium16 = TextStyle(
  height: 2.h,
  fontSize: 12.sp,
  color: smallFont,
  fontWeight: FontWeight.w500,
  fontFamily: 'Montserrat',
);

TextStyle buttonText = TextStyle(
  fontSize: 16.sp,
  color: white,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
);

TextStyle question = TextStyle(
  fontSize: 18.sp,
  color: white,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
);

TextStyle subtitle = TextStyle(
  fontSize: 16.sp,
  color: bigFont,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
);

TextStyle internalQ = TextStyle(
  fontSize: 14.sp,
  color: bigFont,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
);

TextStyle buttonInsideText = TextStyle(
  fontSize: 12.sp,
  color: smallFont,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
);

TextStyle buttonInsideTextBlack = TextStyle(
  fontSize: 12.sp,
  color: Colors.black,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
);

TextStyle buttonInsideTextTap = TextStyle(
  fontSize: 12.sp,
  color: white,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
);

TextStyle info = TextStyle(
  fontSize: 9.sp,
  color: primaryYellow,
  fontWeight: FontWeight.w400,
  fontFamily: 'Montserrat',
  height: 1.8.h,
);

TextStyle info2 = TextStyle(
  fontSize: 9.sp,
  color: smallFont,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
);

TextStyle intrestText = TextStyle(
  fontSize: 9.sp,
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
);

TextStyle rating = TextStyle(
  fontSize: 10.sp,
  color: smallFont,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
);

TextStyle rating_fCard = TextStyle(
  fontSize: 10.sp,
  color: white,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
);

TextStyle Cardname = TextStyle(
  fontSize: 10.sp,
  color: white,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
);

TextStyle CardnNameList = TextStyle(
  fontSize: 10.sp,
  color: smallFont,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
);

TextStyle CardnNameListSeeMore = TextStyle(
  fontSize: 10.sp,
  color: ePrimary,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
);

TextStyle checkbox = TextStyle(
  fontSize: 12.sp,
  color: smallFont,
  fontWeight: FontWeight.w500,
  fontFamily: 'Montserrat',
);

TextStyle dayFont = TextStyle(
  fontSize: 12.sp,
  color: primaryYellow,
  fontWeight: FontWeight.w700,
  fontFamily: 'Montserrat',
);

TextStyle categorie = TextStyle(
  fontSize: 12.sp,
  color: smallFont,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
);

TextStyle smallTextWhite = TextStyle(
  fontSize: 12.sp,
  color: white,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
);

TextStyle wizardSub = TextStyle(
  fontSize: 10.sp,
  color: smallFont,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
);

TextStyle inputStyle = TextStyle(
  fontSize: 16.sp,
  color: bigFont,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w500,
);

//Shadows

BoxShadow shadow = const BoxShadow(
  color: Colors.black38,
  offset: Offset(1.0, 1.0),
  blurRadius: 5.0,
  spreadRadius: 2.0,
);

OutlineInputBorder inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(20),
  borderSide: BorderSide(color: primaryYellow),
  gapPadding: 10.w,
);

//blur constants
double xBlur = 3.0;
double yBlur = 3.0;

//Containers
Container rect2 = Container(
  width: 270.w,
  height: 28.h,
  decoration: BoxDecoration(
    borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(28), bottomLeft: Radius.circular(28)),
    color: secondRectangle,
  ),
);

Container rect3 = Container(
  width: 220.w,
  height: 22.h,
  decoration: BoxDecoration(
    borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(28), bottomLeft: Radius.circular(28)),
    color: thirdRectangle,
  ),
);

List<BoxShadow> shadowList = [
  BoxShadow(
      color: Colors.grey.shade300, blurRadius: 30, offset: const Offset(0, 10))
];

List<Map> categories = [
  {
    'id': 1,
    'name': 'Mountains',
    'iconPath':
        'https://images.unsplash.com/photo-1621232051504-dc6f30ba8bc6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=8'
  },
  {
    'id': 2,
    'name': 'Mountains',
    'iconPath':
        'https://images.unsplash.com/photo-1621232051504-dc6f30ba8bc6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=8'
  },
  {
    'id': 3,
    'name': 'Camp',
    'iconPath':
        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vZHxlbnwwfDB8MHx8&auto=format&fit=crop&w=500&q=60'
  },
  {
    'id': 4,
    'name': 'Camp',
    'iconPath':
        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vZHxlbnwwfDB8MHx8&auto=format&fit=crop&w=500&q=60'
  },
];

List<Map> wizardSelection = [
  {
    'name': 'Already Booked.',
    'themeBgColor': const Color(0xff6469D4),
    'themeActionColor': const Color(0xffFCA82F),
    'themeFontColor': const Color(0xffffffff),
  },
  {
    'name': 'Explore With Us.',
    'themeBgColor': const Color(0xffFFFFFF),
    'themeActionColor': const Color(0xff20B08E),
    'themeFontColor': const Color(0xff000000),
  }
  // {
  //   'id': 1,
  //   'name': 'Bookings.',
  //   'themeBgColor': '',
  //   'themeActionColor':'',
  // },
  // {
  //   'id': 1,
  //   'name': 'Cabs.',
  //   'themeBgColor': '',
  //   'themeActionColor':'',
  // },
];

List<Map> intrests = [
  {'name': 'Site Seeing', 'iconPath': 'images/cat.png'},
  {'name': 'Dogs', 'iconPath': 'images/dog.png'},
  {'name': 'Bunnies', 'iconPath': 'images/rabbit.png'},
  {'name': 'Parrots', 'iconPath': 'images/parrot.png'},
  {'name': 'Horses', 'iconPath': 'images/horse.png'},
  {'name': 'Garden', 'iconPath': 'images/garden.png'}
];

// final List<placesModel> placeData = [
//   placesModel(
//     id: 1,
//     placeName: 'Pehalgam.',
//     description: 'Welcome to Gulmarg',
//     imageUrl: [
//       'https://images.unsplash.com/photo-1646203028626-b5a3b2b54055?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
//       'https://images.unsplash.com/photo-1621232082074-1a7750ecc557?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80',
//       'https://images.unsplash.com/photo-1539281519211-a00594329a42?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Z3VsbWFyZ3xlbnwwfDF8MHx8&auto=format&fit=crop&w=500&q=60'
//     ],
//   ),
//   placesModel(
//     id: 1,
//     placeName: 'Gulmarg.',
//     description: 'Welcome to Gulmarg',
//     imageUrl: [
//       'https://images.unsplash.com/photo-1646203028626-b5a3b2b54055?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
//       'https://images.unsplash.com/photo-1621232082074-1a7750ecc557?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80',
//       'https://images.unsplash.com/photo-1539281519211-a00594329a42?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Z3VsbWFyZ3xlbnwwfDF8MHx8&auto=format&fit=crop&w=500&q=60'
//     ],
//   ),
//   placesModel(
//     id: 1,
//     placeName: 'Gulmarg',
//     description: 'Welcome to Gulmarg',
//     imageUrl: [
//       'https://images.unsplash.com/photo-1646203028626-b5a3b2b54055?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
//       'https://images.unsplash.com/photo-1621232082074-1a7750ecc557?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80',
//       'https://images.unsplash.com/photo-1539281519211-a00594329a42?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Z3VsbWFyZ3xlbnwwfDF8MHx8&auto=format&fit=crop&w=500&q=60'
//     ],
//   ),
//   placesModel(
//     id: 1,
//     placeName: 'Gulmarg',
//     description: 'Welcome to Gulmarg',
//     imageUrl: [
//       'https://images.unsplash.com/photo-1646203028626-b5a3b2b54055?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
//       'https://images.unsplash.com/photo-1621232082074-1a7750ecc557?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80',
//       'https://images.unsplash.com/photo-1539281519211-a00594329a42?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Z3VsbWFyZ3xlbnwwfDF8MHx8&auto=format&fit=crop&w=500&q=60'
//     ],
//   )
// ];
