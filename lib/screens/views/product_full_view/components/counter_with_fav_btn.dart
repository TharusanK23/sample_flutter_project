part of 'package:eStore/screens/views/product_full_view/product_full_view.dart';

class _CounterWithFavBtn extends ViewModelWidget<ProductFullViewModel> {
  const _CounterWithFavBtn({Key key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, ProductFullViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _CartCounter(),
        Container(
          padding: EdgeInsets.all(Sizes.PADDING_8),
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: Color(0xFFFF6464),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(ImagePath.heart),
        )
      ],
    );
  }
}
