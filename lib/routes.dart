import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application.dart';
import 'features/auth/blocs/blocs.dart';
import 'features/cart/blocs/blocs.dart';
import 'features/cart/screens/screens.dart';
import 'features/catalog/blocs/blocs.dart';
import 'features/catalog/screens/screens.dart';
import 'features/checkout/screens/screens.dart';
import 'features/customer/blocs/blocs.dart';
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
        screen = Builder(builder: (BuildContext context) {
          return BlocProviderTree(
            blocProviders: [
              BlocProvider<AuthBloc>(bloc: application.authBloc),
              BlocProvider<CartBloc>(bloc: application.cartBloc),
              BlocProvider<CustomerBloc>(bloc: application.customerBloc),
              BlocProvider<DepartmentsBloc>(bloc: application.departmentsBloc),
            ],
            child: Home(),
          );
        });
        break;
      case DepartmentScreen.route:
        screen = Builder(builder: (BuildContext context) {
          return BlocProviderTree(
            blocProviders: [
              BlocProvider<AuthBloc>(bloc: application.authBloc),
              BlocProvider<CartBloc>(bloc: application.cartBloc),
              BlocProvider<CategoriesBloc>(bloc: application.categoriesBloc),
              BlocProvider<CustomerBloc>(bloc: application.customerBloc),
              BlocProvider<DepartmentsBloc>(bloc: application.departmentsBloc),
              BlocProvider<FavoritesBloc>(bloc: application.favoritesBloc),
              BlocProvider<ProductBloc>(bloc: application.productBloc),
              BlocProvider<ProductsBloc>(bloc: application.productsBloc),
            ],
            child: DepartmentScreen(department: arguments['department']),
          );
        });
        break;
      case CatalogScreen.route:
        screen = Builder(builder: (BuildContext context) {
          return BlocProviderTree(
            blocProviders: [
              BlocProvider<AuthBloc>(bloc: application.authBloc),
              BlocProvider<CartBloc>(bloc: application.cartBloc),
              BlocProvider<CustomerBloc>(bloc: application.customerBloc),
              BlocProvider<DepartmentsBloc>(bloc: application.departmentsBloc),
              BlocProvider<FavoritesBloc>(bloc: application.favoritesBloc),
              BlocProvider<ProductBloc>(bloc: application.productBloc),
              BlocProvider<ProductsBloc>(bloc: application.productsBloc),
            ],
            child: CatalogScreen(),
          );
        });
        break;
      case CartScreen.route:
        screen = Builder(builder: (BuildContext context) {
          return BlocProviderTree(
            blocProviders: [
              BlocProvider<AuthBloc>(bloc: application.authBloc),
              BlocProvider<CartBloc>(bloc: application.cartBloc),
              BlocProvider<CustomerBloc>(bloc: application.customerBloc),
            ],
            child: CartScreen(),
          );
        });
        break;
      case CheckoutScreen.route:
        screen = Builder(builder: (BuildContext context) {
          return BlocProviderTree(
            blocProviders: [
              BlocProvider<AuthBloc>(bloc: application.authBloc),
              BlocProvider<CartBloc>(bloc: application.cartBloc),
              BlocProvider<CustomerBloc>(bloc: application.customerBloc),
            ],
            child: CheckoutScreen(),
          );
        });
        break;
      case ProductScreen.route:
        screen = Builder(builder: (BuildContext context) {
          return BlocProviderTree(
            blocProviders: [
              BlocProvider<AuthBloc>(bloc: application.authBloc),
              BlocProvider<CartBloc>(bloc: application.cartBloc),
              BlocProvider<CustomerBloc>(bloc: application.customerBloc),
              BlocProvider<FavoritesBloc>(bloc: application.favoritesBloc),
              BlocProvider<ProductBloc>(bloc: application.productBloc),
              BlocProvider<ReviewsBloc>(bloc: application.reviewsBloc),
            ],
            child: ProductScreen(product: arguments['product']),
          );
        });
        break;
      case SignUpScreen.route:
        screen = Builder(builder: (BuildContext context) {
          return BlocProviderTree(
            blocProviders: [
              BlocProvider<AuthBloc>(bloc: application.authBloc),
              BlocProvider<CustomerBloc>(bloc: application.customerBloc),
            ],
            child: SignUpScreen(),
          );
        });
        break;
      case SignInScreen.route:
        screen = Builder(builder: (BuildContext context) {
          return BlocProviderTree(
            blocProviders: [
              BlocProvider<AuthBloc>(bloc: application.authBloc),
              BlocProvider<CustomerBloc>(bloc: application.customerBloc),
            ],
            child: SignInScreen(),
          );
        });
        break;
      case ProfileScreen.route:
        screen = Builder(builder: (BuildContext context) {
          return BlocProviderTree(
            blocProviders: [
              BlocProvider<AuthBloc>(bloc: application.authBloc),
              BlocProvider<CustomerBloc>(bloc: application.customerBloc),
            ],
            child: ProfileScreen(),
          );
        });
        break;
      case ForgotPasswordScreen.route:
        screen = Builder(builder: (BuildContext context) {
          return BlocProviderTree(
            blocProviders: [
              BlocProvider<AuthBloc>(bloc: application.authBloc),
              BlocProvider<CustomerBloc>(bloc: application.customerBloc),
            ],
            child: ForgotPasswordScreen(),
          );
        });
        break;
      default:
        screen = ErrorContainer(
          title: 'Route not found',
        );
    }

    return MaterialPageRoute(
      builder: (BuildContext context) => BlocBuilder(
        bloc: application.authBloc,
        builder: (
          BuildContext context,
          AuthState state,
        ) {
          return screen;
        },
      ),
    );
  };
}
