part of 'package:eStore/screens/views/product_full_view/product_full_view.dart';

class _Description extends ViewModelWidget<ProductFullViewModel> {
  const _Description({Key key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, ProductFullViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.PADDING_20),
      child: Text(
        model.product.description,
        textAlign: TextAlign.justify,
        style: Styles.customMediumTextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.normal,
                fontSize: Sizes.TEXT_SIZE_14+1)
            .copyWith(height: 1.5),
      ),
    );
  }
}
