part of 'package:eStore/screens/views/product_full_view/product_full_view.dart';

class _ProductFullBody extends ViewModelWidget<ProductFullViewModel> {
  const _ProductFullBody({Key key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, ProductFullViewModel model) {
    return Flexible(
      child: ListView(
        physics: ClampingScrollPhysics(),
        controller: model.scrollController,
        children: [
          Stack(
            children: <Widget>[
              Container(
                constraints: BoxConstraints(minHeight: App.getDeviceHight(context) * 0.535),
                margin: EdgeInsets.only(top: App.getDeviceHight(context) * 0.3),
                padding: EdgeInsets.only(
                  top: App.getDeviceHight(context) * 0.1,
                  left: Sizes.PADDING_20,
                  right: Sizes.PADDING_20,
                ),
                // height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Sizes.RADIUS_22),
                    topRight: Radius.circular(Sizes.RADIUS_22),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    // === Select color ===
                    _ColorAndSize(),
                    SpaceH20(),
                    // ==== Fav Button ====
                    _CounterWithFavBtn(),
                    // ==== Product Description ===
                    _Description(),
                    SpaceH10(),
                  ],
                ),
              ),
              // Product title and Image
              _ProductTitleWithImage()
            ],
          ),
        ],
      ),
    );
  }
}
