import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:rama/src/device_frame.dart';
import 'package:rama/src/skins/aconf_parser.dart';

void main() {
  // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  runApp(new App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );

    return app;
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<AconfSkin> getSkin() async {
    final parser = AConfParser();
    return parser.parserSkin("skins/pixel_3");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder<AconfSkin>(
              future: getSkin(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return DeviceFrame(
                    skin: snapshot.data,
                  );
                } else {
                  return Container();
                }
              })),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
