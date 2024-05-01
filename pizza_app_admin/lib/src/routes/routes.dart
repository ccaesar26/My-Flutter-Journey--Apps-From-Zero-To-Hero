import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_app_admin/src/blocs/authentication_bloc/authentication_bloc.dart';

final _navigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

GoRouter router(AuthenticationBloc authenticationBloc) {
  return GoRouter(
    navigatorKey: _navigatorKey,
    initialLocation: '/',
    redirect: (context, state) {
      if (authenticationBloc.state.status == AuthenticationStatus.unknown) {
        return '/';
      }
    },
    routes: [

    ],
  );
}