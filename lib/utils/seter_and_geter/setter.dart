import 'package:eStore/routes/index.dart';

class SetData {
  //set the token
  static Future<void> setToken(String token) async {
    await StorageService.saveToPreferences(CUSTOMER_TOKEN, token);
  }

  //set the two factor
  static Future<void> setTwoFactor(String twoFactor) async {
    await StorageService.saveToPreferences(TWO_FACTOR, twoFactor);
  }
  
  //set the secret
  static Future<void> setSecretKey(String secret) async {
    await StorageService.saveToPreferences(SECRET_KEY, secret);
  }

  //set the RefreshToken
  static Future<void> setRefreshToken(String refreshToken) async {
    await StorageService.saveToPreferences(CUSTOMER_REFRESH_TOKEN, refreshToken);
  }

  //set the customer id
  static Future<void> setCustomerId(String customerId) async {
    await StorageService.saveToPreferences(CUSTOMER_ID, customerId);
  }
}