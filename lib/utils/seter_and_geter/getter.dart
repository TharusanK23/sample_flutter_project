import 'package:eStore/routes/index.dart';

class GetData {
  //get the token
  static Future<String> getToken() async {
    final String token =
        await StorageService.getFromPreferences(CUSTOMER_TOKEN);
    return token;
  }

  //get the refresh token
  static Future<String> getRefreshToken() async {
    final String refreshToken =
        await StorageService.getFromPreferences(CUSTOMER_REFRESH_TOKEN);
    return refreshToken;
  }

  //get the two factor
  static Future<bool> getTwoFactor() async {
    final String getTwoFactor =
        await StorageService.getFromPreferences(TWO_FACTOR);
    return (getTwoFactor == '' || getTwoFactor == null) ? false : true;
  }

  //get the secret key
  static Future<String> getSecretKey() async {
    final String secret = await StorageService.getFromPreferences(SECRET_KEY);
    return secret;
  }
}
