import 'package:flutter/widgets.dart';
import 'package:rama/src/device_frame.dart';
import 'package:rama/src/skins/aconf_parser.dart';

class RamaWidget extends StatefulWidget {
  final Widget child;

  const RamaWidget({Key key, this.child}) : super(key: key);

  @override
  _RamaWidgetState createState() => _RamaWidgetState();
}

class _RamaWidgetState extends State<RamaWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AconfSkin>(
        future: getSkin(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DeviceFrame(
              skin: snapshot.data,
              child: widget.child,
            );
          } else {
            return Container();
          }
        });
  }

  Future<AconfSkin> getSkin() async {
    final parser = AConfParser();
    return parser.parserSkin("skins/pixel_3");
  }
}
