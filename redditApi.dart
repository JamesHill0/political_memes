import 'dart:async';
import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:politicalmemes/home-page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  List<String> list = [];

  void listUpdate() async {
    Reddit reddit = await Reddit.createScriptInstance(
      clientId: "3bQnNdV2mN9EBA",
      clientSecret: "QIPqmC2NesMcg-YHajsJu0aG5K0",
      userAgent: "AGENT_NAME",
      username: "Yahmezzzz",
      password: "cookies",
    );
    SubredditRef subredditRef = reddit.subreddit("ConservativeMemes");
    Subreddit subreddit = await subredditRef.populate();
    SubredditStream subredditStream = subreddit.stream;
    Stream<Submission> submissionStream = subredditStream.submissions();

    submissionStream.listen(
      (submission) {
        setState(
          () {
            list.add(submission.url.toString());
            if (list.length > 50) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomePage(
                      list: list,
                    );
                  },
                ),
              );
            }
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    listUpdate();
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
