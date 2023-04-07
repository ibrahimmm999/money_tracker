import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_tracker/models/transaction_model.dart';

class TransactionData {
  List<TransactionModel> transaction = [];

  // reference our box
  final _myBox = Hive.box('money_tracker');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    transaction = [];
  }

  // load the data from database
  void loadData() {
    transaction = _myBox.get("transaction");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("transaction", transaction);
  }
}
