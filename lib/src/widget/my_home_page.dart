import 'package:ce_n_est_qu_un_au_revoir/src/ce_n_est_qu_un_au_revoir.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String? uuid;

  const MyHomePage({super.key, this.uuid});

  bool _isTodayFirstDayOfYear() {
    final DateTime now = DateTime.now();
    return now.month == 1 && now.day == 1;
  }

  @override
  Widget build(BuildContext context) {
    print(uuid);

    if (_isTodayFirstDayOfYear()) {
      return NewYearBody(uuid: uuid);
    } else {
      return WaitingBody(uuid: uuid);
    }
  }
}
