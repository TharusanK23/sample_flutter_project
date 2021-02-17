import 'package:eStore/routes/index.dart';

/* 
 *NOTE:-
      This page has a process that will continue after receiving and confirming the temporary OTP.
      The incoming OTP is can't recive on the phone number provided by the user.
 */

class OtpView extends StatelessWidget {
  static const routeName = '/otp-view';
  const OtpView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OtpViewModel>.reactive(
        builder: (context, model, child) {
          return SafeArea(
              child: WillPopScope(
            onWillPop: () => Future.value(false),
            child: Scaffold(
              appBar: AppBar(
                brightness: Brightness.light,
                iconTheme: IconThemeData(color: AppColors.black),
                leading: Icon(Icons.lock),
                elevation: 0,
                backgroundColor: AppColors.white,
              ),
              body: ListView(
                children: <Widget>[
                  Container(
                    height: App.getDeviceHight(context) * 0.4,
                    decoration: BoxDecoration(
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.black26,
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
                        // ==== OTP Title ====
                        AuthCommon.titleText(text: 'Verify'),
                        // ==== OTP Description ====
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(
                            left: Sizes.MARGIN_16,
                          ),
                          child: Text(
                            model.isLogin
                                ? 'Successfully login, verify your number'
                                : "Successfully registered, verify your number",
                            style: Styles.customMediumTextStyle(
                                color: AppColors.brandFont, fontWeight: FontWeight.w500, fontSize: Sizes.TEXT_SIZE_20),
                          ),
                        ),
                        // ==== OTP ====
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: Sizes.MARGIN_16, top: Sizes.MARGIN_8),
                          child: RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                text: 'Your 6 digit code is ',
                                style: Styles.customMediumTextStyle(
                                    color: AppColors.brandFont, fontWeight: FontWeight.normal, fontSize: Sizes.TEXT_SIZE_16),
                              ),
                              TextSpan(
                                text: model.otp,
                                style: Styles.customMediumTextStyle(
                                    color: AppColors.brand, fontWeight: FontWeight.w600, fontSize: Sizes.TEXT_SIZE_18),
                              )
                            ]),
                          ),
                        ),
                        // ==== OTP Field ====
                        Padding(
                          padding: EdgeInsets.all(Sizes.PADDING_16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              _inputFields(model.code1),
                              _inputFields(model.code2),
                              _inputFields(model.code3),
                              _inputFields(model.code4),
                              _inputFields(model.code5),
                              _inputFields(model.code6),
                            ],
                          ),
                        ),
                        // ==== OTP confirm button ====
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  margin: EdgeInsets.all(Sizes.MARGIN_16),
                                  decoration: BoxDecoration(
                                    color: model.verify ? AppColors.brand : AppColors.brandLight.withOpacity(0.5),
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    color: AppColors.white,
                                    onPressed: () => model.verifyOtp(context),
                                    icon: Icon(Icons.check),
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                  SpaceH40(),
                  // ==== OTP input numbers keyboard ====
                  Container(
                    padding: EdgeInsets.all(Sizes.PADDING_32),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        ButtonBar(
                          alignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _createCalcButton('1', model),
                            _createCalcButton('2', model),
                            _createCalcButton('3', model),
                          ],
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _createCalcButton('4', model),
                            _createCalcButton('5', model),
                            _createCalcButton('6', model),
                          ],
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _createCalcButton('7', model),
                            _createCalcButton('8', model),
                            _createCalcButton('9', model),
                          ],
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _createCalcButton('', model),
                            _createCalcButton('0', model),
                            InkWell(
                                borderRadius: BorderRadius.circular(Sizes.RADIUS_40),
                                onTap: () => model.deleteCode(),
                                child: Container(
                                    alignment: Alignment.center,
                                    // decoration: BoxDecoration(shape: BoxShape.circle),
                                    width: 50,
                                    height: 50,
                                    child: Icon(Icons.backspace)))
                          ],
                        ),
                        SpaceH14(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
        },
        onModelReady: (model) {
          model.initialise(context: context);
        },
        viewModelBuilder: () => OtpViewModel());
  }

  Widget _inputFields(String s) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: 50,
      child: Text(
        s,
        style:
            Styles.customMediumTextStyle(color: AppColors.brandFont, fontWeight: FontWeight.w600, fontSize: Sizes.TEXT_SIZE_22),
      ),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: AppColors.grey),
          borderRadius: BorderRadius.circular(Sizes.RADIUS_8)),
    );
  }

  Widget _createCalcButton(String value, OtpViewModel model) {
    return InkWell(
        borderRadius: BorderRadius.circular(Sizes.RADIUS_40),
        onTap: () => model.updateCode(value),
        child: Container(
          alignment: Alignment.center,
          // decoration: BoxDecoration(shape: BoxShape.circle),
          width: 50,
          height: 50,
          child: Text(
            value,
            style: Styles.customMediumTextStyle(
                color: AppColors.brandFont, fontWeight: FontWeight.w600, fontSize: Sizes.TEXT_SIZE_28),
          ),
        ));
  }
}
