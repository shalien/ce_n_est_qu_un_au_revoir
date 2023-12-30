import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart';

class MessageWidget extends StatelessWidget {
  final String uuid;

  const MessageWidget({super.key, required this.uuid});

  Future<Map<String, String>> getMessage() async {
    Uri uri = Uri.https('mesfreres.projetretro.io', '/api/messages/$uuid');

    var response = await get(uri);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      return {
        'from': json['from'],
        'to': json['to'],
        'content': json['content'],
      };
    }

    return {};
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getMessage(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.from} : ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    Text(
                      snapshot.data!['from']!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.to} : ',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    Text(
                      snapshot.data!['to']!,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    snapshot.data!['content']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    maxLines: 5,
                  ),
                ),
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
