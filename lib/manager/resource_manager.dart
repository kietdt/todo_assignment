//created by kietdt
import 'package:flutter_application_1/resource/color.dart';
import 'package:flutter_application_1/resource/text_style.dart';

class ResourceManager {
  static ResourceManager? _internal;
  ResourceManager._();

  BaseColor? color;
  BaseTextStyle? text;

  factory ResourceManager() {
    if (_internal == null) _internal = ResourceManager._();
    return _internal!;
  }

  void init() {
    color = BaseColor();
    text = BaseTextStyle();
  }
}
