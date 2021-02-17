part of 'package:eStore/screens/views/product_full_view/product_full_view.dart';

class _CartCounter extends ViewModelWidget<ProductFullViewModel> {
  const _CartCounter({Key key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, ProductFullViewModel model) {
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: () => model.changeItemCount(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_10),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            model.numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: () => model.changeItemCount(isAdding: true)),
      ],
    );
  }

  SizedBox buildOutlineButton({IconData icon, Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
        ),
        onPressed: press,
        child: Icon(icon, color: AppColors.black,),
      ),
    );
  }
}
