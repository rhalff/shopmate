import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmate/app.dart';
import 'package:shopmate/application.dart';

import 'blocs/app_bloc_delegate.dart';
import 'features/auth/blocs/blocs.dart';
import 'features/cart/blocs/blocs.dart';
import 'features/customer/blocs/blocs.dart';

void main() async {
  final application = Application();

  await application.setup();

  BlocSupervisor.delegate = AppBlocDelegate(
    authBloc: application.authBloc,
  );

  await application.init();

  return runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>.value(
          value: application.authBloc,
        ),
        BlocProvider<CartBloc>.value(
          value: application.cartBloc,
        ),
        BlocProvider<CustomerBloc>.value(
          value: application.customerBloc,
        ),
      ],
      child: ShopMateApp(
        application: application,
      ),
    ),
  );
}
