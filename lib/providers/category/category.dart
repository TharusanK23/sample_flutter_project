import 'package:eStore/routes/index.dart';

class CategoryProvider {
  //user verify
  static Future<dynamic> getAllCategory(BuildContext context) async {
    final response = await get(CATEGORY + 'category/get-all-category', token: true);
    RestCommonBody _body = Deserialize.responseMessage(response);
    if (!_body.isError) {
      final pastQuestion = _body.result.cast<Map<String, dynamic>>();
      final pastQuestionList = pastQuestion.map<Category>((json) {
        return Category.fromJson(json);
      }).toList();
      return pastQuestionList;
    } else {
      return null;
    }
  }
}
