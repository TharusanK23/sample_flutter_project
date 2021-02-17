part of 'package:eStore/screens/views/home/home_view.dart';

// ==== Top Discount Banner - Banner Carousel Slider  ===
class _HeaderBannerView extends ViewModelWidget<HomeViewModel> {
  const _HeaderBannerView({Key key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.width * 0.44,
          child: Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.width * 0.4,
                    enableInfiniteScroll: model.banners.length > 1,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    onPageChanged: (index, reason) => model.changeImageIndex(index: index)),
                items: model.banners.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return i;
                    },
                  );
                }).toList(),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.3,
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: model.banners.map((i) {
                    int index = model.banners.indexOf(i);
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: model.widgetCurrentIndex == index ? 25.0 : 6.0,
                      height: 6.0,
                      margin: EdgeInsets.symmetric(vertical: Sizes.MARGIN_0, horizontal: Sizes.MARGIN_4 - 2),
                      decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(Sizes.RADIUS_14),
                        color: model.widgetCurrentIndex == index ? AppColors.white : AppColors.whiteShade_50,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

// ==== Top Discount Banner - with images and with out images ===
class BannerView extends ViewModelWidget<HomeViewModel> {
  final Color bannerColor;
  final String image;
  final String subTitle;
  final String title;
  const BannerView({Key key, this.bannerColor, this.image, this.subTitle, this.title}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return image == null
        ? Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: Sizes.MARGIN_4, left: Sizes.MARGIN_10, right: Sizes.MARGIN_10),
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.PADDING_20,
              vertical: Sizes.PADDING_14,
            ),
            decoration: BoxDecoration(
              color: bannerColor,
              borderRadius: BorderRadius.circular(Sizes.RADIUS_10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    style: TextStyle(color: AppColors.white),
                    children: [
                      TextSpan(text: "$subTitle\n"),
                      TextSpan(
                          text: title,
                          style: Styles.customMediumTextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.TEXT_SIZE_22)),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.only(top: Sizes.MARGIN_4, left: Sizes.MARGIN_10, right: Sizes.MARGIN_10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.RADIUS_10),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: ((MediaQuery.of(context).size.width * 9) / 16) - 30,
                width: double.infinity,
                color: Color.fromRGBO(255, 255, 255, 0.9),
                colorBlendMode: BlendMode.modulate,
                imageUrl: (image),
                placeholder: (context, url) => Center(
                  child: SvgPicture.asset(
                    ImagePath.placeholder,
                    fit: BoxFit.cover,
                    height: (MediaQuery.of(context).size.width * 3) / 4,
                  ),
                ),
                errorWidget: (context, url, error) => Center(
                  child: SvgPicture.asset(
                    ImagePath.placeholder,
                    fit: BoxFit.cover,
                    height: (MediaQuery.of(context).size.width * 3) / 4,
                  ),
                ),
              ),
            ),
          );
  }
}
