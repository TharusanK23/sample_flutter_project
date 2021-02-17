import 'package:eStore/routes/index.dart';

class RemoveData {
  // remove the token
  static Future<void> removeToken() async {
    await StorageService.removePreferences(CUSTOMER_TOKEN);
  }

  //remove the refresh token
  static Future<void> removeRefreshToken() async {
    await StorageService.removePreferences(CUSTOMER_REFRESH_TOKEN);
  }

  //remove the two factor
  static Future<void> removeTwoFactor() async {
    await StorageService.removePreferences(TWO_FACTOR);
  }
}
