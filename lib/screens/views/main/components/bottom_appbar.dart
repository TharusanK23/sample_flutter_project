part of 'package:eStore/screens/views/main/main_view.dart';

class _NavigationBottomBar extends ViewModelWidget<MainViewModel> {
  const _NavigationBottomBar({Key key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, MainViewModel model) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(Sizes.RADIUS_24),
        topLeft: Radius.circular(Sizes.RADIUS_24),
      ),
      child: Container(
        height: 55,
        child: BubbleBottomBar(
          hasNotch: true,
          backgroundColor: AppColors.secondaryColor,
          opacity: 0.2,
          currentIndex: model.currentIndex,
          onTap: (index) => model.changePage(index: index),
          elevation: 10,
          // ==== Bottom navigation bar items ====
          items: <BubbleBottomBarItem>[
            // ==== Store ====
            BubbleBottomBarItem(
                backgroundColor: AppColors.brandDark,
                icon: SvgPicture.asset(
                  ImagePath.bottomStore,
                  height: 20,
                  color: AppColors.black,
                ),
                activeIcon: SvgPicture.asset(
                  ImagePath.bottomStore,
                  height: 20,
                  color: AppColors.brandDark,
                ),
                title: bottomText("Store")),
            // ===== Product ====
            BubbleBottomBarItem(
                backgroundColor: AppColors.brandDark,
                icon: SvgPicture.asset(
                  ImagePath.bottomProduct,
                  height: 20,
                  color: AppColors.black,
                ),
                activeIcon: SvgPicture.asset(
                  ImagePath.bottomProduct,
                  height: 20,
                  color: AppColors.brandDark,
                ),
                title: bottomText("Products")),
            // ===== Orders ===== 
            BubbleBottomBarItem(
                backgroundColor: AppColors.brandDark,
                icon: SvgPicture.asset(
                  ImagePath.bottomOrder,
                  height: 20,
                  color: AppColors.black,
                ),
                activeIcon: SvgPicture.asset(
                  ImagePath.bottomOrder,
                  height: 30,
                  color: AppColors.brandDark,
                ),
                title: bottomText("Orders")),
            // ===== Account ======
            BubbleBottomBarItem(
                backgroundColor: AppColors.brandDark,
                icon: SvgPicture.asset(
                  ImagePath.bottomAccount,
                  height: 20,
                  color: AppColors.black,
                ),
                activeIcon: SvgPicture.asset(
                  ImagePath.bottomAccount,
                  height: 20,
                  color: AppColors.brandDark,
                ),
                title: bottomText("Account"))
          ],
        ),
      ),
    );
  }

// === Common text
  Widget bottomText(String text) {
    return Text(text,
        style: Styles.customMediumTextStyle(
            color: AppColors.brandDark,
            fontWeight: FontWeight.normal,
            fontSize: Sizes.TEXT_SIZE_14));
  }
}
