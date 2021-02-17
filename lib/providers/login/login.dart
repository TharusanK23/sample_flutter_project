import 'package:eStore/routes/index.dart';

class LoginProvider {
  //user login
  static Future<RestCommonBody> login(BuildContext context, Map data) async {
    print(json.encode(data));
    final response = await post(CUSTOMER + 'identy/login', data);
    RestCommonBody _body = Deserialize.responseMessage(response);
    if (!_body.isError) {
      dynamic _data = parseJwt(_body.result['token']);
      preapreAfterOTPValidateLogin(result: _body.result);
      preapreAfterLogin(result: _data['Customer']);
    }
    return _body;
  }

  //  save tokens and user details
  static Future<void> preapreAfterOTPValidateLogin({dynamic result}) async {
    await SetData.setToken(result['token']);
    await SetData.setRefreshToken(result['refreshToken']);
    await RemoveData.removeTwoFactor();
  }

  //  save tokens and user details
  static Future<void> preapreAfterLogin({dynamic result}) async {
    await SetData.setCustomerId(result['customerId']);
  }
}

class UserData {
  static getCustomerId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var customerId = prefs.getString(CUSTOMER_ID);
    if (customerId != null && customerId != "")
      return customerId;
    else
      return null;
  }
}
