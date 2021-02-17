import 'package:eStore/routes/index.dart';

class LoginView extends StatelessWidget {
  static const routeName = '/login-view';
  const LoginView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        builder: (context, model, child) {
          return SafeArea(
              child: Scaffold(
                  key: model.scaffoldKey,
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: AppColors.white,
                    leading: GestureDetector(
                        onTap: () => model.navigateScreen(isBack: true),
                        child: Icon(Icons.arrow_back)),
                  ),
                  body: ListView(
                    children: <Widget>[
                      Form(
                        key: model.formKey,
                        // ignore: deprecated_member_use
                        autovalidate: model.autoValidate,
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                new BoxShadow(
                                  color: AppColors.indigo,
                                  offset: new Offset(0.0, 2.0),
                                  blurRadius: 25.0,
                                )
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(Sizes.RADIUS_32),
                                  bottomRight:
                                      Radius.circular(Sizes.RADIUS_32))),
                          alignment: Alignment.topCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              // ==== Login Title ====
                              AuthCommon.titleText(text: 'Sign In'),
                              // ==== Welcome Text ====
                              AuthCommon.welcomeText(),
                              // ==== Welcome Description ====
                              AuthCommon.statedText(),
                              // ==== Login Form - Phone Nmber field ====
                              AuthCommon.textFormField(
                                isFirestField: true,
                                controller: model.phoneCtrl,
                                validator: Validations.validateMobile,
                                hintText: 'Phone Number',
                                keyboardType: TextInputType.number,
                                autofocus: true,
                                isPhone: true,
                                country: model.country,
                                countrySelect: () =>
                                    model.countrySelector(context),
                              ),
                              // ==== Login Form - Password field ====
                              AuthCommon.textFormField(
                                  controller: model.passwordCtrl,
                                  validator: Validations.validatePassword,
                                  hintText: 'Password',
                                  isPasswordField: true,
                                  obscureText:
                                      model.showPassword ? false : true,
                                  isShowPwd: model.showPassword,
                                  showPwd: () => model.isPasswordHide()),
                              // ==== Don't have an account ====
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: Sizes.PADDING_8),
                                child: AuthCommon.navigateTextAndButton(
                                  text: "Don't have an account?",
                                  navigateTitile: "Sign up",
                                  onTap: () => model.navigateScreen(),
                                  onPressed: () => model.login(context),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )));
        },
        viewModelBuilder: () => LoginViewModel());
  }
}
