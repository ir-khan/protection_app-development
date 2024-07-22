import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:protection_app/app/core/constants/colors.dart';
import 'package:protection_app/app/core/constants/strings.dart';
import 'package:protection_app/app/core/custom/custom_appbar.dart';
import 'package:protection_app/app/core/device_border/device_border.dart';
import 'package:protection_app/app/core/device_size/device_size.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/presentations/breach/bloc/breach_mail_search_bloc.dart';

class DataBreachIn extends StatelessWidget {
  const DataBreachIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(AppStrings.dataBreachMonitoring),
      body: BlocBuilder<BreachMailSearchBloc, BreachMailSearchState>(
        builder: (context, state) {
          print('STATE 2 : ${state.runtimeType}');
          if (state.isLoading) {
            return Center(child: const CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "${state.breachEmailSearchModel.length} compromised accounts",
                  style: const TextStyle(
                    color: TextColors.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "To secure a compromised account, you should change the password immediately.",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Gap(DeviceSize.height! * 0.025),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.breachEmailSearchModel.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
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
                                      style: TextStyle(color: Colors.white)),
                                  Text(
                                      DateFormat('dd MMM yyyy').format(
                                          DateTime.parse(state
                                              .breachEmailSearchModel[index]
                                              .breachDate
                                              .toString())),
                                      style:
                                          const TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: DeviceBorder.fix.circularRadius,
                      ),
                      fixedSize: Size(DeviceSize.width! * 0.8, 50),
                    ),
                    onPressed: () {
                      Navigation.ofPop();
                    },
                    child: const Text(
                      'Done',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

/*
Center(
            child: Column(
              children: [
                Text(
                  "2 compromised accounts",
                ),
                Text(
                  "To secure a compromised account, you should change the password immediately.",
                )
              ],
            ),
          )
*/