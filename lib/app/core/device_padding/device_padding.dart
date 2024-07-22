import 'package:flutter/material.dart';
import 'package:protection_app/app/core/device_size/device_size.dart';

final class PaddingType {
  PaddingType._();
}

///Project's global padding class
enum DevicePadding {
  ///This value is 10
  small(10),

  ///This value is 15
  medium(15),

  ///This value is 20
  large(20),

  ///This value is 30
  xlarge(30);

  final double value;
  const DevicePadding(this.value);

  EdgeInsets get all => EdgeInsets.all(
        value,
      );

  EdgeInsets get symetric => EdgeInsets.symmetric(
        vertical: value,
        horizontal: value,
      );

  EdgeInsets get onlyRight => EdgeInsets.only(
        right: value,
      );

  EdgeInsets get onlyLeft => EdgeInsets.only(
        left: value,
      );

  EdgeInsets get homeSpecial => EdgeInsets.fromLTRB(
        value,
        DeviceSize.height! * 0.04,
        value,
        0,
      );

  EdgeInsets get boxSpecial => EdgeInsets.fromLTRB(
        value * 1.5,
        value,
        value * 1.5,
        value,
      );

  EdgeInsets get onlyHorizontal => EdgeInsets.symmetric(
        horizontal: value,
      );

  EdgeInsets get symetricVerticalx2 => EdgeInsets.symmetric(
        horizontal: value,
        vertical: value * 2,
      );

    EdgeInsets get symetricHorizontalx2 => EdgeInsets.symmetric(
        horizontal: value * 2,
        vertical: value,
      );

  EdgeInsets get onboarding => EdgeInsets.fromLTRB(
        value,
        0,
        value,
        value * 2,
      );
}
