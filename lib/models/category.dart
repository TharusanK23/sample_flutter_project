import 'package:eStore/routes/index.dart';

class Category {
  Category({
    this.id,
    this.name,
    this.desc,
    this.error,
  });

  String id;
  String name;
  String desc;
  ErrorModel error;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
      id: json["_id"],
      name: json["name"],
      desc: json["desc"],
      error: ErrorModel(isError: false));

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "desc": desc,
      };
}
