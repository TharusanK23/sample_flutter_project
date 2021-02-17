import 'package:eStore/routes/index.dart';

class OtpProvider {
  //user verify
  static Future<RestCommonBody> verify(Map data) async {
    print(json.encode(data));
    final response = await post(CUSTOMER + 'verify', data);
    RestCommonBody _body = Deserialize.responseMessage(response);
    if (!_body.isError) {
      preapreAfterOTPValidateLogin(result: _body.result);
    }
    return _body;
  }

  //  save tokens and user details
  static Future<void> preapreAfterOTPValidateLogin({dynamic result}) async {
    await SetData.setToken(result['token']);
  }
}
