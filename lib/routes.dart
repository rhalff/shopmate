import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application.dart';
import 'features/cart/screens/screens.dart';
import 'features/catalog/blocs/blocs.dart';
import 'features/catalog/screens/screens.dart';
import 'features/checkout/screens/screens.dart';
import 'features/customer/screens/screens.dart';
import 'features/department/screens/screens.dart';
import 'home.dart';
import 'widgets/widgets.dart';

RouteFactory routes({
  @required Application application,
}) {
  return (settings) {
    Widget screen;
    final Map<String, dynamic> arguments = settings.arguments;
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
          child: DepartmentScreen(department: arguments['department']),
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
          child: ProductScreen(product: arguments['product']),
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

    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}
