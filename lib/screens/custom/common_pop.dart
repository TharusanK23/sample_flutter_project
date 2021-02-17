import 'package:eStore/routes/index.dart';

class CommonPop {
  static showLoading(BuildContext context) {
    WillPopScope alert = WillPopScope(
        onWillPop: () async => false,
        child: SimpleDialog(
            key: new GlobalKey<State>(),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            contentPadding: EdgeInsets.all(Sizes.PADDING_24),
            children: <Widget>[
              Center(
                child: ColorLoader2(
                  color1: Color(0xff00AAAA),
                  color2: Color(0xffFF0000),
                  color3: Color(0xffAA16AA),
                ),
              )
            ]));
    showDialog(
      barrierColor: Colors.white.withOpacity(0.8),
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static errorPopup(context, {title, message}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.RADIUS_30),
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            child: PopsMsg(
              message: title,
              discription: message.toString(),
            ),
          );
        });
  }

  static Future customeDialog(BuildContext context, Widget widget) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CustomDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.RADIUS_30),
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            child: widget,
          );
        });
  }

  static void floatingDialog(
      {@required BuildContext context, @required Widget widget}) {
    final Color backgroundColor = AppColors.black;

    final double elevation = 0.0;

    final Duration insetAnimationDuration = const Duration(milliseconds: 100);

    final Curve insetAnimationCurve = Curves.decelerate;

    final ShapeBorder shape = RoundedRectangleBorder(
        // borderRadius:
        //     BorderRadius.circular(30),
        );
    final RoundedRectangleBorder _defaultDialogShape = RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)));
    final double _defaultElevation = 24.0;

    final DialogTheme dialogTheme = DialogTheme.of(context);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets +
                const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            duration: insetAnimationDuration,
            curve: insetAnimationCurve,
            child: MediaQuery.removeViewInsets(
                removeLeft: true,
                removeTop: true,
                removeRight: true,
                removeBottom: true,
                context: context,
                child: Stack(
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: const BoxConstraints(minWidth: 280.0),
                      child: Material(
                        color: backgroundColor ??
                            dialogTheme.backgroundColor ??
                            Theme.of(context).dialogBackgroundColor,
                        elevation: elevation ??
                            dialogTheme.elevation ??
                            _defaultElevation,
                        shape:
                            shape ?? dialogTheme.shape ?? _defaultDialogShape,
                        type: MaterialType.card,
                        child: widget,
                      ),
                    )
                  ],
                )),
          );
        });
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key key,
    this.backgroundColor,
    this.elevation,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    this.insetAnimationCurve = Curves.decelerate,
    this.shape,
    this.child,
  }) : super(key: key);

  final Color backgroundColor;

  final double elevation;

  final Duration insetAnimationDuration;

  final Curve insetAnimationCurve;

  final ShapeBorder shape;

  final Widget child;

  static const RoundedRectangleBorder _defaultDialogShape =
      RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Sizes.RADIUS_4)));
  static const double _defaultElevation = 24.0;

  @override
  Widget build(BuildContext context) {
    final DialogTheme dialogTheme = DialogTheme.of(context);
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets +
          const EdgeInsets.symmetric(
              horizontal: Sizes.PADDING_20, vertical: Sizes.PADDING_24),
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 280.0),
            child: Material(
              color: backgroundColor ??
                  dialogTheme.backgroundColor ??
                  Theme.of(context).dialogBackgroundColor,
              elevation:
                  elevation ?? dialogTheme.elevation ?? _defaultElevation,
              shape: shape ?? dialogTheme.shape ?? _defaultDialogShape,
              type: MaterialType.card,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PopsMsg extends StatefulWidget {
  String message;
  String discription;
  String buttonText;
  PopsMsg({this.message, this.discription, this.buttonText = "CLOSE"});
  @override
  _PopsMsgState createState() => _PopsMsgState();
}

class _PopsMsgState extends State<PopsMsg> {
  double size = 0;
  List<GlobalKey> _boxList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size,
        width: 300,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(Sizes.RADIUS_16),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.5),
              offset: Offset.fromDirection(90.0),
              spreadRadius: 1.0,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            if (widget.message != null)
              Container(
                  padding: EdgeInsets.only(
                      top: Sizes.PADDING_20,
                      left: Sizes.PADDING_20,
                      right: Sizes.PADDING_20,
                      bottom: widget.discription != null
                          ? Sizes.PADDING_0
                          : Sizes.PADDING_14 + 1),
                  key: _keyGenerator('keyFour'),
                  child: Text(
                    widget.message,
                    style: Styles.customMediumTextStyle(
                        color: AppColors.brandFont,
                        fontWeight: FontWeight.w600,
                        fontSize: Sizes.TEXT_SIZE_20),
                  )),
            if (widget.discription != null)
              Container(
                  padding: EdgeInsets.only(
                    top: widget.message != null
                        ? Sizes.PADDING_10
                        : Sizes.PADDING_20,
                    bottom: Sizes.PADDING_14 + 1,
                    left: Sizes.PADDING_20,
                    right: Sizes.PADDING_20,
                  ),
                  key: _keyGenerator('keyThree'),
                  child: Text(widget.discription,
                      style: Styles.customMediumTextStyle(
                          color: AppColors.brandFont,
                          fontWeight: FontWeight.normal,
                          fontSize: Sizes.TEXT_SIZE_18))),
            Divider(
              height: 0.0,
              thickness: 0.5,
              color: AppColors.grey,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context, true);
              },
              child: Container(
                  height: 40,
                  width: 300,
                  alignment: Alignment.center,
                  key: _keyGenerator('keyFive'),
                  child: Text(
                    widget.buttonText,
                    style: Styles.customMediumTextStyle(
                        color: AppColors.brandFont,
                        fontWeight: FontWeight.bold,
                        fontSize: Sizes.TEXT_SIZE_20),
                  )),
            ),
          ],
        ));
  }

  _getSizes() {
    for (var i = 0; i < _boxList.length; i++) {
      final RenderBox renderBoxRed =
          _boxList[i].currentContext.findRenderObject();
      final sizeRed = renderBoxRed.size;
      setState(() {
        size = size + sizeRed.height;
      });
    }
    // print(size.toString());
  }

  _afterLayout(_) {
    _getSizes();
  }

  _keyGenerator(key) {
    key = new GlobalKey();
    _boxList.add(key);
    return key;
  }
}

