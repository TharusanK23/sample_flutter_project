part of 'package:eStore/screens/views/product_full_view/product_full_view.dart';

class _ColorAndSize extends ViewModelWidget<ProductFullViewModel> {
  const _ColorAndSize({Key key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, ProductFullViewModel model) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Color"),
              SizedBox(
                  height: 30,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: model.colors.length,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () => model.selectColor(index),
                            child: _ColorDot(
                              color: model.colors[index],
                              isSelected: model.selectedIndex == index ? true : false,
                            ),
                          ))),
            ],
          ),
        ),
      ],
    );
  }
}

class _ColorDot extends ViewModelWidget<ProductFullViewModel> {
  final Color color;
  final bool isSelected;
  const _ColorDot({
    Key key,
    this.color,
    // by default isSelected is false
    this.isSelected = false,
  }) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, ProductFullViewModel model) {
    return Container(
      margin: EdgeInsets.only(
        top: Sizes.MARGIN_4,
        right: Sizes.MARGIN_10,
      ),
      padding: EdgeInsets.all(Sizes.PADDING_2),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
