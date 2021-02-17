part of 'package:eStore/screens/views/home/home_view_model.dart';

extension CategoryViewModel on HomeViewModel {
  List<Category> get category => _category;

  void setCategoryListLoad({
    @required bool isNotify,
    @required CategoryState categoryState,
    @required BuildContext context,
  }) {
    if (categoryState is CategoryLoaded) {
      _category = categoryState.category;
      categoryList = _category;
      _apiHandler =
          ApiHandleModel(isEmpty: false, isError: false, isLoaded: true);
      if (isNotify) {
        notifyListeners();
      } else if (categoryState is CategoryError) {
        if (isNotify) {
          notifyListeners();
        }
        _apiHandler =
            ApiHandleModel(isEmpty: false, isError: true, isLoaded: true);
        errorModel = ErrorModel(
            detail: 'orderState.servieOptionWithIndustry.message',
            title: "getAllServiceOptionAndIndustry",
            isError: true);
      } else {
        if (isNotify) {
          notifyListeners();
        }
      }
    }
  }
}
