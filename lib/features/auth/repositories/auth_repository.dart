part of auth.repositories;

const authKey = 'auth';

class AuthRepository {
  FlutterSecureStorage secureStorage;
  TuringApi turingApi;
  AuthRepository({
    this.turingApi,
    this.secureStorage,
  });

  Future<void> setAccessToken(String accessToken) async {
    await secureStorage.write(key: authKey, value: accessToken);

    turingApi.setOAuthToken('customer', accessToken);
  }

  Future<String> getAccessToken() async {
    return secureStorage.read(key: authKey);
  }

  Future<bool> isAuthenticated() async {
    return this.getAccessToken().then((String token) => token != null);
  }

  Future<void> removeAccessToken() async {
    turingApi.setOAuthToken('customer', null);

    return secureStorage.delete(key: authKey);
  }
}
