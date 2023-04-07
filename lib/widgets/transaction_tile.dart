import 'package:flutter/material.dart';
import 'package:money_tracker/shared/theme.dart';

class TransactionTile extends StatelessWidget {
  final String desc;
  final int nominal;
  final DateTime time;
  const TransactionTile(
      {super.key,
      required this.desc,
      required this.nominal,
      required this.time});

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
                desc == "Save Money" ? "assets/save.png" : "assets/pay.png",
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
                    desc,
                    style: primaryColorText,
                  ),
                  Text(
                    time.toString(),
                    style: lightGreyColorText.copyWith(fontSize: 10),
                  )
                ],
              ),
            ],
          ),
          Text(
            (desc == "Save Money" ? "+ " : "- ") + nominal.toString(),
            style: primaryColorText.copyWith(fontWeight: semibold),
          )
        ],
      ),
    );
  }
}
