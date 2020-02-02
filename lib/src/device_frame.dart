import 'package:flutter/widgets.dart';

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
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                                child: Text(
                                    "x ${layout.part2.x} \n xOffset $xOffset")),
                            Container(child: AndroidSysBarWidget())
                          ],
                        )))),
            Image.asset(foreground),
          ],
        ),
      ),
    );
  }
}

class AndroidSysBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      height: 40,
      color: Color.fromARGB(128, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(
            flex: 3,
          ),
          Image.asset("assets/common/ic_sysbar_back.png"),
          Spacer(
            flex: 1,
          ),
          Image.asset("assets/common/ic_sysbar_home.png"),
          Spacer(
            flex: 1,
          ),
          Image.asset("assets/common/ic_sysbar_recent.png"),
          Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
