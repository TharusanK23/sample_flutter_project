import 'package:eStore/routes/index.dart';

class RestCommonBody {
  dynamic result;
  ErrorModel error;

  bool isError;

  RestCommonBody({this.result, this.error, this.isError});

  RestCommonBody.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    error = ErrorModel.fromJson(json["error"], json["isError"]);
    isError = json["isError"];
  }
}

class ErrorModel {
  String title;
  String detail;
  int status;
  bool isError;

  ErrorModel({
    this.title,
    this.detail,
    this.status,
    this.isError,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json, bool isError) =>
      ErrorModel(
          title: json["title"] ?? "",
          detail: json["detail"] ?? "",
          status: json["status"] ?? 0,
          isError: isError ?? false);
}

class ApiHandleModel {
  bool isEmpty;
  bool isError;
  bool isLoaded;

  ApiHandleModel(
      {@required this.isEmpty,
      @required this.isError,
      @required this.isLoaded});
}
