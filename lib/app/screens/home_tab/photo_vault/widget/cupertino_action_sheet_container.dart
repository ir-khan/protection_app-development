import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoActionSheetContainer extends StatelessWidget {
  const CupertinoActionSheetContainer({
    super.key,
    required this.text,
    required this.onPressed,
    required this.fontWeight,
  });

  final String text;
  final Function() onPressed;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF181818),
        // borderRadius: BorderRadius.circular(10),
      ),
      child: CupertinoActionSheetAction(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.blue,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
