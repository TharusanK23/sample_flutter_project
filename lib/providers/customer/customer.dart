import 'package:eStore/routes/index.dart';

class CustomerProvider {
  //user verify
  static Future<Customer> getCustomer(BuildContext context, String id) async {
    try {
      final response = await get(CUSTOMER + 'identy/get_customer/$id', token: true);
      RestCommonBody _body = Deserialize.responseMessage(response);
      if (!_body.isError) {
        final perOrderDetails = Customer.fromJson(_body.result);
        return perOrderDetails;
      } else {
        return Customer(error: _body.error);
      }
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
}
