class Spending {
  final int idSpending;
  final String iduser;
  final int amount;
  final DateTime createdAt;

  Spending({
    required this.idSpending,
    required this.iduser,
    required this.amount,
    required this.createdAt,
  });

  factory Spending.fromJson(Map<String, dynamic> json) {
    return Spending(
      idSpending: json['id_spending'],
      iduser: json['iduser'],
      amount: json['amount'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
