// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/widgets/image_cached.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CarouselImage extends StatelessWidget {
  List <String> images;
  CarouselImage({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: images.map(
        (i) {
          return Builder(
            builder: (BuildContext context) => ImageCached(
              urlimage: i,
          
            ),
          );
        },
      ).toList(),

      options: CarouselOptions(
      
        animateToClosest: true,
        viewportFraction: 1,
        height: 200,
      ),
    );
  }
}
