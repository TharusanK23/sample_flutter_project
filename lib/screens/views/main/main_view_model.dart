import 'package:eStore/routes/index.dart';

class MainViewModel extends BaseViewModel {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> _widgetList = [
    HomeView(),
    ProductListView(),
    Container(
        child: Center(
      child: Text('Comming soon...'),
    )),
    ProfileView()
  ];

  int _currentIndex = 0;

  GlobalKey get scaffoldKey => _scaffoldKey;

  List<Widget> get widgetList => _widgetList;
  int get currentIndex => _currentIndex;

// Change Screens
  void changePage({@required int index}) {
    _currentIndex = index;
    notifyListeners();
  }
}