// ignore: must_be_immutable
class ConfirmPops extends StatefulWidget {
  String svgImage;
  String message;
  String discription;
  String yesText;
  String noText;
  ConfirmPops(
      {this.svgImage,
      this.message,
      this.discription,
      this.yesText = "Yes",
      this.noText = "No"});
  @override
  _ConfirmPopsState createState() => _ConfirmPopsState();
}

class _ConfirmPopsState extends State<ConfirmPops> {
  double size = 0;
  List<GlobalKey> _boxList = [];

  @override
  // ignore: must_call_super
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size,
        width: 300,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(Sizes.RADIUS_16),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.5),
              offset: Offset.fromDirection(90.0),
              spreadRadius: 1.0,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            if (widget.message != null)
              Container(
                  padding: EdgeInsets.only(
                      top: Sizes.PADDING_20,
                      left: Sizes.PADDING_20,
                      right: Sizes.PADDING_20,
                      bottom: widget.discription != null
                          ? Sizes.PADDING_0
                          : Sizes.PADDING_14 + 1),
                  key: _keyGenerator('keyFour'),
                  child: Text(
                    widget.message,
                    style: Styles.customMediumTextStyle(
                        color: AppColors.brandFont,
                        fontWeight: FontWeight.w600,
                        fontSize: Sizes.TEXT_SIZE_20),
                  )),
            if (widget.discription != null)
              Container(
                  padding: EdgeInsets.only(
                    top: widget.message != null
                        ? Sizes.PADDING_10
                        : Sizes.PADDING_20,
                    bottom: Sizes.PADDING_14 + 1,
                    left: Sizes.PADDING_20,
                    right: Sizes.PADDING_20,
                  ),
                  key: _keyGenerator('keyThree'),
                  child: Text(widget.discription,
                      style: Styles.customMediumTextStyle(
                          color: AppColors.brandFont,
                          fontWeight: FontWeight.normal,
                          fontSize: Sizes.TEXT_SIZE_18))),
            Divider(
              height: 0.0,
              thickness: 1.0,
              color: AppColors.grey,
            ),
            Container(
                height: 40.0,
                key: _keyGenerator('keyFive'),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context, false);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            widget.noText,
                            style: Styles.customMediumTextStyle(
                                color: AppColors.brandFont,
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.TEXT_SIZE_20),
                          ),
                        ),
                      ),
                    ),
                    VerticalDivider(
                      width: 0.0,
                      thickness: 0.5,
                      color: AppColors.grey,
                    ),
                    Expanded(
                      flex: 6,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context, true);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            widget.yesText,
                            style: Styles.customMediumTextStyle(
                                color: AppColors.brandFont,
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.TEXT_SIZE_20),
                          ),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ));
  }

  _getSizes() {
    for (var i = 0; i < _boxList.length; i++) {
      final RenderBox renderBoxRed =
          _boxList[i].currentContext.findRenderObject();
      final sizeRed = renderBoxRed.size;
      setState(() {
        size = size + sizeRed.height;
      });
    }

    print(size.toString());
  }

  _afterLayout(_) {
    _getSizes();
  }

  _keyGenerator(key) {
    key = new GlobalKey();
    _boxList.add(key);
    return key;
  }
}
