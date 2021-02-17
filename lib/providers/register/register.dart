import 'package:eStore/routes/index.dart';

class RegisterProvider {
  //user registration
  static Future<RestCommonBody> reigster(BuildContext context, Map data) async {
    print(json.encode(data));

    try {
      final response = await post(CUSTOMER + 'identy/register', data);
      RestCommonBody _body = Deserialize.responseMessage(response);
      if (!_body.isError) {
        dynamic _data = parseJwt(_body.result['token']);
        preapreAfterOTPValidateLogin(result: _body.result);
        LoginProvider.preapreAfterLogin(result: _data['Customer']);
      }
      return _body;
    } on SocketException {
      throw CommonPop.customeDialog(
          context,
          PopsMsg(
            discription: "The Internet connection appears to be offline",
          )).then((value) {
        if (value) {
          SystemNavigator.pop();
        }
      });
    }
  }

  //  save tokens and user details
  static Future<void> preapreAfterOTPValidateLogin({dynamic result}) async {
    await SetData.setToken(result['token']);
    await RemoveData.removeTwoFactor();
    await SetData.setSecretKey(result['secret']);
  }
}
