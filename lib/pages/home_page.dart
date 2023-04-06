import 'package:flutter/material.dart';
import 'package:money_tracker/shared/theme.dart';
import 'package:money_tracker/widgets/custom_button.dart';
import 'package:money_tracker/widgets/transaction_tile.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../widgets/custom_popup.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PanelController _panelController = PanelController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void togglePanel() => _panelController.isPanelOpen
      ? _panelController.close()
      : _panelController.open();
  @override
  Widget build(BuildContext context) {
    TextEditingController saveMoneyC = TextEditingController(text: " ");
    TextEditingController payC = TextEditingController(text: " ");
    Widget header() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to",
                style: lightGreyColorText.copyWith(fontWeight: medium),
              ),
              Text(
                "Money Tracker",
                style:
                    primaryColorText.copyWith(fontSize: 18, fontWeight: bold),
              )
            ],
          ),
          Icon(
            Icons.settings,
            color: primaryColor,
          )
        ],
      );
    }

    Widget content() {
      return Padding(
        padding: EdgeInsets.only(
            right: defaultMargin, left: defaultMargin, top: defaultMargin),
        child: Column(
          children: [
            header(),
            Container(
              margin: EdgeInsets.only(top: defaultMargin),
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor,
                      blurRadius: 12,
                      offset: const Offset(0, 8), // Shadow position
                    ),
                  ],
                  image: const DecorationImage(
                      image: AssetImage("assets/container.png"),
                      fit: BoxFit.fill)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "My savings",
                    style: whiteColorText,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Rp. 10.430.000",
                    style: whiteColorText.copyWith(
                        fontSize: 24, fontWeight: semibold),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                    radiusButton: defaultRadius,
                    buttonColor: primaryColor,
                    widthButton: 145,
                    buttonText: "Save Money",
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => CustomPopUp(
                            controller: saveMoneyC,
                            title: "Save Money",
                            add: () {}),
                      );
                    },
                    heightButton: 60),
                CustomButton(
                    radiusButton: defaultRadius,
                    buttonColor: primaryColor,
                    widthButton: 145,
                    buttonText: "Pay",
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => CustomPopUp(
                            controller: saveMoneyC, title: "Pay", add: () {}),
                      );
                    },
                    heightButton: 60),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SlidingUpPanel(
          parallaxEnabled: true,
          controller: _panelController,
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(defaultRadius)),
          color: whiteColor,
          maxHeight: MediaQuery.of(context).size.height * 0.85,
          minHeight: MediaQuery.of(context).size.height * 0.4,
          panelBuilder: (controller) {
            return SingleChildScrollView(
              controller: controller,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin, vertical: 15),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: togglePanel,
                      child: Container(
                        height: 6,
                        width: 60,
                        decoration: BoxDecoration(
                            color: lightGreyColor,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Transactions History",
                      style: primaryColorText.copyWith(
                          fontSize: 18, fontWeight: semibold),
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    TransactionTile(),
                    TransactionTile(),
                    TransactionTile(),
                    TransactionTile(),
                    TransactionTile(),
                    TransactionTile(),
                    TransactionTile(),
                    TransactionTile(),
                    TransactionTile(),
                    TransactionTile(),
                    TransactionTile(),
                    TransactionTile(),
                    TransactionTile(),
                    TransactionTile(),
                    TransactionTile(),
                    TransactionTile(),
                    TransactionTile(),
                    TransactionTile(),
                    TransactionTile(),
                    TransactionTile(),
                  ],
                ),
              ),
            );
          },
          body: SafeArea(child: content())),
      backgroundColor: backgroundColor,
    );
  }
}
