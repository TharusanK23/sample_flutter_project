part of 'package:eStore/screens/views/home/home_view_model.dart';

extension ProductSampleListViewModel on HomeViewModel {
  void navigateProductFullView() {
    AppRouter.navigator.pushNamed(AppRouter.productFullViewScreen);
    notifyListeners();
  }
}
