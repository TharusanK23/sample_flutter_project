import 'package:eStore/routes/index.dart';

class ProductFullViewModel extends BaseViewModel {
  ScrollController _scrollController = ScrollController();
  double currentPosition = 0.0;
  double _imageSize = 0.0;
  String _imageUrl = "";
  int _imageCurrentIndex = 0;
  int _selectedIndex = 0;
  List<Color> colors = [
    Color(0xFF356C95),
    Color(0xFFF8C078),
    Color(0xFFA29B9B)
  ];

  Product _product = products[0];
  List<Product> _productList = products;
  int _numOfItems = 1;

  ScrollController get scrollController => _scrollController;
  double get imageSize => _imageSize;
  String get imageUrl => _imageUrl;
  int get imageCurrentIndex => _imageCurrentIndex;
  int get selectedIndex => _selectedIndex;

  Product get product => _product;
  List<Product> get productList => _productList;
  int get numOfItems => _numOfItems;

// Screen initialise
  void initialise({@required BuildContext context}) {
    _imageSize = ((MediaQuery.of(context).size.width * 0.2));
    _imageUrl = _product.image[0];
    _scrollController.addListener(() {
      _appBarScroll();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

// Scroll position change
  void _appBarScroll() {
    currentPosition = _scrollController.offset;
    notifyListeners();
  }

// Change Item count
  void changeItemCount({bool isAdding = false}) {
    if (!isAdding) {
      if (numOfItems > 1) {
        _numOfItems--;
      }
    } else {
      _numOfItems++;
    }
    notifyListeners();
  }

// Change Image
  void setImage({@required String image, int index}) {
    _imageUrl = image;
    _imageCurrentIndex = index;
    notifyListeners();
  }

// Select color
  void selectColor(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

// View Image
  void viewProductImage(BuildContext context) async {
    CommonPop.floatingDialog(
        context: context,
        widget: ImageViewer(
          images: _product.image,
        ));
  }
}
