import 'package:eStore/routes/index.dart';
part 'package:eStore/screens/views/product_list/components/product_list_card/product_list_card_view.dart';

class ProductListView extends StatelessWidget {
  static const routeName = '/product-list-view';
  const ProductListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductListViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.grey[50],
            body: Column(
              children: [
                SpaceH10(),
                // ==== Product Category view ====
                _ProductCategoriesView(),
                // ==== Product List View ====
                Flexible(
                  child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(children: [_ProductListView()])),
                ),
              ],
            ),
          );
        },
        onModelReady: (model) {
          model.initialise(context: context);
        },
        viewModelBuilder: () => ProductListViewModel());
  }
}

// ===== Product Categories view ====
class _ProductCategoriesView extends ViewModelWidget<ProductListViewModel> {
  const _ProductCategoriesView({Key key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, ProductListViewModel model) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => model.selectCategory(index),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(categoryList[index].name,
                    style: Styles.customMediumTextStyle(
                        color: model.selectedIndex == index
                            ? AppColors.black
                            : AppColors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                        fontSize: Sizes.TEXT_SIZE_16)),
                Container(
                  margin: EdgeInsets.only(
                      top: Sizes.PADDING_4), //top padding 5
                  height: 2,
                  width: 40,
                  color: model.selectedIndex == index
                      ? AppColors.brand
                      : Colors.transparent,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
