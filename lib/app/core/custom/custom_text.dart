import 'package:flutter/material.dart';
import 'package:protection_app/app/core/constants/colors.dart';

customTextFullEdit(
  String text,
  Color color,
  double size,
  FontWeight weight, [
  TextAlign? align,
]) =>
    Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
      ),
    );

customTextBarTitle(String text, [TextAlign? align]) => Text(
      text,
      style: const TextStyle(
        fontSize: 22,
        color: TextColors.white,
        fontWeight: FontWeight.w700,
      ),
      textAlign: align,
    );

customTextTitle(String text, [TextAlign? align]) => Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        color: TextColors.white,
        fontWeight: FontWeight.w600,
      ),
      textAlign: align,
    );

customTextContent(String text, [TextAlign? align]) => Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        color: TextColors.white,
        fontWeight: FontWeight.w400,
      ),
      textAlign: align,
    );

customTextContentTitle(String text, [TextAlign? align]) => Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        color: TextColors.white,
        fontWeight: FontWeight.w600,
      ),
      textAlign: align,
    );

customTextContentBlur(String text, [TextAlign? align]) => Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        color: Color.fromARGB(255, 240, 240, 240),
        fontWeight: FontWeight.w400,
      ),
      textAlign: align,
    );

customTextButtonBlack(String text) => Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: TextColors.black,
        fontWeight: FontWeight.w600,
      ),
    );

customTextButtonWhite(String text) => Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: TextColors.white,
        fontWeight: FontWeight.w600,
      ),
    );

Widget customTextBarTitleActivate(String text, TextAlign align) {
  List<String> words = text.split(' ');
  String lastWord = words.last;

  return RichText(
    textAlign: align,
    text: TextSpan(
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      children: [
        ...words.sublist(0, words.length - 1).map((word) {
          return TextSpan(
            text: '$word ',
            style: const TextStyle(
              color: TextColors.white,
            ),
          );
        }),
        TextSpan(
          text: lastWord,
          style: const TextStyle(
            color: TextColors.primary,
          ),
        ),
      ],
    ),
  );
}

customTextBarTitleColor(String text, Color color, [TextAlign? align]) => Text(
      text,
      style: TextStyle(
        fontSize: 22,
        color: color,
        fontWeight: FontWeight.w700,
      ),
      textAlign: align,
    );
