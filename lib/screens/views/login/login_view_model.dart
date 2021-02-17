import 'package:eStore/routes/index.dart';

class LoginViewModel extends BaseViewModel {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _phoneCtrl = new TextEditingController();
  TextEditingController _passwordCtrl = new TextEditingController();

  bool _autoValidate = false;
  bool _showPassword = false;
  String _mobileNumber = "";

  Map _country = {
    "id": 1,
    "lable": "Srilanka",
    "lable_code": "LK",
    "code": "+94",
    "flag":
        "https://upload.wikimedia.org/wikipedia/commons/4/45/Sri_lanka_flag_300.png"
  };
  final List<dynamic> countryList = [
    {
      "id": 1,
      "lable": "France",
      "lable_code": "FR",
      "code": "+33",
      "flag":
          "https://seeklogo.com/images/F/france-flag-logo-DBC61B59A7-seeklogo.com.png"
    },
    {
      "id": 2,
      "lable": "Srilanka",
      "lable_code": "LK",
      "code": "+94",
      "flag":
          "https://upload.wikimedia.org/wikipedia/commons/4/45/Sri_lanka_flag_300.png"
    }
  ];

  GlobalKey get scaffoldKey => _scaffoldKey;
  GlobalKey get formKey => _formKey;

  TextEditingController get phoneCtrl => _phoneCtrl;
  TextEditingController get passwordCtrl => _passwordCtrl;

  bool get autoValidate => _autoValidate;
  bool get showPassword => _showPassword;

  Map get country => _country;

  void navigateScreen({bool isBack = false}) {
    AppRouter.navigator
        .pushNamed(isBack ? AppRouter.welcomeScreen : AppRouter.registerScreen);
  }

// Fome inputs validation
  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    } else {
      _autoValidate = true;
    }
    notifyListeners();
  }

// Password show/hide
  void isPasswordHide() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

// User Login
  void login(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _validateInputs();
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      final RegExp regexp = new RegExp(r'^0+(?=.)');
      String phoneNumber = _phoneCtrl.text.replaceAll(regexp, '');

      _mobileNumber = country["code"] + phoneNumber;

      dynamic data = {
        "phone_number": _mobileNumber,
        "password": _passwordCtrl.text
      };
      _showLoading(context);
      LoginProvider.login(context, data).then((res) {
        App.backScreenOnce(context);
        if (!res.isError) {
          print('Login success');
          print(res.result['otp']);
          AppRouter.navigator.pushNamedAndRemoveUntil(
              AppRouter.otpScreen, (Route<dynamic> route) => false,
              arguments: OtpArguments(otp: res.result['otp'], isLogin: true));
        } else {
          print('Login Faild');
          CommonPop.errorPopup(context,
              title: 'Failed', message: res.error.detail);
        }
      });
    }
    notifyListeners();
  }

// Show loading when login
  void _showLoading(BuildContext context) {
    CommonPop.showLoading(context);
  }

// Country select
  void countrySelector(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height / 4,
            decoration: new BoxDecoration(
                color: AppColors.white,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(Sizes.RADIUS_10),
                    topRight: const Radius.circular(Sizes.RADIUS_10))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: Sizes.PADDING_16,
                      bottom: Sizes.PADDING_4,
                      left: Sizes.PADDING_16,
                      right: Sizes.PADDING_8),
                  child: Row(
                    children: [
                      Text(
                        'Please select your country',
                        style: Styles.customMediumTextStyle(
                            color: AppColors.brandFont,
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.TEXT_SIZE_16),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Flexible(
                  child: ListView.builder(
                      itemCount: countryList.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Container(
                            width: 40.0,
                            child: Image.network(countryList[index]['flag']),
                          ),
                          title: Text(
                            '${countryList[index]['lable']} (${countryList[index]['code']})',
                            style: Styles.customMediumTextStyle(
                                color: AppColors.brandFont,
                                fontWeight: FontWeight.normal,
                                fontSize: Sizes.TEXT_SIZE_16),
                          ),
                          onTap: () =>
                              changeCountry(context, countryList[index]),
                        );
                      }),
                )
              ],
            ),
          );
        });
    notifyListeners();
  }

// Change country
  void changeCountry(BuildContext context, Map val) {
    App.backScreenOnce(context);
    _country = val;
    notifyListeners();
  }
}
