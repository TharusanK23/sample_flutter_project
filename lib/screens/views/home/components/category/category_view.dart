part of 'package:eStore/screens/views/home/home_view.dart';

class _CategoriesView extends ViewModelWidget<HomeViewModel> {
  const _CategoriesView({Key key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return _CategoriesBlocPart();
  }
}

// ==== Category Bloc view ====
class _CategoriesBlocPart extends ViewModelWidget<HomeViewModel> {
  _CategoriesBlocPart({Key key}) : super(key: key, reactive: false);
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return BlocConsumer<CategoryBloc, CategoryState>(
      builder: (BuildContext context, CategoryState categoryState) {
        model.setCategoryListLoad(
            isNotify: false, categoryState: categoryState, context: context);
        return _CategoriesBodyPart();
      },
      listener: (BuildContext context, CategoryState categoryState) {
        model.setCategoryListLoad(
            isNotify: true, categoryState: categoryState, context: context);
      },
    );
  }
}

// ==== Category list Grid view part
class _CategoriesBodyPart extends ViewModelWidget<HomeViewModel> {
  _CategoriesBodyPart({Key key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(Sizes.PADDING_10),
        shrinkWrap: true,
        itemCount: model.apiHandler.isLoaded ? model.category.length : 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          childAspectRatio: 0.7,
          mainAxisSpacing: 5
        ),
        itemBuilder: (BuildContext context, int i) {
          return model.apiHandler.isLoaded
              ? _CategoryCard(
                  icon: model.category[i].id == "602d23ccc08ab8b522dec899"
                      ? ImagePath.menFashion
                      : model.category[i].id == "602d2427c08ab8b522dec89e"
                          ? ImagePath.womenFashion
                          : model.category[i].id == "602d23f3c08ab8b522dec89b"
                              ? ImagePath.babyAndToys
                              : model.category[i].id ==
                                      "602d2405c08ab8b522dec89c"
                                  ? ImagePath.electoDevi
                                  : model.category[i].id ==
                                          "602d2417c08ab8b522dec89d"
                                      ? ImagePath.healthAndBeauty
                                      : model.category[i].id ==
                                              "602d23b9c08ab8b522dec898"
                                          ? ImagePath.homeApplicans
                                          : model.category[i].id ==
                                                  "602d23e1c08ab8b522dec89a"
                                              ? ImagePath.watch
                                              : model.category[i].id ==
                                                      "602d243cc08ab8b522dec89f"
                                                  ? ImagePath.jewelery
                                                  : model.category[i].id ==
                                                          "602d244ec08ab8b522dec8a0"
                                                      ? ImagePath.gift
                                                      : ImagePath.business,
                  text: model.category[i].name,
                  press: () {},
                )
              : _CategoryCardLoading();
        });
  }
}

// ==== Category Card
class _CategoryCard extends ViewModelWidget<HomeViewModel> {
  final String icon, text;
  final GestureTapCallback press;
  const _CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return GestureDetector(
      onTap: press,
      child: Container(
        // width: App.getDeviceHight(context) * 0.15,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(Sizes.PADDING_10),
              height: App.getDeviceHight(context) * 0.06,
              width: App.getDeviceHight(context) * 0.06,
              decoration: BoxDecoration(
                color: AppColors.brandLight.withOpacity(0.2),
                borderRadius: BorderRadius.circular(Sizes.RADIUS_10),
              ),
              child: SvgPicture.asset(
                icon,
                color: AppColors.black.withOpacity(0.7),
              ),
            ),
            SpaceH4(),
            Text(text,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: Styles.customMediumTextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: Sizes.TEXT_SIZE_8))
          ],
        ),
      ),
    );
  }
}

class _CategoryCardLoading extends ViewModelWidget<HomeViewModel> {
  const _CategoryCardLoading({
    Key key,
  }) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[50],
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: App.getDeviceHight(context) * 0.06,
              width: App.getDeviceHight(context) * 0.06,
              decoration: BoxDecoration(
                color: AppColors.whiteShade_50,
                borderRadius: BorderRadius.circular(Sizes.RADIUS_10),
              ),
              child: Text('eStore',
                  style: Styles.customMediumTextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: StringConst.APP_FONT_FAMILY,
                      fontSize: Sizes.TEXT_SIZE_10)),
            ),
            SpaceH4(),
            Container(
              margin: const EdgeInsets.all(
                Sizes.MARGIN_4 - 2,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
                color: AppColors.whiteShade_50,
              ),
              width: App.getDeviceHight(context) * 0.05,
              height: 6.0,
            ),
            Container(
              margin: const EdgeInsets.all(
                Sizes.MARGIN_4 - 2,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
                color: AppColors.whiteShade_50,
              ),
              width: App.getDeviceHight(context) * 0.04,
              height: 6.0,
            ),
          ],
        ),
      ),
    );
  }
}
