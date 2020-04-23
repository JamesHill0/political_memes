import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_pro/carousel_pro.dart';

class MemeCarousel extends StatefulWidget {
  MemeCarousel({this.memeList});

  List<NetworkImage> memeList;

  @override
  _MemeCarouselState createState() => _MemeCarouselState();
}

class _MemeCarouselState extends State<MemeCarousel> {
  List<NetworkImage> memeList;
  static int index = 0;

  Function getCurrent = (int prev, int current) {
    index = current;
    print(index);
    return current;
  };

  @override
  void initState() {
    memeList = widget.memeList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Carousel(
      images: memeList,
      showIndicator: false,
      borderRadius: true,
      boxFit: BoxFit.contain,
      moveIndicatorFromBottom: 180.0,
      noRadiusForIndicator: true,
      autoplay: false,
      onImageChange: getCurrent,
    );
  }
}
