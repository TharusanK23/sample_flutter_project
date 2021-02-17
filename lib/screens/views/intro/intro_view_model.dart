import 'package:eStore/routes/index.dart';

class IntroViewModel extends BaseViewModel {
  PageController _controller = PageController();
  int _pageIndex = 0;

  PageController get controller => _controller;
  int get pageIndex => _pageIndex;

// Navigate to main screen
  void navigateScreen() {
    AppRouter.navigator.pushNamedAndRemoveUntil(AppRouter.mainScreen, (route) => false);
  }

// Slide intro screen
  void nextIntro(int value) {
    _pageIndex = value;
    notifyListeners();
  }
}
