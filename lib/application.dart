import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jaguar_cache/jaguar_cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api/api.dart';
import 'api/log_interceptor.dart';
import 'features/auth/blocs/blocs.dart';
import 'features/auth/repositories/repositories.dart';
import 'features/cart/blocs/blocs.dart';
import 'features/cart/repositories/repositories.dart';
import 'features/catalog/blocs/blocs.dart';
import 'features/catalog/repositories/repositories.dart';
import 'features/checkout/blocs/blocs.dart';
import 'features/checkout/repositories/repositories.dart';
import 'features/customer/blocs/blocs.dart';
import 'features/customer/repositories/repositories.dart';

class Config {}

class Application {
  SharedPreferences sharedPreferences;
  FlutterSecureStorage secureStorage;
  Config config;
  Cache cache;
  TuringApi turingApi;

  AuthRepository authRepository;
  CartRepository cartRepository;
  CategoryRepository categoryRepository;
  CustomerRepository customerRepository;
  DepartmentRepository departmentRepository;
  FavoritesRepository favoritesRepository;
  OrderRepository orderRepository;
  ProductRepository productRepository;
  ShippingRegionRepository shippingRegionRepository;

  AuthBloc authBloc;
  CartBloc cartBloc;
  CategoriesBloc categoriesBloc;
  CustomerBloc customerBloc;
  DepartmentsBloc departmentsBloc;
  FavoritesBloc favoritesBloc;
  OrderBloc orderBloc;
  ProductBloc productBloc;
  ProductsBloc productsBloc;
  ReviewsBloc reviewsBloc;
  ShippingBloc shippingBloc;

  Application({
    this.config,
  });

  Future<void> setup() async {
    sharedPreferences = await SharedPreferences.getInstance();

    secureStorage = FlutterSecureStorage();

    cache = InMemoryCache(
      const Duration(
        hours: 5,
      ),
    );

    turingApi = TuringApi(
      interceptors: [
        LogInterceptor(),
      ],
    );

    setupRepositories();

    final accessToken = await authRepository.getAccessToken();

    var isAuthenticated = false;
    if (accessToken != null) {
      turingApi.setOAuthToken('customer', accessToken);

      isAuthenticated = true;
    }

    setupBlocs(
      isAuthenticated: isAuthenticated,
    );
  }

  void setupRepositories() {
    final attributesApi = turingApi.getAttributesApi();
    final categoriesApi = turingApi.getCategoriesApi();
    final customersApi = turingApi.getCustomersApi();
    final departmentsApi = turingApi.getDepartmentsApi();
    final ordersApi = turingApi.getOrdersApi();
    final productsApi = turingApi.getProductsApi();
    final shippingApi = turingApi.getShippingApi();
    final shoppingCartApi = turingApi.getShoppingCartApi();
    final taxApi = turingApi.getTaxApi();

    cartRepository = CartRepository(
      shoppingCartApi: shoppingCartApi,
      taxApi: taxApi,
    );

    authRepository = AuthRepository(
      turingApi: turingApi,
      secureStorage: secureStorage,
    );

    customerRepository = CustomerRepository(
      cache: cache,
      customersApi: customersApi,
      turingApi: turingApi,
      secureStorage: secureStorage,
    );

    departmentRepository = DepartmentRepository(
      departmentsApi: departmentsApi,
      cache: cache,
    );

    favoritesRepository = FavoritesRepository(
      sharedPreferences: sharedPreferences,
    );

    productRepository = ProductRepository(
      productsApi: productsApi,
      attributesApi: attributesApi,
      cache: cache,
    );

    orderRepository = OrderRepository(
      ordersApi: ordersApi,
    );

    shippingRegionRepository = ShippingRegionRepository(
      shippingApi: shippingApi,
    );

    categoryRepository = CategoryRepository(
      categoriesApi: categoriesApi,
    );
  }

  void setupBlocs({
    bool isAuthenticated,
  }) {
    cartBloc = CartBloc(
      cartRepository: cartRepository,
    );

    authBloc = AuthBloc(
      initialState: isAuthenticated ? Authenticated() : NotAuthenticated(),
      authRepository: authRepository,
    );

    customerBloc = CustomerBloc(
      authBloc: authBloc,
      customerRepository: customerRepository,
    );

    departmentsBloc = DepartmentsBloc(
      departmentRepository: departmentRepository,
    );

    favoritesBloc = FavoritesBloc(
      favoritesRepository: favoritesRepository,
    );

    reviewsBloc = ReviewsBloc(
      productRepository: productRepository,
    );

    productBloc = ProductBloc(
      productRepository: productRepository,
      reviewsBloc: reviewsBloc,
    );
    productsBloc = ProductsBloc(
      productRepository: productRepository,
    );
    orderBloc = OrderBloc(
      orderRepository: orderRepository,
    );
    shippingBloc = ShippingBloc(
      shippingRegionRepository: shippingRegionRepository,
    );
    categoriesBloc = CategoriesBloc(
      categoryRepository: categoryRepository,
    );
  }

  Future<void> init() async {
    cartBloc.dispatch(LoadCart());
    categoriesBloc.dispatch(LoadCategories());
    departmentsBloc.dispatch(LoadDepartments());
    favoritesBloc.dispatch(LoadFavorites());

    if (await authRepository.isAuthenticated()) {
      customerBloc.dispatch(LoadCustomer());
    }
  }

  void dispose() {
    authBloc.dispose();
    cartBloc.dispose();
    categoriesBloc.dispose();
    customerBloc.dispose();
    departmentsBloc.dispose();
    favoritesBloc.dispose();
    orderBloc.dispose();
    productBloc.dispose();
    productsBloc.dispose();
    reviewsBloc.dispose();
    shippingBloc.dispose();
  }
}
