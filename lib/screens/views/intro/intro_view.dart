import 'package:eStore/routes/index.dart';

class IntroView extends StatelessWidget {
  static const routeName = '/intro-view';
  const IntroView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IntroViewModel>.reactive(
        builder: (context, model, child) {
          return SafeArea(
            child: WillPopScope(
              onWillPop: () => Future.value(false),
              child: Scaffold(
                body: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
                      AppColors.white,
                      AppColors.white,
                      AppColors.white,
                      AppColors.purpleShade1,
                      AppColors.purpleShade1,
                    ]),
                  ),
                  child: Stack(
                    children: <Widget>[
                      PageView(
                        onPageChanged: (value) => model.nextIntro(value),
                        controller: model.controller,
                        children: <Widget>[
                          // ==== Intro firdt slide ====
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Center(
                                child: SvgPicture.asset(
                                  ImagePath.firstScreen,
                                  height: 200,
                                  width: 200,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_32),
                                child: Text(
                                  'Get Any Thing Online',
                                  textAlign: TextAlign.right,
                                  style: Styles.customMediumTextStyle(
                                      color: AppColors.brandFont, fontWeight: FontWeight.w600, fontSize: Sizes.TEXT_SIZE_16),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_32, vertical: Sizes.PADDING_16),
                                child: Text(
                                  'You can buy anything ranging from digital products to hardware within few clicks.',
                                  textAlign: TextAlign.right,
                                  style: Styles.customMediumTextStyle(
                                      color: AppColors.indigo, fontWeight: FontWeight.normal, fontSize: Sizes.TEXT_SIZE_12),
                                ),
                              ),
                            ],
                          ),
                          // ==== Intro secound slide ====
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Center(
                                child: SvgPicture.asset(
                                  ImagePath.secondScreen,
                                  height: 200,
                                  width: 200,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_32),
                                child: Text(
                                  'Shipping to anywhere ',
                                  textAlign: TextAlign.right,
                                  style: Styles.customMediumTextStyle(
                                      color: AppColors.brandFont, fontWeight: FontWeight.w600, fontSize: Sizes.TEXT_SIZE_16),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_32, vertical: Sizes.PADDING_16),
                                child: Text('We will ship to anywhere in the world, With 30 day 100% money back policy.',
                                    textAlign: TextAlign.right,
                                    style: Styles.customMediumTextStyle(
                                        color: AppColors.indigo, fontWeight: FontWeight.normal, fontSize: Sizes.TEXT_SIZE_12)),
                              ),
                            ],
                          ),
                          // ==== Intro last slide ====
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Center(
                                child: SvgPicture.asset(
                                  ImagePath.thirdScreen,
                                  height: 200,
                                  width: 200,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_32),
                                child: Text(
                                  'On-time delivery',
                                  textAlign: TextAlign.right,
                                  style: Styles.customMediumTextStyle(
                                      color: AppColors.brandFont, fontWeight: FontWeight.w600, fontSize: Sizes.TEXT_SIZE_16),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_32, vertical: Sizes.PADDING_16),
                                child: Text(
                                  'You can track your product with our powerful tracking service.',
                                  textAlign: TextAlign.right,
                                  style: Styles.customMediumTextStyle(
                                      color: AppColors.indigo, fontWeight: FontWeight.normal, fontSize: Sizes.TEXT_SIZE_12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // ==== Current slide circle ====
                      Positioned(
                        bottom: 16.0,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.all(Sizes.MARGIN_8),
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.black, width: 2),
                                        color: model.pageIndex == 0 ? AppColors.kFoodyBiteGoldRatingStar : AppColors.white),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(Sizes.MARGIN_8),
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.black, width: 2),
                                        color: model.pageIndex == 1 ? AppColors.kFoodyBiteGoldRatingStar : AppColors.white),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(Sizes.MARGIN_8),
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.black, width: 2),
                                        color: model.pageIndex == 2 ? AppColors.kFoodyBiteGoldRatingStar : AppColors.white),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  // ==== Skip button ====
                                  Opacity(
                                    opacity: model.pageIndex != 2 ? 1.0 : 0.0,
                                    child: FlatButton(
                                      splashColor: Colors.transparent,
                                      child: Text(
                                        'SKIP',
                                        style: Styles.customMediumTextStyle(
                                            color: AppColors.brandFont,
                                            fontWeight: FontWeight.bold,
                                            fontSize: Sizes.TEXT_SIZE_16),
                                      ),
                                      onPressed: () => model.navigateScreen(),
                                    ),
                                  ),
                                  model.pageIndex != 2
                                      // ==== Next button ====
                                      ? FlatButton(
                                          splashColor: Colors.transparent,
                                          child: Text(
                                            'NEXT',
                                            style: Styles.customMediumTextStyle(
                                                color: AppColors.brandFont,
                                                fontWeight: FontWeight.bold,
                                                fontSize: Sizes.TEXT_SIZE_16),
                                          ),
                                          onPressed: () {
                                            if (!(model.controller.page == 2.0))
                                              model.controller
                                                  .nextPage(duration: Duration(milliseconds: 200), curve: Curves.linear);
                                          },
                                        )
                                      : // ==== Finish button ====
                                      FlatButton(
                                          splashColor: Colors.transparent,
                                          child: Text(
                                            'FINISH',
                                            style: Styles.customMediumTextStyle(
                                                color: AppColors.brandFont,
                                                fontWeight: FontWeight.bold,
                                                fontSize: Sizes.TEXT_SIZE_20),
                                          ),
                                          onPressed: () => model.navigateScreen(),
                                        )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => IntroViewModel());
  }
}
