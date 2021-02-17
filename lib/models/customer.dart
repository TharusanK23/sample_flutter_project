import 'package:eStore/routes/index.dart';

class Customer {
  Customer({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.error,
  });

  String id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  ErrorModel error;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["_id"] ?? "",
        firstName: json["first_name"] ?? "",
        lastName: json["last_name"] ?? "",
        email: json["email"] ?? "",
        phoneNumber: json["phone_number"] ?? "",
        error: ErrorModel(isError: false)
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone_number": phoneNumber,
      };
}
