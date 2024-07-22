// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:protection_app/app/core/custom/custom_elevated_button.dart';
// import 'package:protection_app/app/core/custom/custom_text.dart';
// import 'package:protection_app/app/core/device_padding/device_padding.dart';
// import 'package:protection_app/app/core/device_size/device_size.dart';
// import 'package:protection_app/app/screens/home_tab/browse_securely/widgets/location_button.dart';

// SizedBox browseSecurelyBody(String imagepath, String title, String content,
//         String buttonName, bool activate, void Function() function) =>
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
//                 Container(
//                   width: DeviceSize.width! * 0.8,
//                   height: DeviceSize.height! * 0.3,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage(imagepath),
//                     ),
//                   ),
//                 ),
//                 Gap(DeviceSize.height! * 0.025),
//                 activate
//                     ? customTextBarTitleActivate(
//                         title,
//                         TextAlign.center,
//                       )
//                     : customTextBarTitle(
//                         title,
//                         TextAlign.center,
//                       ),
//                 Gap(DeviceSize.height! * 0.025),
//                 customTextContent(
//                   content,
//                   TextAlign.center,
//                 ),
//               ],
//             ),
//             activate
//                 ? locationbutton()
//                 : const SizedBox.shrink(),
//             Column(
//               children: [
//                 activate
//                     ? customElevatedButtonSecondary(
//                         function,
//                         buttonName,
//                       )
//                     : customElevatedButton(
//                         function,
//                         buttonName,
//                       ),
//                 Gap(DeviceSize.height! * 0.008),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
