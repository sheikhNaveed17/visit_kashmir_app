// import 'package:app2/DataModel/placesModel.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class VideoView extends StatelessWidget {
//
//   VideoView({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ProductVideo();
//   }
// }
//
// class ProductVideo extends StatefulWidget {
//
//
//   const ProductVideo({
//     Key? key,
//   }) : super(key: key);
//
//
//   @override
//   State<ProductVideo> createState() => _ProductVideoState();
// }
//
// class _ProductVideoState extends State<ProductVideo> {
//   int selectedImage = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         SizedBox(
//           // clipBehavior: Clip.hardEdge,
//           width: double.infinity,
//           height: 360.h,
//           child: Image.network(
//             widget.placemodel.imageUrl[selectedImage],
//             fit: BoxFit.cover,
//           ),
//         ),
//
//         Container(
//           margin: EdgeInsets.only(top: 270.h),
//           height: 60.h,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ...List.generate(
//                 widget.placemodel.imageUrl.length,
//                     (index) => buildSmallPreviews(index),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   GestureDetector buildSmallPreviews(int index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedImage = index;
//         });
//       },
//       child: Container(
//         clipBehavior: Clip.hardEdge,
//         margin: EdgeInsets.only(right: 15),
//         height: 38.h,
//         width: 38.w,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//               color: selectedImage == index
//                   ? Colors.deepOrange
//                   : Colors.transparent),
//         ),
//         child: Image.network(
//           widget.placemodel.imageUrl[index],
//           fit: BoxFit.fill,
//         ),
//       ),
//     );
//   }
// }
