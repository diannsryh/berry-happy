class Balances {
  final int idBalance;
  final String iduser;
  final int balance;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  Balances({
    required this.idBalance,
    required this.iduser,
    required this.balance,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory Balances.fromJson(Map<String, dynamic> json) {
    return Balances(
      idBalance: json['id_balance'],
      iduser: json['iduser'],
      balance: json['balance'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
    );
  }
}
