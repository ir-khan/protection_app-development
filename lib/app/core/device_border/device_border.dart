import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final class BorderType {
  BorderType._();
}

///Project's global padding class
enum DeviceBorder {
  ///This value is 18
  fix(18);

  final double value;
  const DeviceBorder(this.value);

  ShapeBorder get circularBorder => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(value),
      );

  BorderRadiusGeometry get circularRadius => BorderRadius.circular(value);
}
