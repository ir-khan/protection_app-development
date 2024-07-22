import 'package:flutter/material.dart';


class PaywallDetails extends StatelessWidget {
  const PaywallDetails({
    super.key,
    required this.imagePath,
    required this.text,
  });

  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(imagePath),
            ),
            const SizedBox(width: 20),
            Text(
              text,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
