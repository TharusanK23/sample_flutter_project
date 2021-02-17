import 'package:eStore/routes/index.dart';
part 'package:eStore/screens/views/home/components/category/category_view_model.dart';
part 'package:eStore/screens/views/home/components/product_list/product_list_view_model.dart';

class HomeViewModel extends BaseViewModel {
  List<Category> _category;
  List<Widget> _banners = [
    BannerView(
      bannerColor: Color(0xFF4A3298),
      image: null,
      subTitle: "A Summer Surpise",
      title: "Cashback 20%",
    ),
    BannerView(
      bannerColor: null,
      image: "https://i.ytimg.com/vi/28QbnxL56kY/maxresdefault.jpg",
      subTitle: "",
      title: "",
    ),
    BannerView(
      bannerColor: Colors.red,
      image: null,
      subTitle: "A Summer Surpise",
      title: "Cashback 10%",
    ),
    BannerView(
      bannerColor: null,
      image:
          "https://img.freepik.com/free-vector/modern-black-friday-sale-banner-template-with-3d-background-red-splash_1361-1877.jpg?size=626&ext=jpg",
      subTitle: "",
      title: "",
    )
  ];

  ApiHandleModel _apiHandler =
      new ApiHandleModel(isEmpty: false, isError: false, isLoaded: false);
  ErrorModel errorModel;

  ApiHandleModel get apiHandler => _apiHandler;
  List<Widget> get banners => _banners;
  int _widgetCurrentIndex = 0;

  int get widgetCurrentIndex => _widgetCurrentIndex;

// Screen initaialise
  Future<void> initialise({@required BuildContext context}) async {
    BlocProvider.of<CategoryBloc>(context).add(FetchCategory(context));
  }

  //--- change the auto scroll top image index (for indicator)
  void changeImageIndex({@required int index}) {
    _widgetCurrentIndex = index;
    notifyListeners();
  }
}
