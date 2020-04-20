import 'package:flutter/material.dart';
import 'share.dart';
import 'carouselBuilder.dart';
import 'redditAPI.dart';

class MemePage extends StatefulWidget {
  MemePage({this.memeList});

  List<String> memeList;

  @override
  _MemePageState createState() => _MemePageState();
}

class _MemePageState extends State<MemePage> {
  @override
  void initState() {
    super.initState();
  }

  MemeList memeList = MemeList();

  ShareMeme shareMeme = ShareMeme();
  SaveMeme saveMeme = SaveMeme();

  String memeUrl = 'https://i.redd.it/pze4ccdypkt41.png';

  MemeCarousel memeCarousel = MemeCarousel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: memeCarousel,
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
