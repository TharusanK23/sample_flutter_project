import 'package:eStore/routes/index.dart';

class AuthCommon {
  static Container titleText({String text}) {
    return Container(
      child: FlatButton(
        onPressed: null,
        child: Text(
          text,
          style: Styles.customMediumTextStyle(
              color: AppColors.brand,
              fontWeight: FontWeight.w600,
              fontSize: Sizes.TEXT_SIZE_22),
        ),
      ),
    );
  }

  static Container welcomeText() {
    return Container(
      margin: EdgeInsets.only(left: Sizes.MARGIN_16),
      child: RichText(
          text: new TextSpan(children: [
        new TextSpan(
          text: 'Welcome to ',
          style: Styles.customMediumTextStyle(
              color: AppColors.brandFont,
              fontWeight: FontWeight.w500,
              fontSize: Sizes.TEXT_SIZE_20),
        ),
        TextSpan(
          text: 'eStore',
          style: Styles.customTitleTextStyle(
              color: AppColors.brandFont,
              fontWeight: FontWeight.normal,
              fontFamily: StringConst.APP_FONT_FAMILY,
              fontSize: Sizes.TEXT_SIZE_28),
        ),
      ])),
    );
  }

  static Container statedText() {
    return Container(
      margin: EdgeInsets.only(left: Sizes.MARGIN_16, top: Sizes.MARGIN_8),
      child: Text(
        'Let\'s get started',
        style: Styles.customMediumTextStyle(
            color: AppColors.brandFont,
            fontWeight: FontWeight.normal,
            fontSize: Sizes.TEXT_SIZE_16),
      ),
    );
  }

  static Row navigateTextAndButton(
      {String text,
      String navigateTitile,
      Function onPressed,
      Function onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.all(Sizes.MARGIN_20),
          child: RichText(
              text: new TextSpan(children: [
            new TextSpan(
              text: text,
              style: Styles.customMediumTextStyle(
                  color: AppColors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: Sizes.TEXT_SIZE_16),
            ),
            TextSpan(
              text: ' $navigateTitile',
              style: Styles.customMediumTextStyle(
                  color: AppColors.brand,
                  fontWeight: FontWeight.w600,
                  fontSize: Sizes.TEXT_SIZE_16),
              recognizer: new TapGestureRecognizer()..onTap = onTap,
            ),
          ])),
        ),
        Container(
          margin: EdgeInsets.all(Sizes.MARGIN_20),
          decoration:
              BoxDecoration(color: AppColors.brand, shape: BoxShape.circle),
          child: IconButton(
            color: AppColors.white,
            onPressed: onPressed,
            icon: Icon(Icons.arrow_forward),
          ),
        ),
      ],
    );
  }

  static Widget textFormField(
      {String hintText,
      TextEditingController controller,
      String Function(String) validator,
      bool obscureText = false,
      bool autofocus = false,
      bool isPhone = false,
      bool isShowPwd,
      bool isFirestField = false,
      bool isPasswordField = false,
      TextInputType keyboardType = TextInputType.text,
      Function countrySelect,
      Function showPwd,
      Map country}) {
    return Padding(
      padding: EdgeInsets.only(
          left: Sizes.PADDING_16,
          right: Sizes.PADDING_16,
          top: isFirestField ? Sizes.PADDING_16 : Sizes.PADDING_8,
          bottom: Sizes.PADDING_8),
      child: TextFormField(
        controller: controller,
        validator: validator,
        autofocus: autofocus,
        obscureText: obscureText,
        style: Styles.customMediumTextStyle(
            color: AppColors.brandFont,
            fontWeight: FontWeight.w500,
            fontSize: Sizes.TEXT_SIZE_16),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: isPhone
              ? InkWell(
                  onTap: countrySelect,
                  child: Container(
                    padding: EdgeInsets.only(left: Sizes.PADDING_8),
                    width: 100,
                    child: Row(
                      children: [
                        Image.network(
                          country['flag'],
                          width: 40.0,
                        ),
                        SpaceW4(),
                        FittedBox(
                          child: Text(
                            country['code'],
                            style: Styles.customMediumTextStyle(
                                color: AppColors.brandFont,
                                fontWeight: FontWeight.w500,
                                fontSize: Sizes.TEXT_SIZE_16),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : null,
          suffixIcon: (!isPhone && isPasswordField)
              ? IconButton(
                  icon: Icon(
                      isShowPwd ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.brandFont),
                  onPressed: showPwd)
              : null,
          contentPadding: EdgeInsets.all(Sizes.PADDING_12),
          hintText: hintText,
          hintStyle: Styles.customMediumTextStyle(
              color: AppColors.grey.withOpacity(0.5),
              fontWeight: FontWeight.w500,
              fontSize: Sizes.TEXT_SIZE_16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
              borderSide: BorderSide(color: AppColors.grey)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
              borderSide: BorderSide(color: AppColors.errorWorning)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
              borderSide: BorderSide(color: AppColors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
              borderSide: BorderSide(color: AppColors.grey)),
        ),
      ),
    );
  }
}
