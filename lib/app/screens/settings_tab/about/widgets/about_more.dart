import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:protection_app/app/core/constants/data.dart';
import 'package:protection_app/app/core/custom/custom_listile.dart';

Column aboutMore() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: Data.aboutData.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                customListTilePrimary(
                  Data.aboutData[index].title,
                  Data.aboutData[index].icon,
                  Data.aboutData[index].function,
                ),
                const Gap(17),
              ],
            );
          },
        ),
      ],
    );
