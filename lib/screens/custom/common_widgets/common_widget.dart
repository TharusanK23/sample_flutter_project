import 'package:eStore/routes/index.dart';

class CommonWidget {
  static Text priceTextSmall({
    String text,
    Color color = AppColors.brandDark,
    bool crossText = false,
  }) {
    return Text(
      text,
      style: Styles.customMediumTextStyle(
              color: color,
              fontWeight: FontWeight.w500,
              fontSize: Sizes.TEXT_SIZE_14)
          .copyWith(
        decoration:
            crossText ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }
}

class FloatingAppBar extends StatelessWidget {
  final String title;
  const FloatingAppBar({@required this.title, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      height: 55,
      color: AppColors.white,
      width: App.getDeviceWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: SvgPicture.asset(
              ImagePath.back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          Expanded(
            child: Text(
              title,
              style: Styles.customMediumTextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: Sizes.TEXT_SIZE_20),
            ),
          ),
          IconButton(
            icon: SvgPicture.asset(
              ImagePath.cart,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
