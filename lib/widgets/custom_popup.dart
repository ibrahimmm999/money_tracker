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
    TextEditingController descriptionController =
        TextEditingController(text: " ");
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
      content: widget.title == "Pay"
          ? SizedBox(
              height: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Input your income",
                    style: primaryColorText.copyWith(fontSize: 13),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: widget.controller,
                    style: primaryColorText,
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(defaultRadius),
                          borderSide:
                              BorderSide(color: buttonBlueColor, width: 5)),
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
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Description",
                    style: primaryColorText.copyWith(fontSize: 13),
                  ),
                  TextField(
                    controller: descriptionController,
                    style: primaryColorText,
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(defaultRadius),
                          borderSide:
                              BorderSide(color: buttonBlueColor, width: 5)),
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
                ],
              ),
            )
          : SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Input your income",
                    style: primaryColorText.copyWith(fontSize: 13),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: widget.controller,
                    style: primaryColorText,
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(defaultRadius),
                          borderSide:
                              BorderSide(color: buttonBlueColor, width: 5)),
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
                ],
              ),
            ),
    );
  }
}
