import 'package:eStore/routes/index.dart';

class CommonAppBarMain extends StatefulWidget implements PreferredSizeWidget {
  final void Function() onTapDrawer, onTapCart;
  final bool isProfile;

  const CommonAppBarMain({
    Key key,
    this.onTapDrawer,
    this.onTapCart,
    this.isProfile = false,
  }) : super(key: key);
  @override
  _CommonAppBarMainState createState() => _CommonAppBarMainState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CommonAppBarMainState extends State<CommonAppBarMain> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.white,
        elevation: 0.0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'eStore',
              style: Styles.customTitleTextStyle(
                  color: AppColors.brandFont,
                  fontWeight: FontWeight.normal,
                  fontFamily: StringConst.APP_FONT_FAMILY,
                  fontSize: Sizes.TEXT_SIZE_36),
            ),
          ],
        ),
        // leading: GestureDetector(
        //   onTap: widget.onTapDrawer,
        //   child: Icon(
        //     Icons.sort,
        //     color: AppColors.black,
        //     size: Sizes.TEXT_SIZE_36,
        //   ),
        // ),
        actions: [
          Visibility(
            visible: !widget.isProfile,
            child: Padding(
              padding: const EdgeInsets.all(Sizes.PADDING_10),
              child: GestureDetector(
                onTap: widget.onTapCart,
                child: SvgPicture.asset(
                  ImagePath.cart,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
          Visibility(
            visible: widget.isProfile,
            child: Padding(
              padding: const EdgeInsets.all(Sizes.PADDING_10),
              child: GestureDetector(
                onTap: widget.onTapCart,
                child: SvgPicture.asset(
                  ImagePath.settings,
                  color: AppColors.black,
                  height: Sizes.TEXT_SIZE_28,
                ),
              ),
            ),
          ),
        ]);
  }
}
