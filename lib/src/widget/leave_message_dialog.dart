import 'dart:async';
import 'dart:convert';

import 'package:ce_n_est_qu_un_au_revoir/src/ce_n_est_qu_un_au_revoir.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart';

class LeaveAMessageDialog extends StatefulWidget {
  const LeaveAMessageDialog({super.key});

  @override
  State<LeaveAMessageDialog> createState() => _LeaveAMessageDialogState();
}

class _LeaveAMessageDialogState extends State<LeaveAMessageDialog> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  final TextEditingController _fromTextEditingController =
      TextEditingController();

  final TextEditingController _toTextEditingController =
      TextEditingController();

  final TextEditingController _messageTextEditingController =
      TextEditingController();

  bool validate() {
    if (_formState.currentState!.validate()) {
      setState(() {});
    }

    return false;
  }

  Future<String?> sendForm() async {
    String from = _fromTextEditingController.text;
    String to = _toTextEditingController.text;
    String message = _messageTextEditingController.text;

    if (from.isEmpty || to.isEmpty || message.isEmpty) {
      return null;
    }

    Uri uri = Uri.https('mesfreres.projetretro.io', '/api/messages');

    var response = await post(uri, body: {
      'from': from,
      'to': to,
      'content': message,
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      var json = jsonDecode(response.body);

      return json['id'];
    }

    return null;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Icon(Icons.mail,
          color: Theme.of(context).colorScheme.secondary,
          size: MediaQuery.of(context).size.width * 0.05),
      content: FutureBuilder<String?>(
        initialData: null,
        future: sendForm(),
        builder: (context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(AppLocalizations.of(context)!.messageSent,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03)),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.secondary),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: SelectableText(
                    'https://fals.projetretro.io/${snapshot.data!}',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('error ${snapshot.error.toString()}');
          }

          return Form(
            key: _formState,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppLocalizations.of(context)!.leaveMessage,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.03)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).colorScheme.secondary),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${AppLocalizations.of(context)!.notice} $incomingYear',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.03),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: _fromTextEditingController,
                  decoration: InputDecoration(
                    label: Text(AppLocalizations.of(context)!.from),
                    labelStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.03),
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.fromError;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _toTextEditingController,
                  decoration: InputDecoration(
                    label: Text(AppLocalizations.of(context)!.to),
                    labelStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.03),
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.toError;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _messageTextEditingController,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.message,
                    labelText: AppLocalizations.of(context)!.message,
                    labelStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.03),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  maxLength: 2000,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.messageError;
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FilledButton(
                          onPressed: () => validate(),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          child: Text(AppLocalizations.of(context)!.send)),
                      const Spacer(),
                      FilledButton(
                          onPressed: () => Navigator.pop(context),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                          ),
                          child: Text(AppLocalizations.of(context)!.cancel)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _fromTextEditingController.dispose();
    _toTextEditingController.dispose();
    _messageTextEditingController.dispose();
    super.dispose();
  }
}
