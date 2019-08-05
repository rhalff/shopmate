import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shopmate/features/auth/repositories/repositories.dart';

import 'application_events.dart';
import 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final ApplicationState initialState;
  final AuthRepository authRepository;

  ApplicationBloc({
    this.initialState,
    @required this.authRepository,
  }) {
    assert(authRepository != null);
    assert(initialState != null);
  }

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    if (event is SignedIn) {
      yield* _signedIn(event);
    } else if (event is SignOut) {
      yield* _signedOut(event);
    }
  }

  Stream<ApplicationState> _signedIn(SignedIn event) async* {
    try {
      await authRepository.setAccessToken(event.accessToken);

      yield Applicationenticated();
    } catch (error) {
      yield ApplicationError(error);
    }
  }

  Stream<ApplicationState> _signedOut(SignOut event) async* {
    await authRepository.removeAccessToken();

    yield NotApplicationenticated();
  }
}
