import 'package:money2/money2.dart';

class Store {
  Store({required this.currency, required this.decimals});

  final String currency;
  final int decimals;

  Money money(int amount) {
    return Money.fromInt(amount, isoCode: currency);
  }
}
