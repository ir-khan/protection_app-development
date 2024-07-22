import 'package:flutter/material.dart';

class PaywallListDescriptions extends StatelessWidget {
  const PaywallListDescriptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Image(
              image: AssetImage('assets/images/ic_paywall_1.png'),
            ),
            SizedBox(height: 10),
            Image(
              image: AssetImage('assets/images/ic_paywall_2.png'),
            ),
            SizedBox(height: 10),
            Image(
              image: AssetImage('assets/images/ic_paywall_3.png'),
            )
          ],
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Browse securely and privately',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Protect your photos',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Keep your accounts safe',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            )
          ],
        ),
      ],
    );
  }
}
