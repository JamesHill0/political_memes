import 'package:flutter/material.dart';
import 'share.dart';
import 'carouselBuilder.dart';

class MemePage extends StatefulWidget {
  MemePage({this.memeList});

  final List<NetworkImage> memeList;

  @override
  _MemePageState createState() => _MemePageState();
}

class _MemePageState extends State<MemePage> {
  ShareMeme shareMeme = ShareMeme();
  SaveMeme saveMeme = SaveMeme();
  String memeUrl = 'https://i.redd.it/pze4ccdypkt41.png';

  MemeCarousel getMemeCarousel() {
    MemeCarousel memeCarousel = MemeCarousel(memeList: widget.memeList);
    return memeCarousel;
  }

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
              child: getMemeCarousel(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    saveMeme.saveMeme(memeUrl);
                  },
                  icon: Icon(Icons.file_download, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    shareMeme.shareMeme(memeUrl);
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
