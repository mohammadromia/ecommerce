

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class SmoothIndicatorCustom extends StatelessWidget {
  const SmoothIndicatorCustom({
    super.key,
    required this.pageController, required this.count,
  });

  final PageController pageController;
  final  int count; 
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: count,
      axisDirection: Axis.horizontal,
      effect:  const SlideEffect(
          spacing: 8.0,
          radius: 25,
          dotWidth: 16,
          dotHeight: 16.0,
          paintStyle: PaintingStyle.stroke,
          strokeWidth: 1.5,
          dotColor: Colors.grey,
          
          ),
    );
  }
}
