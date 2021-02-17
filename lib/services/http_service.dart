import 'package:eStore/routes/index.dart';
import 'package:http/http.dart' as http;

getHeader(isAuth) async {
  var headers = {
    'Content-Type': 'application/json',
    'accept-language': GlobalVariable.deviceLocale
  };
  if (isAuth) {
    headers['Authorization'] = 'Bearer ${await GetData.getToken()}';
  }

  return headers;
}

dynamic internetErrorObj = {
  "result": null,
  "isError": true,
  "error": {
    "title": "Internet issue",
    "detail": "Check your internet connection",
    "status": null
  }
};

post(String url, Map data, {token: false}) async {
  printUrlAndHeaderAndBody(
      url: BASE_URL + url,
      body: data,
      header: await getHeader(token),
      method: "post");
  final postUrlWithParam = http.post(BASE_URL + url,
      body: json.encode(data), headers: await getHeader(token));
  return CommonMethod.isInternet().then((connection) {
    if (connection != null && connection) {
      return postUrlWithParam.then((res) async {
        RestCommonBody body = Deserialize.responseMessage(res);
        if (body.error.status == HttpCodeEnum.RequestTimeout.status) {
          return postUrlWithParam.then((res) async {
            RestCommonBody body = Deserialize.responseMessage(res);
            if (body.error.status == HttpCodeEnum.RequestTimeout.status) {
              return http.post(BASE_URL + CUSTOMER + "identy/refresh-token",
                  body: {
                    "refresh_token": await GetData.getRefreshToken()
                  }).then((resRefershToken) async {
                RestCommonBody _body =
                    Deserialize.responseMessage(resRefershToken);
                if (!_body.isError) {
                  await storeToken(_body.result);
                  return http
                      .post(BASE_URL + url,
                          body: json.encode(data),
                          headers: await getHeader(token))
                      .then((newUrlWithParam) {
                    return newUrlWithParam;
                  });
                } else {
                  return resRefershToken;
                }
              });
            } else if (body.error.status == HttpCodeEnum.Ok.status) {
              return res;
            } else {
              return res;
            }
          });
        } else if (body.error.status == HttpCodeEnum.Ok.status) {
          return res;
        } else {
          return res;
        }
      });
    } else {
      return RestCommonBody.fromJson(json.decode(internetErrorObj));
    }
  });
}

get(String url, {token: false}) async {
  printUrlAndHeaderAndBody(
      url: BASE_URL + url,
      body: {},
      header: await getHeader(token),
      method: "get");

  final getUrlWithParam =
      http.get(BASE_URL + url, headers: await getHeader(token));

  return CommonMethod.isInternet().then((connection) {
    if (connection != null && connection) {
      getUrlWithParam.timeout(Duration(seconds: 5), onTimeout: () {
        return null;
      });
      return getUrlWithParam.then((res) async {
        RestCommonBody body = Deserialize.responseMessage(res);
        if (body.error.status == HttpCodeEnum.RequestTimeout.status) {
          return http.post(BASE_URL + CUSTOMER + "identy/refresh-token", body: {
            "refresh_token": await GetData.getRefreshToken()
          }).then((resRefershToken) async {
            RestCommonBody _body = Deserialize.responseMessage(resRefershToken);
            if (!_body.isError) {
              await storeToken(_body.result);
              return http
                  .get(BASE_URL + url, headers: await getHeader(token))
                  .then((newUrlWithParam) {
                return newUrlWithParam;
              });
            } else {
              return resRefershToken;
            }
          });
        } else if (body.error.status == HttpCodeEnum.Ok.status) {
          return res;
        } else {
          return res;
        }
      });
    } else {
      return RestCommonBody.fromJson(json.decode(internetErrorObj));
    }
  });
}

storeToken(dynamic result) async {
  print(result['token']);
  SetData.setToken(result['token']);
  SetData.setRefreshToken(result['refreshToken']);
}

//print the data and help to copy the data
printUrlAndHeaderAndBody(
    {String url, dynamic body, dynamic header, method}) async {
  if (enableCopyFunction) {
    if (method == 'post') {
      GlobalVariable.postData =
          await App.prepareDataForApiTeam(url: url, body: body);
    } else if (method == 'get') {
      GlobalVariable.getData =
          await App.prepareDataForApiTeam(url: url, body: body);
    } else if (method == 'put') {
      GlobalVariable.putData =
          await App.prepareDataForApiTeam(url: url, body: body);
    } else if (method == 'delete') {
      GlobalVariable.deleteData =
          await App.prepareDataForApiTeam(url: url, body: body);
    }
  }
  if (enablePrint) {
    print("----------------------------------------");
    print(url);
    print(jsonEncode(body));
    print(header);
    print("----------------------------------------");
  }
}
