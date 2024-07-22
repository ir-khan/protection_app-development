import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:protection_app/app/core/constants/data.dart';
import 'package:protection_app/app/core/custom/custom_listile.dart';

Column supportAndHelpMore() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: Data.supportAndHelpData.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                customListTilePrimary(
                  Data.supportAndHelpData[index].title,
                  Data.supportAndHelpData[index].icon,
                  Data.supportAndHelpData[index].function,
                ),
                const Gap(17),
              ],
            );
          },
        ),
      ],
    );
