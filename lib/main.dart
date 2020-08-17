import 'package:chewie_audio/chewie_audio.dart';
import 'package:chewie_audio/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import "vvv.dart";
import "audio.dart";

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BaseApp(),
      routes: <String, WidgetBuilder>{
        '/ChewieAudioDemo': (context) => ChewieAudioDemo(),
        '/ChewieDemo': (context) => ChewieDemo()
      },
    );
  }
}

class BaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Media Player'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(30),
                    // color: Colors.amber,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border.all(
                        color: Colors.amber,
                        //width: 2,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/ChewieAudioDemo');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.music_note),
                          Text(
                            '  Music',
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black,
                              // Text styles here
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border.all(
                        color: Colors.amber,
                        //width: 2,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    margin: EdgeInsets.all(30),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/ChewieDemo');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.video_library),
                          Text(
                            '  Video',
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black,
                              // Text styles here
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
