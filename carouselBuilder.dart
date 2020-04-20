import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class MemeCarousel extends StatefulWidget {
  @override
  _MemeCarouselState createState() => _MemeCarouselState();
}

class _MemeCarouselState extends State<MemeCarousel> {
  MemeSwipe memeSwipe = MemeSwipe();

  @override
  Widget build(BuildContext context) {
    return Carousel(
      images: memeSwipe.memeList,
      showIndicator: false,
      borderRadius: true,
      boxFit: BoxFit.contain,
      moveIndicatorFromBottom: 180.0,
      noRadiusForIndicator: true,
      autoplay: false,
    );
  }
}

class MemeSwipe {
  List memeList = [
    NetworkImage(
        'https://preview.redd.it/5kwx5iz6ost41.jpg?width=640&crop=smart&auto=webp&s=887f1aa5f4bd42e3ace09e6ac4422dd52bce363f'),
    NetworkImage(
        'https://preview.redd.it/cicabquklst41.png?width=640&crop=smart&auto=webp&s=329a3bf7b2461b2dbfdaa8094eaba62e0009b043'),
    NetworkImage(
        'https://preview.redd.it/qqupw1egtrt41.jpg?width=640&crop=smart&auto=webp&s=62003dc410f284cc13976c67dd3c3c6eb77aea57'),
    NetworkImage(
        'https://preview.redd.it/c82vkm038st41.jpg?width=640&crop=smart&auto=webp&s=26a5fd1e27e0205843e8f86a658ec72db5f28860'),
    NetworkImage('https://i.redd.it/jtlwfqu7bst41.jpg'),
  ];

  void addMeme(String url) {
    memeList += [NetworkImage(url)];
    print(memeList);
  }
}
