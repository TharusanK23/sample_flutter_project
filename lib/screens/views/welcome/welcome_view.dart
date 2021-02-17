import 'package:eStore/routes/index.dart';

class WelComeView extends StatelessWidget {
  static const routeName = '/';
  const WelComeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelComeViewModel>.reactive(
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SpaceH48(),
                    // ==== Title Start ====
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'eStore',
                              style: Styles.customTitleTextStyle(
                                  color: AppColors.brandFont,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: StringConst.APP_FONT_FAMILY,
                                  fontSize: Sizes.TEXT_SIZE_50),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // ==== Title End ====

                    // ==== Carousel Slider Images Start ====
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: Sizes.PADDING_10),
                        child: Center(
                          child: Column(
                            children: [
                              CarouselSlider(
                                options: CarouselOptions(
                                    height: App.getDeviceWidth(context),
                                    enableInfiniteScroll: model.landingImages.length > 1,
                                    viewportFraction: 1.0,
                                    autoPlay: true,
                                    autoPlayInterval: Duration(seconds: 2),
                                    onPageChanged: (index, reason) => model.changeImageIndex(index: index)),
                                items: model.landingImages.map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return SvgPicture.asset(
                                        i,
                                        height: App.getDeviceWidth(context) * 0.8,
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: model.landingImages.map((i) {
                                  int index = model.landingImages.indexOf(i);
                                  return AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    width: model.imageCurrentIndex == index ? 25.0 : 6.0,
                                    height: 6.0,
                                    margin: EdgeInsets.symmetric(vertical: Sizes.MARGIN_0, horizontal: Sizes.MARGIN_4 - 2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Sizes.RADIUS_16),
                                      color: model.imageCurrentIndex == index ? AppColors.brand : AppColors.purpleShade1,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // ==== Carousel Slider Images End ====
                    SpaceH24(),
                    // ==== Welcome Title and Button Start ====
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            StringConst.WELCOME_MESSAGE + '!',
                            style: Styles.customTitleTextStyle(
                              color: AppColors.brandFont,
                              fontWeight: FontWeight.bold,
                              fontSize: Sizes.TEXT_SIZE_32,
                            ),
                          ),
                          SpaceH10(),
                          Buttons.raisedButton(
                              onPressed: () => model.navigateScreen(),
                              buttonText: "Sign in",
                              fontSize: Sizes.TEXT_SIZE_18,
                              vertical: 1.0,
                              horizontal: 40.0),
                          SpaceH10(),
                        ],
                      ),
                    )
                    // ==== Welcome Title and Button End ====
                  ],
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => WelComeViewModel());
  }
}
