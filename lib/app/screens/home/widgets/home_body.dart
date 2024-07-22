import 'package:flutter/material.dart';
import 'package:protection_app/app/core/constants/data.dart';
import 'package:protection_app/app/core/custom/custom_box.dart';
import 'package:protection_app/app/core/device_padding/device_padding.dart';

SingleChildScrollView homeBody() => SingleChildScrollView(
      child: ListView.builder(
        itemCount: Data.homeData.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: DevicePadding.medium.homeSpecial,
        itemBuilder: (BuildContext context, int index) {
          return customBox(
            Data.homeData[index].route,
            Data.homeData[index].icon,
            Data.homeData[index].title,
            Data.homeData[index].content,
            Data.homeData[index].buttonTitle,
          );
        },
      ),
    );
