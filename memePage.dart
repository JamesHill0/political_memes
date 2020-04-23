import 'package:flutter/material.dart';
import 'share.dart';
import 'package:carousel_pro/carousel_pro.dart';

class MemePage extends StatefulWidget {
  MemePage({this.memeList});

  final List<NetworkImage> memeList;

  @override
  _MemePageState createState() => _MemePageState();
}

class _MemePageState extends State<MemePage> {
  static String memeUrl;
  static int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: Carousel(
                images: widget.memeList,
                showIndicator: false,
                borderRadius: true,
                boxFit: BoxFit.contain,
                moveIndicatorFromBottom: 180.0,
                noRadiusForIndicator: true,
                autoplay: false,
                onImageChange: (int a, int b) {
                  setState(
                    () {
                      index = b;
                      memeUrl = widget.memeList[index].url;
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    saveMeme(memeUrl);
                  },
                  icon: Icon(Icons.file_download, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    shareMeme(memeUrl);
                  },
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
