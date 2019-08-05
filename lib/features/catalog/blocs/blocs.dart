/// {@category Catalog}
library catalog.blocs;

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shopmate/features/catalog/models/models.dart';
import 'package:shopmate/features/catalog/repositories/repositories.dart';

part 'categories/categories_bloc.dart';
part 'categories/categories_events.dart';
part 'categories/categories_state.dart';
part 'departments/departments_bloc.dart';
part 'departments/departments_events.dart';
part 'departments/departments_state.dart';
part 'favorites/favorites_bloc.dart';
part 'favorites/favorites_events.dart';
part 'favorites/favorites_state.dart';
part 'product/product_bloc.dart';
part 'product/product_events.dart';
part 'product/product_state.dart';
part 'products/products_bloc.dart';
part 'products/products_events.dart';
part 'products/products_state.dart';
part 'reviews/reviews_bloc.dart';
part 'reviews/reviews_events.dart';
part 'reviews/reviews_state.dart';
