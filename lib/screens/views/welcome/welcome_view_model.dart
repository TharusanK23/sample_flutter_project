import 'package:eStore/routes/index.dart';

class WelComeViewModel extends BaseViewModel {
  List<String> landingImages = [
    ImagePath.loginImage1,
    ImagePath.splashImage3,
    ImagePath.splashImage,
    ImagePath.splashImage4,
    ImagePath.loginImage3
  ];

  int _imageCurrentIndex = 0;

  int get imageCurrentIndex => _imageCurrentIndex;

  // ==== change the auto scroll top image index (for indicator)
  changeImageIndex({@required int index}) {
    _imageCurrentIndex = index;
    notifyListeners();
  }

  // ==== Navigate to login page ====
  void navigateScreen() {
    AppRouter.navigator.pushNamed(AppRouter.loginScreen);
  }
}
