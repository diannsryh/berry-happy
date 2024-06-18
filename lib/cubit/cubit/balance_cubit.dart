import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:berry_happy/dto/balances.dart';
import 'package:berry_happy/services/data_service.dart';
import 'package:meta/meta.dart';

part 'balance_state.dart';

class BalanceCubit extends Cubit<BalanceState> {
  BalanceCubit() : super(const BalanceInitialState());

  // Future<void> fetchBalance() async {
  //   try {
  //     debugPrint("fire api");
  //     int fetchedBalance;
  //     List<Balances>? balances;
  //     balances = await DataService.fetchBalances();
  //     fetchedBalance = balances[0].balance;
  //     emit(BalanceState(balance: fetchedBalance));
  //   } catch (e) {
  //     debugPrint("Error fetched data");
  //   }
  // }

  void updateBalance(int spending) {
    final int newBalance = state.balance - spending;
    emit(BalanceState(balance: newBalance));
  }
}
