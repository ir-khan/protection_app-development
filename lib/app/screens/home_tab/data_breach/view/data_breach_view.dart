// import 'package:flutter/material.dart';
// import 'package:protection_app/app/core/constants/data.dart';
// import 'package:protection_app/app/core/constants/strings.dart';
// import 'package:protection_app/app/core/custom/custom_appbar.dart';
// import 'package:protection_app/app/core/custom/custom_screen_box.dart';
// import 'package:protection_app/app/screens/home_tab/data_breach/widgets/data_breach_body.dart';

// class DataBreachView extends StatefulWidget {
//   const DataBreachView({super.key});

//   @override
//   State<DataBreachView> createState() => _DataBreachViewState();
// }

// class _DataBreachViewState extends State<DataBreachView> {
//   int index = 0;
//   bool active = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: customAppBar(AppStrings.dataBreachMonitoring),
//       body: index > 0
//           ? dataBreachBody(
//               Data.dataBreachData[index].path,
//               Data.dataBreachData[index].title,
//               Data.dataBreachData[index].content,
//               Data.dataBreachData[index].buttonName,
//               Data.dataBreachData[index].activate,
//               index,
//               () {
//                 setState(
//                   () {
//                     if (index < 3) index++;
//                   },
//                 );
//               },
//             )
//           : customScreenBox(
//               Data.dataBreachData[index].path,
//               Data.dataBreachData[index].title,
//               Data.dataBreachData[index].content,
//               Data.dataBreachData[index].buttonName,
//               active,
//               () {
//                 setState(
//                   () {
//                     index++;
//                   },
//                 );
//               },
//             ),
//     );
//   }
// }

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protection_app/app/core/constants/data.dart';
import 'package:protection_app/app/core/constants/strings.dart';
import 'package:protection_app/app/core/custom/custom_appbar.dart';
import 'package:protection_app/app/core/custom/custom_screen_box.dart';
import 'package:protection_app/app/presentations/breach/bloc/breach_mail_search_bloc.dart';
import 'package:protection_app/app/screens/home_tab/data_breach/widgets/data_breach_body.dart';

class DataBreachView extends StatefulWidget {
  const DataBreachView({super.key});

  @override
  State<DataBreachView> createState() => _DataBreachViewState();
}

class _DataBreachViewState extends State<DataBreachView> {
  int index = 0;
  bool active = false;
  String usermail = "";
  TextEditingController fieldController = TextEditingController();
  String compromisedDataLength = "10";
  int dataLength = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BreachMailSearchBloc, BreachMailSearchState>(
      builder: (context, state) {
        return Scaffold(
          appBar: customAppBar(AppStrings.dataBreachMonitoring),
          body: index > 0
              ? dataBreachBody(
                  Data.dataBreachData[index].path,
                  Data.dataBreachData[index].title,
                  Data.dataBreachData[index].content,
                  Data.dataBreachData[index].buttonName,
                  Data.dataBreachData[index].activate,
                  index, () {
                  if (EmailValidator.validate(context
                      .read<BreachMailSearchBloc>()
                      .emailController
                      .text)) {
                    setState(
                      () {
                        // usermail = fieldController.text;
                        usermail = context
                            .read<BreachMailSearchBloc>()
                            .emailController
                            .text;

                        

                        if (index < 3) index++;
                      },
                    );
                  }
                },
                  usermail,
                  context.read<BreachMailSearchBloc>().emailController,
                  compromisedDataLength,
                  dataLength)
              : customScreenBox(
                  Data.dataBreachData[index].path,
                  Data.dataBreachData[index].title,
                  Data.dataBreachData[index].content,
                  Data.dataBreachData[index].buttonName,
                  active,
                  () {
                    setState(
                      () {
                        index++;
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
