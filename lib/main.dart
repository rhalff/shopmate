import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shopmate/app.dart';
import 'package:shopmate/application.dart';

import 'blocs/app_bloc_delegate.dart';

void main() async {
  final application = Application();

  await application.setup();

  BlocSupervisor.delegate = AppBlocDelegate(
    authBloc: application.authBloc,
  );

  await application.init();

  return runApp(
    ShopMateApp(
      application: application,
    ),
  );
}
