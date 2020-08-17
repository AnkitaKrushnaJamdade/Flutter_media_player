import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/*
void main() {
  runApp(
    ChewieDemo(),
  );
}
*/

class ChewieDemo extends StatefulWidget {
  ChewieDemo({this.title = 'Media Player'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<ChewieDemo> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network(
        'https://media.w3.org/2010/05/sintel/trailer.mp4');
    _videoPlayerController2 =
        VideoPlayerController.asset('videos/test_video.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );
    /*
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController2,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );*/
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: widget.title,
      color: Colors.red,
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Media Player",
              //widget.title,
              style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  //color: Colors.white,
                  ),
            ),
            backgroundColor: Colors.red,
          ),
          body: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Chewie(
                    controller: _chewieController,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              FlatButton(
                onPressed: () {
                  _chewieController.enterFullScreen();
                },
                child: Text('Fullscreen',
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
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
                        setState(() {
                          _chewieController.dispose();
                          _videoPlayerController2.pause();
                          _videoPlayerController2.seekTo(Duration(seconds: 0));
                          _chewieController = ChewieController(
                            videoPlayerController: _videoPlayerController1,
                            aspectRatio: 3 / 2,
                            autoPlay: true,
                            looping: true,
                          );
                        });
                      },
                      child: Padding(
                        child: Text("Online Video Player",
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
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
                        setState(() {
                          _chewieController.dispose();
                          _videoPlayerController1.pause();
                          _videoPlayerController1.seekTo(Duration(seconds: 0));
                          _chewieController = ChewieController(
                            videoPlayerController: _videoPlayerController2,
                            aspectRatio: 3 / 2,
                            autoPlay: true,
                            looping: true,
                          );
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Text("Offline video Player",
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
