import 'package:eStore/routes/index.dart';

class RegisterView extends StatelessWidget {
  static const routeName = '/register-view';
  const RegisterView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
        builder: (context, model, child) {
          return SafeArea(
              child: Scaffold(
                  key: model.scaffoldKey,
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: AppColors.white,
                    leading: GestureDetector(onTap: () => model.navigateScreen(isBack: true), child: Icon(Icons.arrow_back)),
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
                                  bottomLeft: Radius.circular(Sizes.RADIUS_32), bottomRight: Radius.circular(Sizes.RADIUS_32))),
                          alignment: Alignment.topCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              // ==== Sign up Title ====
                              AuthCommon.titleText(text: 'Sign Up'),
                              // ==== Welcome Text ====
                              AuthCommon.welcomeText(),
                              // ==== Welcome Description ====
                              AuthCommon.statedText(),
                              // ==== Sign up Form - First Name field ====
                              AuthCommon.textFormField(
                                  controller: model.firstNameCtrl,
                                  validator: Validations.validateName,
                                  hintText: 'First Name',
                                  isFirestField: true),
                              // ==== Sign up Form - Last Name field ====
                              AuthCommon.textFormField(
                                controller: model.lastNameCtrl,
                                validator: Validations.validateName,
                                hintText: 'Last Name',
                              ),
                              // ==== Sign up Form - Phone number field ====
                              AuthCommon.textFormField(
                                controller: model.phoneCtrl,
                                validator: Validations.validateMobile,
                                hintText: 'Phone Number',
                                keyboardType: TextInputType.number,
                                country: model.country,
                                isPhone: true,
                                countrySelect: () => model.countrySelector(context),
                              ),
                              // ==== Sign up Form - E-mail field ====
                              AuthCommon.textFormField(
                                controller: model.emailCtrl,
                                validator: Validations.validateEmail,
                                hintText: 'E-Mail Address',
                              ),
                              // ==== Sign up Form - Password field ====
                              AuthCommon.textFormField(
                                  controller: model.passwordCtrl,
                                  validator: Validations.validatePassword,
                                  hintText: 'Password',
                                  isPasswordField: true,
                                  obscureText: model.showPassword ? false : true,
                                  isShowPwd: model.showPassword,
                                  showPwd: () => model.isPasswordHide()),
                              // ==== Have an account ====
                              AuthCommon.navigateTextAndButton(
                                text: "Have an account?",
                                navigateTitile: "Sign in",
                                onTap: () => model.navigateScreen(),
                                onPressed: () => model.register(context),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )));
        },
        viewModelBuilder: () => RegisterViewModel());
  }
}
