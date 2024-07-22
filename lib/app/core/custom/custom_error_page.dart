import 'package:flutter/material.dart';
import 'package:protection_app/app/core/constants/colors.dart';
import 'package:protection_app/app/core/custom/custom_text.dart';

///Custom Error page for routes
Scaffold customErrorPage() => Scaffold(
      appBar: AppBar(),
      body: Center(
        child: customTextFullEdit(
          "Something went wrong, please restart the application",
          TextColors.white,
          30,
          FontWeight.w600,
          TextAlign.center,
        ),
      ),
    );
