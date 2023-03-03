import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../DataModel/carouselModel.dart';
import '../../../customComponents/customHeroCarousel.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({Key? key}) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 1.9,
              viewportFraction: .8,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: Category.categories
                .map((category) =>
                HeroCarouseCard(category: category))
                .toList(),
          ),
        ),
      ],
    );
  }
}
