import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import 'application.dart';
import 'features/cart/screens/screens.dart';
import 'features/catalog/blocs/blocs.dart';
import 'features/catalog/models/models.dart';
import 'features/catalog/screens/screens.dart';
import 'features/checkout/screens/screens.dart';
import 'features/customer/screens/screens.dart';
import 'features/department/screens/screens.dart';
import 'home.dart';
import 'widgets/widgets.dart';

RouteFactory routes({
  @required Application application,
}) {
  return (RouteSettings settings) {
    Widget screen;
    final arguments = settings.arguments as Map<String, dynamic> ?? {};
    switch (settings.name) {
      case Home.route:
        screen = MultiBlocProvider(
          providers: [
            BlocProvider<DepartmentsBloc>.value(
              value: application.departmentsBloc,
            ),
          ],
          child: Home(),
        );
        break;
      case DepartmentScreen.route:
        screen = MultiBlocProvider(
          providers: [
            BlocProvider<CategoriesBloc>.value(
              value: application.categoriesBloc,
            ),
            BlocProvider<DepartmentsBloc>.value(
              value: application.departmentsBloc,
            ),
            BlocProvider<FavoritesBloc>.value(
              value: application.favoritesBloc,
            ),
            BlocProvider<ProductBloc>.value(
              value: application.productBloc,
            ),
            BlocProvider<ProductsBloc>.value(
              value: application.productsBloc,
            ),
          ],
          child: DepartmentScreen(
            department: arguments['department'] as Department,
          ),
        );
        break;
      case CatalogScreen.route:
        screen = MultiBlocProvider(
          providers: [
            BlocProvider<DepartmentsBloc>.value(
              value: application.departmentsBloc,
            ),
            BlocProvider<FavoritesBloc>.value(
              value: application.favoritesBloc,
            ),
            BlocProvider<ProductBloc>.value(
              value: application.productBloc,
            ),
            BlocProvider<ProductsBloc>.value(
              value: application.productsBloc,
            ),
          ],
          child: CatalogScreen(),
        );
        break;
      case CartScreen.route:
        screen = CartScreen();
        break;
      case CheckoutScreen.route:
        screen = CheckoutScreen();
        break;
      case ProductScreen.route:
        screen = MultiBlocProvider(
          providers: [
            BlocProvider<FavoritesBloc>.value(
              value: application.favoritesBloc,
            ),
            BlocProvider<ProductBloc>.value(
              value: application.productBloc,
            ),
            BlocProvider<ReviewsBloc>.value(
              value: application.reviewsBloc,
            ),
          ],
          child: ProductScreen(
            product: arguments['product'] as Product,
          ),
        );
        break;
      case SignUpScreen.route:
        screen = SignUpScreen();
        break;
      case SignInScreen.route:
        screen = SignInScreen();
        break;
      case ProfileScreen.route:
        screen = ProfileScreen();
        break;
      case ForgotPasswordScreen.route:
        screen = ForgotPasswordScreen();
        break;
      default:
        screen = ErrorContainer(
          title: 'Route not found',
        );
    }

    return PageTransition(
      child: screen,
      type: arguments['transition'] as PageTransitionType ??
          PageTransitionType.rightToLeft,
      alignment: arguments['alignment'] as Alignment,
      duration: arguments['duration'] as Duration ??
          const Duration(milliseconds: 400),
    );
  };
}
