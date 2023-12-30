import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../theme.dart';

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.createdWith,
                ),
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                Text(
                  AppLocalizations.of(context)!.by,
                ),
                Text(
                  AppLocalizations.of(context)!.shalien,
                  style: TextStyle(color: royalBlueTheme.highlightColor),
                ),
              ],
            ),
          ),
          /*
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton(
                onPressed: () => _launchGithubURL(),
                child: const Text('Github')),
          ),
          */
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton(
                onPressed: () => showLicensePage(context: context),
                child: Text(AppLocalizations.of(context)!.license)),
          ),
        ],
      ),
    );
  }
}
