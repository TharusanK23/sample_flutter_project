import 'package:eStore/routes/index.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splashView';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _imageController;
  AnimationController _textController;
  Animation<double> _imageAnimation;
  Animation<double> _textAnimation;
  bool hasImageAnimationStarted = false;
  bool hasTextAnimationStarted = false;
  bool isLiner = false;

  @override
  void initState() {
    super.initState();
    _imageController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _textController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _imageAnimation =
        Tween<double>(begin: 0.0, end: 1.5).animate(_imageController);
    _textAnimation = Tween<double>(begin: 3, end: 0.5).animate(_textController);
    _imageController.addListener(imageControllerListener);
    _textController.addListener(textControllerListener);
    run();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void imageControllerListener() {
    if (_imageController.status == AnimationStatus.completed) {
      Future.delayed(Duration(milliseconds: 800), () {
        setState(() {
          hasTextAnimationStarted = true;
        });
        _textController.forward().orCancel;
      });
    }
  }

  void textControllerListener() {
    if (_textController.status == AnimationStatus.completed) {
      setState(() {
        isLiner = true;
      });
      Future.delayed(Duration(milliseconds: 2005), () async {
        CommonMethod.isInternet().then((connected) async {
          if (connected) {
            if (await App.authorized() && await GetData.getTwoFactor()) {
              AppRouter.navigator.pushNamedAndRemoveUntil(
                AppRouter.mainScreen,
                (Route<dynamic> route) => false,
              );
            } else {
              await RemoveData.removeToken();
              await RemoveData.removeTwoFactor();
              AppRouter.navigator.pushNamedAndRemoveUntil(
                AppRouter.welcomeScreen,
                (Route<dynamic> route) => false,
              );
            }
          } else {
            CommonPop.customeDialog(
                context,
                PopsMsg(
                  discription: "The Internet connection appears to be offline",
                )).then((value) {
              if (value) {
                SystemNavigator.pop();
              }
            });
          }
        });
      });
    }
  }

  void run() {
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        hasImageAnimationStarted = true;
      });
      _imageController.forward().orCancel;
    });
  }

  @override
  dispose() {
    _imageController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: AnimatedBuilder(
                animation: _imageController,
                child: Container(
                  margin: EdgeInsets.only(
                      bottom: App.getDeviceHight(context) * 0.35),
                  child: Image.asset(
                    ImagePath.logoImage,
                    height: App.getDeviceWidth(context) * 0.25,
                    fit: BoxFit.cover,
                  ),
                ),
                builder: (context, child) => RotationTransition(
                  turns: hasImageAnimationStarted
                      ? Tween(begin: 2.0, end: 0.0).animate(_imageController)
                      : Tween(begin: 180.0, end: 0.2).animate(_imageController),
                  child: Transform.scale(
                    scale: 0.4 * _imageAnimation.value,
                    child: child,
                  ),
                ),
              ),
            ),
            hasTextAnimationStarted
                ? Center(
                    child: AnimatedBuilder(
                      animation: _textController,
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: App.getDeviceHight(context) * 0.07),
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
                          )),
                      builder: (context, child) => Transform.scale(
                        scale: 2.5 * _textAnimation.value,
                        alignment: Alignment.center,
                        child: child,
                      ),
                    ),
                  )
                : Container(),
            Visibility(
              visible: isLiner,
              child: Container(
                margin: EdgeInsets.all(Sizes.MARGIN_52 - 2),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: LinearPercentIndicator(
                    animation: true,
                    lineHeight: 6.0,
                    animationDuration: 2000,
                    percent: 1,
                    // center: Text("90.0%"),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: AppColors.brand,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
