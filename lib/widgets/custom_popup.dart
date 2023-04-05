import 'package:flutter/material.dart';
import 'package:money_tracker/shared/theme.dart';

class CustomPopUp extends StatefulWidget {
  final String title;
  final Function() add;
  final TextEditingController controller;
  const CustomPopUp(
      {super.key,
      required this.title,
      required this.add,
      required this.controller});

  @override
  State<CustomPopUp> createState() => _CustomPopUpState();
}

class _CustomPopUpState extends State<CustomPopUp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: whiteColor,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('CANCEL', style: primaryColorText),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'SAVE',
            style: primaryColorText,
          ),
        )
      ],
      title: Text(widget.title, style: primaryColorText),
      content: TextField(
        keyboardType: TextInputType.number,
        controller: widget.controller,
        style: primaryColorText,
        cursorColor: primaryColor,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
              borderSide: BorderSide(color: buttonBlueColor, width: 5)),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
            borderSide: BorderSide(
              color: lightGreyColor,
              width: 3,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}
