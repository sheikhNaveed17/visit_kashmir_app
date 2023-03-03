import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:app2/DataModel/carouselModel.dart';

class HeroCarouseCard extends StatelessWidget {
  final Category category;

  const HeroCarouseCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: category.imageUrl,
                imageBuilder: (context, imageProvider) => Image(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    width: double.infinity),
                placeholder: (context, url) => Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) =>
                    Image.asset("images/filenotfound.jpg"),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  // child: Text(
                  //   category.name,
                  //   style: const TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 20.0,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ),
              ),
            ],
          )),
    );
  }
}
