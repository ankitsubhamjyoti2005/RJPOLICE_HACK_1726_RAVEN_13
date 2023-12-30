import 'dart:math';

import 'package:flutter/material.dart';

import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'RAVEN', home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => jumpToLivePage(context, isHost: true),
            child: const Text('Start a Live'),
          ),
          ElevatedButton(
            child: const Text('Watch a Live'),
            onPressed: () => jumpToLivePage(context, isHost: false),
          )
        ],
      ))),
    );
  }

  jumpToLivePage(BuildContext context, {required bool isHost}) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LivePage(
            isHost: isHost,
          ),
        ));
  }
}

final String userID = Random().nextInt(10000).toString();

class LivePage extends StatelessWidget {
  const LivePage({Key? key, this.isHost = false}) : super(key: key);
  final bool isHost;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID:
            719117425, 
        appSign:
            '784b59cad1153c8ed9d44c051e6d2f084c8fe0c421c6bdf3b56625a180a58205',
        userID: userID,
        userName: 'user_$userID',
        liveID: 'testLiveID',
        config: isHost
            ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
      ),
    );
  }
}
