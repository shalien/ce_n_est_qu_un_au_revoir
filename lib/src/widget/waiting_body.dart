import 'package:ce_n_est_qu_un_au_revoir/src/ce_n_est_qu_un_au_revoir.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WaitingBody extends StatelessWidget {
  final String? uuid;

  const WaitingBody({super.key, this.uuid});

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
              '${AppLocalizations.of(context)!.incoming_year}... $incomingYear'), // 'Happy New Year',
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.nextYealWillBehereIn,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TimerCountdownWidget(),
                  ),
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
            ],
          ),
        ),
        bottomNavigationBar: const BottomAppBarWidget());
  }
}
