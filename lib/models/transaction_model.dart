class TransactionModel {
  final int id;
  final DateTime time;
  final int nominal;
  final String description;

  const TransactionModel({
    required this.id,
    required this.time,
    required this.nominal,
    required this.description,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
        id: json['id'],
        time: json['time'],
        nominal: json['nominal'],
        description: json['description']);
  }

  List<Object?> get props => [id, time, nominal, description];
}
