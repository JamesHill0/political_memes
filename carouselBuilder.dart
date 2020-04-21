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
  int index = 0;

  Function getCurrent = (int prev, int current) {
//    index = current;
    return current;
  };

  @override
  void initState() {
    memeList = widget.memeList;
//    index = getCurrent();
    super.initState();
    print(index);
  }

  @override
  Widget build(BuildContext context) {
//    return CarouselSlider(items: null, options: null)
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
