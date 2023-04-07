import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_tracker/data/database.dart';
import 'package:money_tracker/models/transaction_model.dart';
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
  int savingBalance = 0;
  final TextEditingController _nominalController =
      TextEditingController(text: " ");
  final TextEditingController _descController =
      TextEditingController(text: " ");
  final _box = Hive.box("money_tracker");
  TransactionData db = TransactionData();
  final PanelController _panelController = PanelController();

  @override
  void initState() {
    if (_box.get("TODOLIST") == null) {
      db.createInitialData();
      savingBalance = 0;
    } else {
      // there already exists data
      db.loadData();
      for (var data in (db.transaction)) {
        data.description == "Save Money"
            ? savingBalance += data.nominal
            : savingBalance -= data.nominal;
      }
    }

    super.initState();
  }

  void togglePanel() {
    _panelController.isPanelOpen
        ? _panelController.close()
        : _panelController.open();
  }

  void createNewTask(String buttonTitle) {
    showDialog(
      context: context,
      builder: (context) => CustomPopUp(
          nominalController: _nominalController,
          descController: _descController,
          title: buttonTitle,
          add: buttonTitle != "Save Money"
              ? () {
                  saveNewPay(
                      int.parse(_nominalController.text), _descController.text);
                }
              : () {
                  saveNewSaving(int.parse(_nominalController.text));
                }),
    );
    print(db.transaction.length);
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.transaction.removeAt(index);
    });
    db.updateDataBase();
  }

  void saveNewPay(int nom, String desc) {
    setState(() {
      db.transaction.add(TransactionModel(
          id: db.transaction.length,
          time: DateTime.now(),
          nominal: nom,
          description: desc));
      _nominalController.clear();
      _descController.clear();
      savingBalance -= nom;
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void saveNewSaving(
    int nom,
  ) {
    setState(() {
      savingBalance += nom;
      db.transaction.add(TransactionModel(
          id: db.transaction.length,
          time: DateTime.now(),
          nominal: nom,
          description: "Save"));
      _nominalController.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
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
                    savingBalance.toString(),
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
                      createNewTask("Save Money");
                    },
                    heightButton: 60),
                CustomButton(
                    radiusButton: defaultRadius,
                    buttonColor:
                        savingBalance > 0 ? primaryColor : lightGreyColor,
                    widthButton: 145,
                    buttonText: "Pay",
                    onPressed: savingBalance > 0
                        ? () {
                            createNewTask("Pay");
                          }
                        : () {},
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
                    db.transaction.length > 0
                        ? Column(
                            children: db.transaction
                                .map(
                                  (data) => TransactionTile(
                                      desc: data.description,
                                      nominal: data.nominal,
                                      time: data.time),
                                )
                                .toList(),
                          )
                        : Container(
                            margin: const EdgeInsets.only(top: 50),
                            child: Text(
                              "No Transaction",
                              style: primaryColorText.copyWith(fontSize: 16),
                            ),
                          )
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
