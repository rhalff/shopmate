import 'dart:io';

import 'package:jaguar_mimetype/jaguar_mimetype.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:shopmate/features/cart/api/api.dart';
import 'package:shopmate/features/cart/models/models.dart';
import 'package:shopmate/features/catalog/api/api.dart';
import 'package:shopmate/features/catalog/models/models.dart';
import 'package:shopmate/features/checkout/api/api.dart';
import 'package:shopmate/features/checkout/models/models.dart';
import 'package:shopmate/features/customer/api/api.dart';
import 'package:shopmate/features/customer/models/models.dart';

import 'auth/api_key_auth.dart';
import 'auth/basic_auth.dart';
import 'auth/oauth.dart';
import 'custom_io_client.dart';
import 'model/models.dart';

final _jsonRepo = JsonRepo()
  ..addAll(apiSerializers)
  ..addAll(cartSerializers)
  ..addAll(catalogSerializers)
  ..addAll(checkoutSerializers)
  ..addAll(customerSerializers);

final Map<String, CodecRepo> _converters = {
  MimeTypes.json: _jsonRepo,
};

final _defaultInterceptors = <Interceptor>[
  OAuthInterceptor(headerName: 'user-key'),
];

class TuringApi {
  List<Interceptor> interceptors;
  String basePath = 'https://backendapi.turing.com';
  Route _baseRoute;

  // Add custom global interceptors, put overrideInterceptors to true
  // to set your interceptors only (auth interceptors will not be added)
  TuringApi({
    List<Interceptor> interceptors,
    bool overrideInterceptors = false,
    String baseUrl,
  }) {
    _baseRoute = Route(baseUrl ?? basePath).withClient(
      CustomClient(
        HttpClient()
          ..connectionTimeout = Duration(seconds: 5)
          ..idleTimeout = Duration(seconds: 2)
          ..userAgent = 'ShopMate App',
      )..timeout = Duration(seconds: 20),
    );
    if (interceptors == null) {
      this.interceptors = _defaultInterceptors;
    } else if (overrideInterceptors) {
      this.interceptors = interceptors;
    } else {
      this.interceptors = List.from(_defaultInterceptors)..addAll(interceptors);
    }

    this.interceptors.forEach((interceptor) {
      _baseRoute.before(interceptor.before);
      _baseRoute.after(interceptor.after);
    });
  }

  void setOAuthToken(String name, String token) {
    (_defaultInterceptors[0] as OAuthInterceptor).tokens[name] = token;
  }

  void setBasicAuth(String name, String username, String password) {
    (_defaultInterceptors[1] as BasicAuthInterceptor).authInfo[name] =
        BasicAuthInfo(username, password);
  }

  void setApiKey(String name, String apiKey) {
    (_defaultInterceptors[2] as ApiKeyAuthInterceptor).apiKeys[name] = apiKey;
  }

  // Get AttributesApi instance, base route and serializer can be overridden by a given but be careful,
  // by doing that all interceptors will not be executed
  AttributesApi getAttributesApi(
      {Route base, Map<String, CodecRepo> converters}) {
    if (base == null) {
      base = _baseRoute;
    }
    if (converters == null) {
      converters = _converters;
    }
    return AttributesApi(base: base, converters: converters);
  }

  // Get CategoriesApi instance, base route and serializer can be overridden by a given but be careful,
  //  by doing that all interceptors will not be executed
  CategoriesApi getCategoriesApi(
      {Route base, Map<String, CodecRepo> converters}) {
    if (base == null) {
      base = _baseRoute;
    }
    if (converters == null) {
      converters = _converters;
    }
    return CategoriesApi(base: base, converters: converters);
  }

  // Get CustomersApi instance, base route and serializer can be overridden by a given but be careful,
  // by doing that all interceptors will not be executed
  CustomersApi getCustomersApi(
      {Route base, Map<String, CodecRepo> converters}) {
    if (base == null) {
      base = _baseRoute;
    }
    if (converters == null) {
      converters = _converters;
    }
    return CustomersApi(base: base, converters: converters);
  }

  // Get DepartmentsApi instance, base route and serializer can be overridden by a given but be careful,
  // by doing that all interceptors will not be executed
  DepartmentsApi getDepartmentsApi(
      {Route base, Map<String, CodecRepo> converters}) {
    if (base == null) {
      base = _baseRoute;
    }
    if (converters == null) {
      converters = _converters;
    }
    return DepartmentsApi(base: base, converters: converters);
  }

  // Get OrdersApi instance, base route and serializer can be overridden by a given but be careful,
  // by doing that all interceptors will not be executed
  OrdersApi getOrdersApi({Route base, Map<String, CodecRepo> converters}) {
    if (base == null) {
      base = _baseRoute;
    }
    if (converters == null) {
      converters = _converters;
    }
    return OrdersApi(base: base, converters: converters);
  }

  // Get ProductsApi instance, base route and serializer can be overridden by a given but be careful,
  // by doing that all interceptors will not be executed
  ProductsApi getProductsApi({Route base, Map<String, CodecRepo> converters}) {
    if (base == null) {
      base = _baseRoute;
    }
    if (converters == null) {
      converters = _converters;
    }
    return ProductsApi(
      base: base,
      converters: converters,
    );
  }

  // Get ShippingApi instance, base route and serializer can be overridden by a given but be careful,
  //  by doing that all interceptors will not be executed
  ShippingApi getShippingApi({Route base, Map<String, CodecRepo> converters}) {
    if (base == null) {
      base = _baseRoute;
    }
    if (converters == null) {
      converters = _converters;
    }
    return ShippingApi(base: base, converters: converters);
  }

  // Get ShoppingCartApi instance, base route and serializer can be overridden by a given but be careful,
  //  by doing that all interceptors will not be executed
  ShoppingCartApi getShoppingCartApi(
      {Route base, Map<String, SerializerRepo> converters}) {
    if (base == null) {
      base = _baseRoute;
    }
    if (converters == null) {
      converters = _converters;
    }

    return ShoppingCartApi(base: base, converters: converters);
  }

  // Get StripeApi instance, base route and serializer can be overridden by a given but be careful,
  //  by doing that all interceptors will not be executed
  StripeApi getStripeApi({Route base, Map<String, SerializerRepo> converters}) {
    if (base == null) {
      base = _baseRoute;
    }
    if (converters == null) {
      converters = _converters;
    }
    return StripeApi(base: base, converters: converters);
  }

  // Get TaxApi instance, base route and serializer can be overridden by a given but be careful,
  //  by doing that all interceptors will not be executed
  TaxApi getTaxApi({Route base, Map<String, CodecRepo> converters}) {
    if (base == null) {
      base = _baseRoute;
    }
    if (converters == null) {
      converters = _converters;
    }
    return TaxApi(base: base, converters: converters);
  }
}
