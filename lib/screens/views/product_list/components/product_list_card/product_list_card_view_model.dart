part of 'package:eStore/screens/views/product_list/product_list_view_model.dart';

extension ProductListCardViewModel on ProductListViewModel {
  // Navigate to product full view
  void navigateProductFullView() {
    AppRouter.navigator.pushNamed(AppRouter.productFullViewScreen);
    notifyListeners();
  }
}
