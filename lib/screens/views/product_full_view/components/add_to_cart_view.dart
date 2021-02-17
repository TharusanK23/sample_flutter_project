part of 'package:eStore/screens/views/product_full_view/product_full_view.dart';

class _AddToCartView extends ViewModelWidget<ProductFullViewModel> {
  const _AddToCartView({Key key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, ProductFullViewModel model) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(
          vertical: Sizes.PADDING_18, horizontal: Sizes.PADDING_20),
      child: Row(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: model.colors[model.selectedIndex]),
                borderRadius: BorderRadius.all(Radius.circular(Sizes.SIZE_8)),
              ),
              child: FlatButton(
                onPressed: () {},
                child: SvgPicture.asset(
                  ImagePath.addToCart,
                  color: model.colors[model.selectedIndex],
                ),
              )),
          SpaceW10(),
          Expanded(
            child: Buttons.raisedButton(
              buttonColor: model.colors[model.selectedIndex],
              onPressed: () {},
              buttonText: "Buy  Now",
              fontSize: Sizes.TEXT_SIZE_18,
            ),
          ),
        ],
      ),
    );
  }
}
