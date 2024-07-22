import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:protection_app/app/core/constants/colors.dart';
import 'package:protection_app/app/core/constants/strings.dart';
import 'package:protection_app/app/core/custom/custom_appbar.dart';
import 'package:protection_app/app/core/device_border/device_border.dart';
import 'package:protection_app/app/core/device_padding/device_padding.dart';
import 'package:protection_app/app/core/device_size/device_size.dart';
import 'package:protection_app/app/presentations/breach/bloc/breach_mail_search_bloc.dart';

class DataBreachEmail extends StatefulWidget {
  const DataBreachEmail({super.key});

  @override
  State<DataBreachEmail> createState() => _DataBreachEmailState();
}

class _DataBreachEmailState extends State<DataBreachEmail> {
  bool isActive = false;
  bool isClick = true;

  @override
  void initState() {
    context.read<BreachMailSearchBloc>().emailController.addListener(() {
      final isActive =
          context.read<BreachMailSearchBloc>().emailController.text.isNotEmpty;

      final isClick =
          context.read<BreachMailSearchBloc>().emailController.text.isNotEmpty;

      setState(() {
        this.isActive = isActive;
        this.isClick = isClick;
      });

      setState(() {});
    });

    super.initState();
  }

  // @override
  // void dispose() {
  //   context.read<BreachMailSearchBloc>().emailController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(AppStrings.dataBreachMonitoring),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Check any email',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(DeviceSize.height! * 0.025),
                  const Text(
                    "Enter an email to see if it has been involved in a data leak.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(DeviceSize.height! * 0.025),
                  BlocBuilder<BreachMailSearchBloc, BreachMailSearchState>(
                    builder: (context, state) {
                      return TextFormField(
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
                          fillColor: AppColors.midGrey,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      );
                    },
                  ),

                  Gap(DeviceSize.height! * 0.5),
                  BlocBuilder<BreachMailSearchBloc, BreachMailSearchState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: DeviceBorder.fix.circularRadius,
                          ),
                          disabledBackgroundColor: AppColors.midGrey,
                          fixedSize: Size(DeviceSize.width! * 0.8, 50),
                        ),

                        /// Control test device
                        onPressed: isActive && isClick
                            ? () {
                                setState(() {
                                  isActive = true;
                                  isClick = false;
                                });
                                context
                                    .read<BreachMailSearchBloc>()
                                    .add(const FetchBreach());
                              }
                            : null,
                        child: Text(
                          'Check Data Breach',
                          style: TextStyle(
                              color: isActive
                                  ? Colors.black
                                  : const Color(0xFF8E8E94),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
