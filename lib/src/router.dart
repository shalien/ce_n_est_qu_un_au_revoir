import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'ce_n_est_qu_un_au_revoir.dart';

final router = GoRouter(routes: [
  GoRoute(
      path: '/:uuid',
      pageBuilder: (context, state) {
        print(state.pathParameters);

        return MaterialPage(
          child: MyHomePage(
            uuid: state.pathParameters['uuid'],
          ),
        );
      }),
  GoRoute(
    path: '/',
    pageBuilder: (context, state) {
      print(state.fullPath);

      return const MaterialPage(
        child: MyHomePage(),
      );
    },
  ),
], debugLogDiagnostics: true);
