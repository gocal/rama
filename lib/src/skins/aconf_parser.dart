import 'package:json_annotation/json_annotation.dart';

part 'aconf_parser.g.dart';

class AConfParser {
  AconfSkin parserConf(String config) {
    final lines = config.split("\n");
    final map = getTree(lines);
    final skin = AconfSkin.fromJson(map);
    return skin;
  }

  Map<String, dynamic> getTree(List<String> lines) {
    final map = Map<String, dynamic>();

    while (lines.isNotEmpty) {
      final line = lines.removeAt(0).trim().split(" ");

      final key = line[0];
      final value = line.length > 1 ? line[1] : null;

      if (value == "{") {
        // start block

        final subTree = getTree(lines);

        if (subTree != null && subTree.isNotEmpty) {
          map[key] = subTree;
        }
      } else if (key == "}") {
        // end block
        break;
      } else {
        if (value != null) {
          map[key] = _stringOrNum(value);
        }
      }
    }

    return map;
  }

  dynamic _stringOrNum(String value) {
    return int.tryParse(value) ?? double.tryParse(value) ?? value;
  }
}

const jsonSerializable =
    JsonSerializable(createToJson: false, explicitToJson: false);

@jsonSerializable
class AconfSkin {
  final AconfParts parts;
  final AconfLayouts layouts;

  AconfSkin(this.parts, this.layouts);

  factory AconfSkin.fromJson(Map<String, dynamic> json) =>
      _$AconfSkinFromJson(json);
}

@jsonSerializable
class AconfParts {
  final AconfDevice device;
  final AconfPart portrait;
  final AconfPart landscape;

  AconfParts(this.device, this.portrait, this.landscape);

  factory AconfParts.fromJson(Map<String, dynamic> json) =>
      _$AconfPartsFromJson(json);
}

@jsonSerializable
class AconfDevice {
  final AconfDisplay display;

  AconfDevice(this.display);

  factory AconfDevice.fromJson(Map<String, dynamic> json) =>
      _$AconfDeviceFromJson(json);
}

@jsonSerializable
class AconfDisplay {
  final int x;

  final int y;

  final int width;

  final int height;

  AconfDisplay(this.x, this.y, this.width, this.height);

  factory AconfDisplay.fromJson(Map<String, dynamic> json) =>
      _$AconfDisplayFromJson(json);
}

@jsonSerializable
class AconfPart {
  final AconfImage background;
  final AconfImage onion;

  AconfPart(this.background, this.onion);

  factory AconfPart.fromJson(Map<String, dynamic> json) =>
      _$AconfPartFromJson(json);
}

@jsonSerializable
class AconfLayouts {
  final AconfLayout portrait;

  final AconfLayout landscape;

  final AconfButtons buttons;

  AconfLayouts({this.portrait, this.landscape, this.buttons});

  factory AconfLayouts.fromJson(Map<String, dynamic> json) =>
      _$AconfLayoutsFromJson(json);
}

@jsonSerializable
class AconfLayout {
  final String event;

  final int width;

  final int height;

  final AconfLayoutPart part1;
  final AconfLayoutPart part2;
  final AconfLayoutPart part3;

  AconfLayout(
      this.event, this.width, this.height, this.part1, this.part2, this.part3);

  factory AconfLayout.fromJson(Map<String, dynamic> json) =>
      _$AconfLayoutFromJson(json);
}

@jsonSerializable
class AconfLayoutPart {
  final String name;

  final int x;

  final int y;

  final int rotation;

  AconfLayoutPart(this.name, this.x, this.y, this.rotation);

  factory AconfLayoutPart.fromJson(Map<String, dynamic> json) =>
      _$AconfLayoutPartFromJson(json);
}

@jsonSerializable
class AconfImage {
  final String image;

  AconfImage(this.image);

  factory AconfImage.fromJson(Map<String, dynamic> json) =>
      _$AconfImageFromJson(json);
}

@jsonSerializable
class AconfButtons {
  final AconfButton back;

  @JsonKey(name: "soft-left")
  final AconfButton softLeft;

  @JsonKey(name: "search")
  final AconfButton search;

  @JsonKey(name: "home")
  final AconfButton home;

  @JsonKey(name: "volume-up")
  final AconfButton volumeUp;

  @JsonKey(name: "volume-down")
  final AconfButton volumeDown;

  @JsonKey(name: "power")
  final AconfButton power;

  AconfButtons(
      {this.back,
      this.softLeft,
      this.search,
      this.home,
      this.volumeUp,
      this.volumeDown,
      this.power});

  factory AconfButtons.fromJson(Map<String, dynamic> json) =>
      _$AconfButtonsFromJson(json);
}

@jsonSerializable
class AconfButton {
  final String image;
  final int x;

  final int y;

  AconfButton(this.image, this.x, this.y);

  factory AconfButton.fromJson(Map<String, dynamic> json) =>
      _$AconfButtonFromJson(json);
}
