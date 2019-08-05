/// {@category Customer}
library customer.blocs;

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:errors/errors.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../auth/blocs/blocs.dart';
import '../models/models.dart';
import '../repositories/repositories.dart';

part 'customer_bloc.dart';
part 'customer_events.dart';
part 'customer_state.dart';
