import 'package:eStore/routes/index.dart';
part 'package:eStore/screens/views/product_list/components/product_list_card/product_list_card_view_model.dart';

class ProductListViewModel extends BaseViewModel {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;
  Future<void> initialise({@required BuildContext context}) async {}

// Select Category
  void selectCategory(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
