import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'leave_message_dialog.dart';

class LeaveAMessageButton extends StatelessWidget {
  const LeaveAMessageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const LeaveAMessageDialog()),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.mail,
                  size: MediaQuery.of(context).size.width * 0.03)),
          Text(
            AppLocalizations.of(context)!.leaveMessage,
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03),
          ),
        ],
      ),
    );
  }
}
