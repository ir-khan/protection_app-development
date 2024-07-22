// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gap/gap.dart';
// import 'package:protection_app/app/core/constants/colors.dart';
// import 'package:protection_app/app/core/custom/custom_elevated_button.dart';
// import 'package:protection_app/app/core/custom/custom_text.dart';
// import 'package:protection_app/app/core/device_padding/device_padding.dart';
// import 'package:protection_app/app/core/device_size/device_size.dart';
// import 'package:protection_app/app/presentations/breach/bloc/breach_mail_search_bloc.dart';

// SizedBox dataBreachBody(
//         String imagepath,
//         String title,
//         String content,
//         String buttonName,
//         bool activate,
//         int index,
//         void Function() function) =>
//     SizedBox(
//       height: DeviceSize.height,
//       width: DeviceSize.width,
//       child: Padding(
//         padding: DevicePadding.medium.symetricVerticalx2,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 activate
//                     ? customTextBarTitleColor(
//                         title,
//                         index == 2 ? TextColors.primary : TextColors.orange,
//                         TextAlign.center)
//                     : customTextBarTitle(
//                         title,
//                         TextAlign.center,
//                       ),
//                 Gap(DeviceSize.height! * 0.025),
//                 customTextContent(
//                   content,
//                   TextAlign.center,
//                 ),
//                 Gap(DeviceSize.height! * 0.05),
//                 activate
//                     ? const SizedBox.shrink()
//                     : BlocBuilder<BreachMailSearchBloc, BreachMailSearchState>(
//                         builder: (context, state) {
//                           return TextField(
//                             controller: context
//                                 .read<BreachMailSearchBloc>()
//                                 .emailController,
//                             keyboardType: TextInputType.emailAddress,
//                             style: const TextStyle(
//                               color: TextColors.white,
//                             ),
//                             maxLines: 1,
//                             decoration: InputDecoration(
//                               contentPadding: DevicePadding.large.all,
//                               filled: true,
//                               fillColor: AppColors.darkGrey,
//                               border: OutlineInputBorder(
//                                 borderSide: BorderSide.none,
//                                 borderRadius: BorderRadius.circular(18),
//                               ),
//                             ),
//                           );
//                         },
//                       )
//               ],
//             ),
//             Column(
//               children: [
//                 customElevatedButton(
//                   function,
//                   buttonName,
//                 ),
//                 Gap(DeviceSize.height! * 0.008),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:protection_app/app/core/constants/colors.dart';
import 'package:protection_app/app/core/custom/custom_elevated_button.dart';
import 'package:protection_app/app/core/custom/custom_text.dart';
import 'package:protection_app/app/core/device_padding/device_padding.dart';
import 'package:protection_app/app/core/device_size/device_size.dart';
import 'package:protection_app/app/presentations/breach/bloc/breach_mail_search_bloc.dart';

SizedBox dataBreachBody(
        String imagepath,
        String title,
        String content,
        String buttonName,
        bool activate,
        int index,
        void Function() function,
        String usermail,
        TextEditingController fieldController,
        String compromisedDataLength,
        int dataLength) =>
    SizedBox(
      height: DeviceSize.height,
      width: DeviceSize.width,
      child: Padding(
        padding: DevicePadding.medium.symetricVerticalx2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                activate
                    ? customTextBarTitleColor(
                        index == 3
                            ? title.replaceAll('2', dataLength.toString())
                            : title.replaceAll("Blabla", compromisedDataLength),
                        index == 2 ? TextColors.primary : TextColors.orange,
                        TextAlign.center)
                    : customTextBarTitle(
                        title,
                        TextAlign.start,
                      ),
                Gap(DeviceSize.height! * 0.025),
                customTextContent(
                  content.replaceAll("ezgi@neonapps.co", usermail),
                  TextAlign.center,
                ),
                Gap(DeviceSize.height! * 0.025),
                index == 3
                    ? BlocBuilder<BreachMailSearchBloc, BreachMailSearchState>(
                        builder: (context, state) {
                          print('STATE 2 : ${state.runtimeType}');
                          if (state.isLoading) {
                            return const CircularProgressIndicator();
                          }
                          return Container(
                            height: 400,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              itemCount: state.breachEmailSearchModel.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  color: AppColors.darkGrey,
                                  child: ListTile(
                                    title: Text(
                                      state.breachEmailSearchModel[index].name,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Row(
                                      children: [
                                        const Text('Breached on ',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(
                                            DateFormat('dd MMM yyyy').format(
                                                DateTime.parse(state
                                                    .breachEmailSearchModel[
                                                        index]
                                                    .breachDate
                                                    .toString())),
                                            style: const TextStyle(
                                                color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      )
                    : const SizedBox.shrink(),
                Gap(DeviceSize.height! * 0.05),
                activate
                    ? const SizedBox.shrink()
                    : BlocBuilder<BreachMailSearchBloc, BreachMailSearchState>(
                        builder: (context, state) {
                          return TextField(
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                              color: TextColors.white,
                            ),
                            // controller: fieldController,
                            controller: context
                                .read<BreachMailSearchBloc>()
                                .emailController,
                            maxLines: 1,
                            decoration: InputDecoration(
                              contentPadding: DevicePadding.large.all,
                              filled: true,
                              fillColor: AppColors.darkGrey,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                          );
                        },
                      ),
              ],
            ),
            BlocBuilder<BreachMailSearchBloc, BreachMailSearchState>(
              builder: (context, state) {
                return Column(
                  children: [
                    customElevatedButton(
                      index == 3
                          ? () => context
                              .read<BreachMailSearchBloc>()
                              .add(const FetchBreach())
                          : function,
                      buttonName,
                    ),
                    Gap(DeviceSize.height! * 0.008),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
