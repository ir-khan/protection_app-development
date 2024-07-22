import 'package:flutter/material.dart';
import 'package:protection_app/app/core/constants/colors.dart';

class PaywallButtonList extends StatefulWidget {
  const PaywallButtonList({super.key});

  @override
  _ButtonListState createState() => _ButtonListState();
}

class _ButtonListState extends State<PaywallButtonList> {
  int _selectedButtonIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildButton(0, 'Monthly', '\$40'),
        const SizedBox(height: 20),
        buildButton(1, 'Annual', '\$110'),
      ],
    );
  }

  Widget buildButton(int index, String title, String price) {
    bool isSelected = _selectedButtonIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedButtonIndex = index;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.075,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            color: AppColors.darkGrey,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.darkGrey,
              width: 2,
            )),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              Text(
                price,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
