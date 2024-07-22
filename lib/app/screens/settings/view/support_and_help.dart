// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:protection_app/app/core/constants/colors.dart';
// import 'package:protection_app/app/core/theme/neon_icons.dart';
// import 'package:protection_app/app/data/models/tile_model.dart';

// class SupportAndHelp extends StatelessWidget {
//   const SupportAndHelp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 75,
//               child: Card(
//                 color: AppColors.darkGrey,
//                 child: Row(
//                   children: [
//                     SizedBox(width: 20),
//                     Icon(NeonIcons.contact, color: AppColors.primary),
//                     SizedBox(width: 20),
//                     Text('Contact Support',
//                         style: TextStyle(
//                           color: TextColors.white,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 16,
//                         ))
//                   ],
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {},
//               child: const SizedBox(
//                 height: 75,
//                 child: Card(
//                   color: AppColors.darkGrey,
//                   child: Row(
//                     children: [
//                       SizedBox(width: 20),
//                       Icon(NeonIcons.rate, color: AppColors.primary),
//                       SizedBox(width: 20),
//                       Text('Rate Us ',
//                           style: TextStyle(
//                             color: TextColors.white,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 16,
//                           ))
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
