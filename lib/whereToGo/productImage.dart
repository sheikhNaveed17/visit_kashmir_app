import 'package:app2/DataModel/placesModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageView extends StatelessWidget {

  var imageData;

  ImageView({
    Key? key,
    required this.imageData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductImages(imageData: imageData,);
  }
}

class ProductImages extends StatefulWidget {

  var imageData;
  ProductImages({
    Key? key,
    required this.imageData,
  }) : super(key: key);

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 400.h,
          child: AspectRatio(
            aspectRatio: 2 / 2,
            child: CachedNetworkImage(
              imageUrl: widget.imageData.data.images[selectedImage],
              // imageUrl: widget.imageData.data.image[0],
              imageBuilder: (context, imageProvider) =>
                  Image(image: imageProvider, fit: BoxFit.cover),
              placeholder: (context, url) => Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) =>
                  Image.asset("images/filenotfound.jpg"),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 270.h),
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                widget.imageData.data.images.length,
                (index) => buildSmallPreviews(index),
              )
            ],
          ),
        ),
      ],
    );
  }

  GestureDetector buildSmallPreviews(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.only(right: 15),
        height: 38.h,
        width: 38.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
          border: Border.all(
              color: selectedImage == index
                  ? Colors.deepOrange
                  : Colors.transparent),
        ),
        child:
            // Image.network(
            //   widget.placemodel.imageUrl[index],
            //   fit: BoxFit.fill,
            // ),
            ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: widget.imageData.data.images[index],
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) =>
                Image.asset("images/filenotfound.jpg"),
          ),
        ),
      ),
    );
  }
}
