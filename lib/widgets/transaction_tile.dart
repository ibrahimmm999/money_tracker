import 'package:flutter/material.dart';
import 'package:money_tracker/shared/theme.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/save.png",
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Save Money",
                    style: primaryColorText,
                  ),
                  Text(
                    "February 19, 03:25 PM",
                    style: lightGreyColorText.copyWith(fontSize: 10),
                  )
                ],
              ),
            ],
          ),
          Text(
            "+ 100.000",
            style: primaryColorText.copyWith(fontWeight: semibold),
          )
        ],
      ),
    );
  }
}
