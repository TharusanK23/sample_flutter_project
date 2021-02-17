import 'package:eStore/routes/index.dart';

class OtpViewModel extends BaseViewModel {
  String _string = '';
  String _code1 = '';
  String _code2 = '';
  String _code3 = '';
  String _code4 = '';
  String _code5 = '';
  String _code6 = '';

  String _otp;
  OtpArguments _otpArguments;

  bool _verify = false;
  bool _isLogin = false;

  String get string => _string;
  String get code1 => _code1;
  String get code2 => _code2;
  String get code3 => _code3;
  String get code4 => _code4;
  String get code5 => _code5;
  String get code6 => _code6;

  String get otp => _otp;

  bool get verify => _verify;
  bool get isLogin => _isLogin;

  Future<void> initialise({@required BuildContext context}) async {
    _otpArguments = ModalRoute.of(context).settings.arguments;
    _otp = _otpArguments.otp;
    _isLogin = _otpArguments.isLogin;
  }

// Verify OTP
  void verifyOtp(BuildContext context) async {
    _showLoading(context);
    if (_otp == _string) {
      await SetData.setTwoFactor("true");
      Future.delayed(Duration(milliseconds: 3000), () {
        App.backScreenOnce(context);
        if (!_isLogin) {
          AppRouter.navigator.pushNamedAndRemoveUntil(
            AppRouter.introScreen,
            (Route<dynamic> route) => false,
          );
        } else {
          AppRouter.navigator.pushNamedAndRemoveUntil(
            AppRouter.mainScreen,
            (Route<dynamic> route) => false,
          );
        }
      });
    } else {
      App.backScreenOnce(context);
      print('Verify Faild');
      CommonPop.errorPopup(context, title: 'Failed', message: 'OTP code is mismatch, please check your OTP code');
    }
    notifyListeners();
  }

// OTP keybord type
  void updateCode(String value) {
    switch (_string.length) {
      case 0:
        {
          _code1 = value;
          break;
        }
      case 1:
        {
          _code2 = value;
          break;
        }
      case 2:
        {
          _code3 = value;
          break;
        }
      case 3:
        {
          _code4 = value;
          break;
        }
      case 4:
        {
          _code5 = value;
          break;
        }
      case 5:
        {
          _code6 = value;
          break;
        }
      default:
        {
          return;
        }
    }
    _string += value;
    print(_string);
    notifyListeners();
    if (_string.length > 5) {
      _verify = true;
      return;
    } else {
      return;
    }
  }

// Delete OTP from keyboard
  void deleteCode() {
    switch (string.length) {
      case 1:
        {
          _code1 = '';
          break;
        }
      case 2:
        {
          _code2 = '';
          break;
        }
      case 3:
        {
          _code3 = '';
          break;
        }
      case 4:
        {
          _code4 = '';
          break;
        }
      case 5:
        {
          _code5 = '';
          break;
        }
      case 6:
        {
          _code6 = '';
          break;
        }
      default:
        {
          return;
        }
    }
    _string = _string.substring(0, _string.length - 1);
    if (_string.length < 6) {
      _verify = false;
    }
    print(_string);
    notifyListeners();
  }

// Show loading when verify OTP
  void _showLoading(BuildContext context) {
    CommonPop.showLoading(context);
  }
}
