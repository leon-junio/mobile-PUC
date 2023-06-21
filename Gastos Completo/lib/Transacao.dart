import 'package:flutter/foundation.dart';

class Transacao {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  Transacao(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date}) {}
}
