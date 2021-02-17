import 'package:eStore/routes/index.dart';

class App {
  static String currency = GlobalVariable.currency;

  //Check the user has logged in or not
  static Future<bool> authorized() async {
    final String getToken =
        await StorageService.getFromPreferences(CUSTOMER_TOKEN);
    return (getToken == '' || getToken == null) ? false : true;
  }

  //Get the devie Hight
  static double getDeviceHight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  //Get the device width
  static double getDeviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static backScreenOnce(BuildContext context) {
    Navigator.pop(context);
  }

  //prepare data for get post and put methos data
  static Future<dynamic> prepareDataForApiTeam(
      {@required String url, @required dynamic body}) async {
    String token = "";
    if (enableCopyFunction) {
      if (await authorized()) {
        token = await GetData.getToken();
      }
      return {"url": url.toString(), "body": body.toString(), "token": token};
    } else {
      return {"url": "", "body": "", "token": ""};
    }
  }

  //formating price
  static priceFormat(price) {
    RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    Function mathFunc = (Match match) => '${match[1]},';

    return price.replaceAllMapped(reg, mathFunc);
  }

  // return price in basket and orders
  static String getPrice(price,
      {isSecondary = false, currency, needZero = false}) {
    var _currency = "";

    try {
      _currency =
          currency != null ? currency.trim() : App.currency.toString().trim();
    } catch (e) {}

    try {
      if (!isSecondary)
        return price == 0
            ? needZero
                ? _currency + priceFormat(price.toStringAsFixed(2))
                : ""
            : _currency + priceFormat(price.toStringAsFixed(2));
      else {
        if (price > 0)
          return '(+ ' +
              _currency +
              priceFormat(price.toStringAsFixed(2)) +
              ')';
        else if (price < 0)
          return '(- ' +
              _currency +
              priceFormat(price.toStringAsFixed(2)) +
              ')';
        else
          return "";
      }
    } catch (e) {
      return "";
    }
  }
}
