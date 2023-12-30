import 'package:ce_n_est_qu_un_au_revoir/src/widget/bottom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'leave_message_button.dart';
import 'message_widget.dart';

class NewYearBody extends StatelessWidget {
  final String? uuid;

  const NewYearBody({super.key, this.uuid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 8,
          titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary),
          centerTitle: true,
          shape: const BeveledRectangleBorder(),
          title: Text(
              AppLocalizations.of(context)!.happyNewYear), // 'Happy New Year',
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(AppLocalizations.of(context)!.happyNewYearMessageStart,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 15,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary)),
              Text(DateTime.now().year.toString(),
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 10,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary)),
              Text(AppLocalizations.of(context)!.happyNewYearMessageEnd,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 15,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary)),
              uuid == null
                  ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: LeaveAMessageButton(),
                    )
                  : MessageWidget(
                      uuid: uuid!,
                    ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomAppBarWidget());
  }
}
