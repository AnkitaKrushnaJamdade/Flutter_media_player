import 'package:chewie_audio/chewie_audio.dart';
import 'package:chewie_audio/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/*
void main() {
  runApp(
    ChewieAudioDemo(),
  );
}
*/

class ChewieAudioDemo extends StatefulWidget {
  ChewieAudioDemo({this.title = 'Media Player'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<ChewieAudioDemo> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieAudioController _chewieAudioController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/opensource-11ed5.appspot.com/o/flutter_audio_plugin%2F456235__greek555__loop-mix-128-bpm.mp3?alt=media&token=3d4f4357-a143-46bd-89c1-0b3fbaa9a9e9');
    _videoPlayerController2 = VideoPlayerController.asset('audio/audio.mp3');

    _chewieAudioController = ChewieAudioController(
      videoPlayerController: _videoPlayerController1,

      autoPlay: false,
      looping: true,
      // Try playing around with some of these other options:
    );
    _chewieAudioController = ChewieAudioController(
      videoPlayerController: _videoPlayerController2,
      autoPlay: false,
      looping: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();

    _videoPlayerController2.dispose();

    _chewieAudioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: widget.title,
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.red,
        ),
        body: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: ChewieAudio(
                  controller: _chewieAudioController,
                ),
              ),
              Row(
                children: <Widget>[
                  // Container(

                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: FlatButton(
                      //color: Colors.amber,
                      onPressed: () {
                        setState(() {
                          _chewieAudioController.dispose();
                          _videoPlayerController2.pause();
                          _videoPlayerController2.seekTo(Duration(seconds: 0));
                          _chewieAudioController = ChewieAudioController(
                            videoPlayerController: _videoPlayerController1,
                            autoPlay: true,
                            looping: true,
                          );
                        });
                      },
                      child: Padding(
                        child: Text("Online Audio",
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 17)),
                        padding: EdgeInsets.all(7.0),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: FlatButton(
                      splashColor: Colors.yellow[100],
                      //color: Colors.red,
                      onPressed: () {
                        setState(
                          () {
                            _chewieAudioController.dispose();
                            _videoPlayerController1.pause();
                            _videoPlayerController1
                                .seekTo(Duration(seconds: 0));
                            _chewieAudioController = ChewieAudioController(
                              videoPlayerController: _videoPlayerController2,
                              autoPlay: true,
                              looping: true,
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Downloads",
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
