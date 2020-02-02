import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'skins/aconf_parser.dart';

class DeviceFrame extends StatelessWidget {
  final AconfSkin skin;

  const DeviceFrame({Key key, this.skin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // parts
    final displayPart = skin.root.parts.device.display;
    final portraitPart = skin.root.parts.portrait;
    final background = "${skin.path}/${portraitPart.background.image}";
    final foreground = "${skin.path}/${portraitPart.onion.image}";

    // layouts
    final layout = skin.root.layouts.portrait;

    double widthFraction = displayPart.width / layout.width;
    double heightFraction = displayPart.height / layout.height;

    double xOffset = layout.part2.x / (layout.width - displayPart.width);
    double yOffset = layout.part2.y / (layout.height - displayPart.height);

    final aspectRatio = layout.width / layout.height;

    return Container(
      color: Colors.blueGrey.withOpacity(0.2),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Stack(
          children: <Widget>[
            Image.asset(background),
            Container(
                alignment: FractionalOffset(xOffset, yOffset),
                child: FractionallySizedBox(
                    widthFactor: widthFraction,
                    heightFactor: heightFraction,
                    child: Container(
                        color: Colors.blue,
                        child:
                            Text("x ${layout.part2.x} \n xOffset $xOffset")))),
            Image.asset(foreground),
          ],
        ),
      ),
    );
  }
}

// 1000
// 100
