part of 'package:eStore/screens/views/home/home_view.dart';

// ignore: unused_element
class _FlashSaleView extends ViewModelWidget<HomeViewModel> {
  _FlashSaleView() : super(reactive: true);

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Column(
      children: [
        // ===== Flash sale title
        Container(
          margin:
              EdgeInsets.only(left: Sizes.MARGIN_10, right: Sizes.MARGIN_10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Fla⚡h Sale",
                  style: Styles.customMediumTextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: Sizes.TEXT_SIZE_16)),
              Text("Shop more >".toUpperCase(),
                  style: Styles.customMediumTextStyle(
                      color: AppColors.brandDark,
                      fontWeight: FontWeight.normal,
                      fontSize: Sizes.TEXT_SIZE_14)),
            ],
          ),
        ),
        SpaceH10(),
        // ===== Flash sale product card
        Container(
          height: App.getDeviceHight(context) * 0.23,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                  left: Sizes.PADDING_4, right: Sizes.PADDING_4),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return model.apiHandler.isLoaded
                    ? Container(
                        margin: EdgeInsets.only(
                            left: Sizes.MARGIN_4, right: Sizes.MARGIN_4),
                        width: App.getDeviceWidth(context) * 0.3,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                // === Product Image ===
                                Container(
                                    width: App.getDeviceWidth(context) * 0.3,
                                    height: App.getDeviceWidth(context) * 0.3,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.greyShade1),
                                      borderRadius:
                                          BorderRadius.circular(Sizes.RADIUS_8),
                                    ),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(Sizes.RADIUS_8),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0qsI5mKNTMwiSrpTULYIMkv4ZvmbX_trJbg&usqp=CAU',
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => Center(
                                          child: SvgPicture.asset(
                                            ImagePath.placeholder,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Center(
                                          child: SvgPicture.asset(
                                            ImagePath.placeholder,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )),
                                  // ==== Discount Clip ===
                                Positioned(
                                    left: 0.0,
                                    top: 0.0,
                                    child: RotatedBox(
                                      quarterTurns: -1,
                                      child: ClipPath(
                                        clipper: PricerCliper(),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  Sizes.RADIUS_4),
                                              topRight: Radius.circular(
                                                  Sizes.RADIUS_8)),
                                          child: Container(
                                            height:
                                                App.getDeviceWidth(context) *
                                                    0.15,
                                            width: App.getDeviceWidth(context) *
                                                0.05,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.topRight,
                                                  end: Alignment.bottomLeft,
                                                  stops: [
                                                    0.1,
                                                    0.9
                                                  ],
                                                  colors: [
                                                    AppColors.errorWorning,
                                                    AppColors
                                                        .kFoodyBiteGoldRatingStar,
                                                  ]),
                                            ),
                                            child: RotatedBox(
                                              quarterTurns: 1,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text("-${5 * (index + 1)}%",
                                                      style: Styles
                                                          .customMediumTextStyle(
                                                              color: AppColors
                                                                  .white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: Sizes
                                                                  .TEXT_SIZE_14)),
                                                  SpaceW10(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            SpaceH10(),
                            // ===== Sold Indicator ====
                            LinearPercentIndicator(
                              width: App.getDeviceWidth(context) * 0.3,
                              widgetIndicator: Padding(
                                padding: const EdgeInsets.only(
                                    top: Sizes.PADDING_4 + 2),
                                child: Text('${5 * (index + 1)} Sold',
                                    style: Styles.customMediumTextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: Sizes.TEXT_SIZE_10)),
                              ),
                              animation: true,
                              lineHeight: 13.5,
                              animationDuration: 1000,
                              percent: 0.3,
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              backgroundColor:
                                  AppColors.brandLight.withOpacity(0.4),
                              progressColor: AppColors.brand,
                            ),
                            SpaceH2(),
                            // ==== Price widget ====
                            Container(
                                padding: EdgeInsets.only(left: Sizes.PADDING_2),
                                alignment: Alignment.centerLeft,
                                child: CommonWidget.priceTextSmall(
                                    text: App.getPrice(5 * (index + 1)))),
                          ],
                        ))
                    : _FlashSaleViewLoading();
              }),
        ),
      ],
    );
  }
}

// ===== Flash Loading card
class _FlashSaleViewLoading extends ViewModelWidget<HomeViewModel> {
  const _FlashSaleViewLoading({
    Key key,
  }) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[50],
      child: Container(
          margin: EdgeInsets.only(left: Sizes.MARGIN_4, right: Sizes.MARGIN_4),
          width: App.getDeviceWidth(context) * 0.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                      alignment: Alignment.center,
                      height: App.getDeviceWidth(context) * 0.3,
                      width: App.getDeviceWidth(context) * 0.3,
                      decoration: BoxDecoration(
                        color: AppColors.whiteShade_50,
                        border: Border.all(color: AppColors.greyShade1),
                        borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
                        child: Text('eStore',
                            style: Styles.customMediumTextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: StringConst.APP_FONT_FAMILY,
                                fontSize: Sizes.TEXT_SIZE_22)),
                      )),
                  Positioned(
                      left: 0.0,
                      top: 0.0,
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: ClipPath(
                          clipper: PricerCliper(),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Sizes.RADIUS_4),
                                topRight: Radius.circular(Sizes.RADIUS_8)),
                            child: Container(
                              height: App.getDeviceWidth(context) * 0.15,
                              width: App.getDeviceWidth(context) * 0.05,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    stops: [
                                      0.1,
                                      0.9
                                    ],
                                    colors: [
                                      AppColors.white,
                                      AppColors.whiteShade_50,
                                    ]),
                              ),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
              SpaceH10(),
              LinearPercentIndicator(
                width: App.getDeviceWidth(context) * 0.3,
                animation: true,
                lineHeight: 13.5,
                animationDuration: 1000,
                percent: 0.4,
                linearStrokeCap: LinearStrokeCap.roundAll,
                backgroundColor: AppColors.whiteShade_50.withOpacity(0.4),
                progressColor: AppColors.whiteShade_50,
              ),
              SpaceH2(),
              Container(
                margin: const EdgeInsets.all(
                  Sizes.MARGIN_4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
                  color: AppColors.whiteShade_50,
                ),
                width: App.getDeviceHight(context) * 0.1,
                height: 10.0,
              ),
            ],
          )),
    );
  }
}

class PricerCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double ignoreHeight = 10;
    path.lineTo(0, size.height - ignoreHeight);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - ignoreHeight);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
