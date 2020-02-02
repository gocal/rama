import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'skins/aconf_parser.dart';

class DeviceFrame extends StatelessWidget {
  final AconfSkin skin;

  const DeviceFrame({Key key, this.skin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final display = skin.root.parts.device.display;

    final aspectRatio = display.width.toDouble() / display.height.toDouble();

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
          color: Colors.blue, child: Text("aspectRatio $aspectRatio")),
    );
  }
}
