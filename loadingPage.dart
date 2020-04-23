import 'dart:async';
import 'package:flutter/material.dart';
import 'package:draw/draw.dart';
import 'memePage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MemeList extends StatefulWidget {
  @override
  _MemeListState createState() => _MemeListState();
}

class _MemeListState extends State<MemeList> {
  List<NetworkImage> memeList = [];

  void reddit() async {
    Reddit reddit = await Reddit.createScriptInstance(
      clientId: "ewq1ReSu2A85kQ",
      clientSecret: "8deYHV7S8PA9Hhutfok_z5ZMC-A",
      userAgent: "Political Memes",
      username: "neverly123",
      password: "fyctyk-zigbUp-tutry3",
    );

    SubredditRef subredditRef = reddit.subreddit('dankmemes');
    Subreddit subreddit = await subredditRef.populate();
    SubredditStream subredditStream = subreddit.stream;

    Stream<Submission> submissionStream = subredditStream.submissions();

    submissionStream.listen((submission) {
      setState(() {
        memeList.add(NetworkImage(submission.url.toString()));
      });
      if (memeList.length == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return MemePage(
              memeList: memeList,
            );
          }),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    reddit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 100.0,
          duration: Duration(seconds: 1),
        ),
      ),
    );
  }
}
