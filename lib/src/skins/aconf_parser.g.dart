// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aconf_parser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AconfRoot _$AconfRootFromJson(Map<String, dynamic> json) {
  return AconfRoot(
    json['parts'] == null
        ? null
        : AconfParts.fromJson(json['parts'] as Map<String, dynamic>),
    json['layouts'] == null
        ? null
        : AconfLayouts.fromJson(json['layouts'] as Map<String, dynamic>),
  );
}

AconfParts _$AconfPartsFromJson(Map<String, dynamic> json) {
  return AconfParts(
    json['device'] == null
        ? null
        : AconfDevice.fromJson(json['device'] as Map<String, dynamic>),
    json['portrait'] == null
        ? null
        : AconfPart.fromJson(json['portrait'] as Map<String, dynamic>),
    json['landscape'] == null
        ? null
        : AconfPart.fromJson(json['landscape'] as Map<String, dynamic>),
  );
}

AconfDevice _$AconfDeviceFromJson(Map<String, dynamic> json) {
  return AconfDevice(
    json['display'] == null
        ? null
        : AconfDisplay.fromJson(json['display'] as Map<String, dynamic>),
  );
}

AconfDisplay _$AconfDisplayFromJson(Map<String, dynamic> json) {
  return AconfDisplay(
    json['x'] as int,
    json['y'] as int,
    json['width'] as int,
    json['height'] as int,
  );
}

AconfPart _$AconfPartFromJson(Map<String, dynamic> json) {
  return AconfPart(
    json['background'] == null
        ? null
        : AconfImage.fromJson(json['background'] as Map<String, dynamic>),
    json['onion'] == null
        ? null
        : AconfImage.fromJson(json['onion'] as Map<String, dynamic>),
  );
}

AconfLayouts _$AconfLayoutsFromJson(Map<String, dynamic> json) {
  return AconfLayouts(
    portrait: json['portrait'] == null
        ? null
        : AconfLayout.fromJson(json['portrait'] as Map<String, dynamic>),
    landscape: json['landscape'] == null
        ? null
        : AconfLayout.fromJson(json['landscape'] as Map<String, dynamic>),
    buttons: json['buttons'] == null
        ? null
        : AconfButtons.fromJson(json['buttons'] as Map<String, dynamic>),
  );
}

AconfLayout _$AconfLayoutFromJson(Map<String, dynamic> json) {
  return AconfLayout(
    json['event'] as String,
    json['width'] as int,
    json['height'] as int,
    json['part1'] == null
        ? null
        : AconfLayoutPart.fromJson(json['part1'] as Map<String, dynamic>),
    json['part2'] == null
        ? null
        : AconfLayoutPart.fromJson(json['part2'] as Map<String, dynamic>),
    json['part3'] == null
        ? null
        : AconfLayoutPart.fromJson(json['part3'] as Map<String, dynamic>),
  );
}

AconfLayoutPart _$AconfLayoutPartFromJson(Map<String, dynamic> json) {
  return AconfLayoutPart(
    json['name'] as String,
    json['x'] as int,
    json['y'] as int,
    json['rotation'] as int,
  );
}

AconfImage _$AconfImageFromJson(Map<String, dynamic> json) {
  return AconfImage(
    json['image'] as String,
  );
}

AconfButtons _$AconfButtonsFromJson(Map<String, dynamic> json) {
  return AconfButtons(
    back: json['back'] == null
        ? null
        : AconfButton.fromJson(json['back'] as Map<String, dynamic>),
    softLeft: json['soft-left'] == null
        ? null
        : AconfButton.fromJson(json['soft-left'] as Map<String, dynamic>),
    search: json['search'] == null
        ? null
        : AconfButton.fromJson(json['search'] as Map<String, dynamic>),
    home: json['home'] == null
        ? null
        : AconfButton.fromJson(json['home'] as Map<String, dynamic>),
    volumeUp: json['volume-up'] == null
        ? null
        : AconfButton.fromJson(json['volume-up'] as Map<String, dynamic>),
    volumeDown: json['volume-down'] == null
        ? null
        : AconfButton.fromJson(json['volume-down'] as Map<String, dynamic>),
    power: json['power'] == null
        ? null
        : AconfButton.fromJson(json['power'] as Map<String, dynamic>),
  );
}

AconfButton _$AconfButtonFromJson(Map<String, dynamic> json) {
  return AconfButton(
    json['image'] as String,
    json['x'] as int,
    json['y'] as int,
  );
}
