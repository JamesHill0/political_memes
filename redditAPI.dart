import 'dart:async';
import 'package:flutter/material.dart';
import 'package:draw/draw.dart';

class MemeList extends StatefulWidget {
  @override
  _MemeListState createState() => _MemeListState();
}

class _MemeListState extends State<MemeList> {
  List<String> memeList = [];

  void reddit() async {
    Reddit reddit = await Reddit.createScriptInstance(
      clientId: "ewq1ReSu2A85kQ",
      clientSecret: "8deYHV7S8PA9Hhutfok_z5ZMC-A",
      userAgent: "Political Memes",
      username: "neverly123",
      password: "fyctyk-zigbUp-tutry3",
    );

    SubredditRef subredditRef = reddit.subreddit('ConservativeMemes');
    Subreddit subreddit = await subredditRef.populate();
    SubredditStream subredditStream = subreddit.stream;

    Stream<Submission> submissionStream = subredditStream.submissions();

    submissionStream.listen((submission) {
      setState(() {
        memeList.add(submission.url.toString());
      });
    });
  }

  @override
  void initState() {
    super.initState();
    reddit();
  }

  Widget build(BuildContext context) {
    return Container(child: Text("${memeList.length}"));
  }
}
