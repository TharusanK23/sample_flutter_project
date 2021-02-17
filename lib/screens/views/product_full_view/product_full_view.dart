import 'package:eStore/routes/index.dart';
part 'package:eStore/screens/views/product_full_view/components/product_body.dart';
part 'package:eStore/screens/views/product_full_view/components/color_and_size.dart';
part 'package:eStore/screens/views/product_full_view/components/description.dart';
part 'package:eStore/screens/views/product_full_view/components/cart_counter.dart';
part 'package:eStore/screens/views/product_full_view/components/counter_with_fav_btn.dart';
part 'package:eStore/screens/views/product_full_view/components/add_to_cart_view.dart';
part 'package:eStore/screens/views/product_full_view/components/product_title_with_image.dart';

class ProductFullView extends StatelessWidget {
  static const routeName = '/product-full-view';
  const ProductFullView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductFullViewModel>.reactive(
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: model.colors[model.selectedIndex],
              body: _Body(),
              bottomNavigationBar: _AddToCartView(),
            ),
          );
        },
        onModelReady: (model) {
          model.initialise(context: context);
        },
        viewModelBuilder: () => ProductFullViewModel());
  }
}

class _Body extends ViewModelWidget<ProductFullViewModel> {
  final GlobalKey tabKey = new GlobalKey();
  _Body({Key key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, ProductFullViewModel model) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [_ProductFullBody()],
        ),
        AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: model.currentPosition > (model.imageSize)
                ? Material(
                    color: AppColors.grey,
                    child: Container(
                        height: 55,
                        width: App.getDeviceWidth(context),
                        key: UniqueKey(),
                        child: Container(
                          height: 100,
                          child: Column(
                            children: [
                              FloatingAppBar(
                                title: 'Office Code',
                              ),
                            ],
                          ),
                        )),
                  )
                : Container(
                    alignment: Alignment.centerRight,
                    height: 55,
                    width: App.getDeviceWidth(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                            ImagePath.back,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          icon: SvgPicture.asset(ImagePath.cart),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ))
      ],
    );
  }
}
