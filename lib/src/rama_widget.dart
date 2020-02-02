import 'package:flutter/widgets.dart';

class RamaWidget extends StatefulWidget {
  final Widget child;

  const RamaWidget({Key key, this.child}) : super(key: key);

  @override
  _RamaWidgetState createState() => _RamaWidgetState();
}

class _RamaWidgetState extends State<RamaWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
