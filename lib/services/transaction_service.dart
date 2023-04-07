import 'package:hive/hive.dart';

class TransactionService {
  final transactionService = Hive.box("money_tracker");
  Future<void> createItem(Map<String, dynamic> newItem) async {
    await transactionService.add(newItem);
  }
}
