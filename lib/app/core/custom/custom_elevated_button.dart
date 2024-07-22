import 'package:flutter/material.dart';
import 'package:protection_app/app/core/constants/colors.dart';
import 'package:protection_app/app/core/custom/custom_text.dart';
import 'package:protection_app/app/core/device_border/device_border.dart';
import 'package:protection_app/app/core/device_size/device_size.dart';

///Custom Elevated button with func and text
ElevatedButton customElevatedButton(
  Function()? function,
  String text, [
  Widget widget = const SizedBox.shrink(),
  SizedBox defaultSizedBox = const SizedBox.shrink(),
]) =>
    ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        minimumSize: Size(
          DeviceSize.width! * 0.8,
          60,
        ),
        maximumSize: Size(
          DeviceSize.width! * 0.8,
          60,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: DeviceBorder.fix.circularRadius,
        ),
      ),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [customTextButtonBlack(text), defaultSizedBox, widget],
      )),
    );

///Custom Secondary Elevated button with func and text
ElevatedButton customElevatedButtonSecondary(
        void Function() function, String text) =>
    ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        minimumSize: Size(
          DeviceSize.width! * 0.8,
          DeviceSize.height! * 0.08,
        ),
        maximumSize: Size(
          DeviceSize.width! * 0.8,
          DeviceSize.height! * 0.08,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: DeviceBorder.fix.circularRadius,
        ),
      ),
      child: Center(
        child: customTextButtonWhite(text),
      ),
    );
