import 'package:eStore/routes/index.dart';

class CommonMethod {
  // static Future<bool> checkConnectivity() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.none) {
  //     return false;
  //   } else if (connectivityResult == ConnectivityResult.wifi ||
  //       connectivityResult == ConnectivityResult.mobile) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  static Future<bool> isInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network, make sure there is actually a net connection.
      if (await DataConnectionChecker().hasConnection) {
        // Mobile data detected & internet connection confirmed.
        return true;
      } else {
        // Mobile data detected but no internet connection found.
        return false;
      }
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a WIFI network, make sure there is actually a net connection.
      if (await DataConnectionChecker().hasConnection) {
        // Wifi detected & internet connection confirmed.
        return true;
      } else {
        // Wifi detected but no internet connection found.
        return false;
      }
    } else {
      // Neither mobile data or WIFI detected, not internet connection found.
      return false;
    }
  }
}

class Deserialize {
  static RestCommonBody responseMessage(response) {
    try {
      RestCommonBody body = RestCommonBody.fromJson(json.decode(response.body));
      return body;
    } catch (e) {
      RestCommonBody body = new RestCommonBody(
          result: {},
          isError: true,
          error: new ErrorModel(
              title: e.toString(),
              detail: e.toString(),
              status: 400,
              isError: true));
      return body;
    }
  }
}
