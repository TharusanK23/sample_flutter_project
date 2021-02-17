import 'package:eStore/routes/index.dart';

class Buttons {
  static Container raisedButton(
      {Function onPressed,
      double horizontal = Sizes.PADDING_0,
      double vertical = Sizes.PADDING_0,
      String buttonText = "Add to cart",
      double fontSize = Sizes.TEXT_SIZE_16,
      Color color = AppColors.white,
      Color buttonColor = AppColors.brand}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      decoration: BoxDecoration(
        color: buttonColor,
        shape: BoxShape.rectangle,
        border: Border.all(color: buttonColor),
        borderRadius: BorderRadius.all(Radius.circular(Sizes.SIZE_8)),
      ),
      child: FlatButton(
        child: Text(
          buttonText.toUpperCase(),
          maxLines: 1,
          textAlign: TextAlign.center,
          style: Styles.customTitleTextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ).copyWith(letterSpacing: 2.2),
        ),
        onPressed: onPressed,
      ),
    );
  }

  static Container outlineButton(
      {Function onPressed,
      double horizontal = Sizes.PADDING_0,
      double vertical = Sizes.PADDING_0,
      String buttonText = "Cancel",
      double fontSize = Sizes.TEXT_SIZE_16,
      Color color = AppColors.black,
      Color buttonColor = AppColors.brand}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: buttonColor),
        borderRadius: BorderRadius.all(Radius.circular(Sizes.SIZE_8)),
      ),
      child: FlatButton(
        child: Text(
          buttonText.toUpperCase(),
          maxLines: 1,
          textAlign: TextAlign.center,
          style: Styles.customTitleTextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ).copyWith(letterSpacing: 2.2),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
