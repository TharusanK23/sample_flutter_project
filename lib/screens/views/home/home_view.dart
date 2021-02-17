import 'package:eStore/routes/index.dart';
part 'package:eStore/screens/views/home/components/home_banner.dart';
part 'package:eStore/screens/views/home/components/category/category_view.dart';
part 'package:eStore/screens/views/home/components/flash_sale/flash_sale_view.dart';
part 'package:eStore/screens/views/home/components/product_list/product_list_view.dart';

class HomeView extends StatelessWidget {
  static const routeName = '/home-view';
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.grey[50],
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    color: AppColors.white,
                    child: Column(
                      children: [
                        // ==== Top Discount Banner ===
                        _HeaderBannerView(),
                        // ==== Flash Sale Product Cards
                        _FlashSaleView(),
                        // ==== Categories Title =====
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: Sizes.PADDING_10),
                          child: Text('Categories',
                              style: Styles.customMediumTextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Sizes.TEXT_SIZE_16)),
                        ),
                        // ==== Category List
                        _CategoriesView(),
                      ],
                    ),
                  ),
                  // ===== Most Populer Products title ==== 
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                        top: Sizes.PADDING_16, left: Sizes.PADDING_10),
                    child: Text('Most Populer Products',
                        style: Styles.customMediumTextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: Sizes.TEXT_SIZE_16)),
                  ),
                  // ===== Most Populer Products list ====
                  _ProductSampleListView()
                ],
              ),
            ),
          );
        },
        onModelReady: (model) {
          model.initialise(context: context);
        },
        viewModelBuilder: () => HomeViewModel());
  }
}
