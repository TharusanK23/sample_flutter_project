part of 'package:eStore/screens/views/product_list/product_list_view.dart';

class _ProductListView extends ViewModelWidget<ProductListViewModel> {
  const _ProductListView({Key key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, ProductListViewModel model) {
    return _ProductListBodyPart();
  }
}

// Product List Grid view
class _ProductListBodyPart extends ViewModelWidget<ProductListViewModel> {
  _ProductListBodyPart({Key key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, ProductListViewModel model) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(Sizes.PADDING_10),
        shrinkWrap: true,
        itemCount: 99,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.69,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5),
        itemBuilder: (BuildContext context, int index) {
          return _ProductListCard(
            imageUrl:
                'https://794c3afa34486272597f-00a864f9adba2d83ae580aea47304566.ssl.cf1.rackcdn.com/Nivea-Cool-Kick-Shower-Gel.jpg',
            productName: 'Product Name ${index + 1}',
            desc:
                "This article shows you how to disable the landscape mode in Flutter.",
            price: 10.0 * (index + 1),
            originalPrice: 20.0 * (index + 1),
            discount: (0.5) * (index + 1),
            press: () => model.navigateProductFullView(),
          );
        });
  }
}

// Product Card
class _ProductListCard extends ViewModelWidget<ProductListViewModel> {
  final String imageUrl, productName, desc;
  final double price, originalPrice, discount;
  final GestureTapCallback press;
  const _ProductListCard({
    Key key,
    @required this.imageUrl,
    @required this.productName,
    @required this.desc,
    @required this.price,
    @required this.originalPrice,
    @required this.discount,
    @required this.press,
  }) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, ProductListViewModel model) {
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: App.getDeviceWidth(context) * 0.4,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Sizes.RADIUS_6),
                  topRight: Radius.circular(Sizes.RADIUS_6),
                ),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: SvgPicture.asset(
                      ImagePath.placeholder,
                      fit: BoxFit.cover,
                    ),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: SvgPicture.asset(
                      ImagePath.placeholder,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SpaceH8(),
            Container(
              padding: const EdgeInsets.only(
                left: Sizes.PADDING_8,
              ),
              child: Text(productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.customMediumTextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: Sizes.TEXT_SIZE_14)),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: Sizes.PADDING_8,
              ),
              child: Text(desc,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.customMediumTextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: Sizes.TEXT_SIZE_12)),
            ),
            SpaceH8(),
            Container(
                padding: const EdgeInsets.only(
                  left: Sizes.PADDING_8,
                ),
                child: CommonWidget.priceTextSmall(text: App.getPrice(price))),
            Row(
              children: [
                Container(
                    padding: const EdgeInsets.only(
                      left: Sizes.PADDING_8,
                    ),
                    child: CommonWidget.priceTextSmall(
                        text: App.getPrice(originalPrice),
                        crossText: true,
                        color: AppColors.grey)),
                SpaceW4(),
                Container(
                  padding: const EdgeInsets.only(
                    left: Sizes.PADDING_8,
                  ),
                  child: Text("($discount\% Off)",
                      style: Styles.customMediumTextStyle(
                          color: AppColors.errorWorning,
                          fontWeight: FontWeight.w500,
                          fontSize: Sizes.TEXT_SIZE_12)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Product Loading card
// ignore: unused_element
class _ProductListCardLoading extends ViewModelWidget<ProductListViewModel> {
  const _ProductListCardLoading({
    Key key,
  }) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, ProductListViewModel model) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[50],
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.whiteShade_50),
          borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                height: App.getDeviceWidth(context) * 0.4,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Sizes.RADIUS_4),
                    topRight: Radius.circular(Sizes.RADIUS_4),
                  ),
                  child: Text('eStore',
                      style: Styles.customMediumTextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: StringConst.APP_FONT_FAMILY,
                          fontSize: Sizes.TEXT_SIZE_36)),
                )),
            SpaceH12(),
            FittedBox(
              child: Container(
                margin: const EdgeInsets.all(
                  Sizes.MARGIN_4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
                  color: AppColors.whiteShade_50,
                ),
                width: App.getDeviceHight(context) * 0.25,
                height: 15.0,
              ),
            ),
            SpaceH4(),
            FittedBox(
              child: Container(
                margin: const EdgeInsets.all(
                  Sizes.MARGIN_4 - 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
                  color: AppColors.whiteShade_50,
                ),
                width: App.getDeviceHight(context) * 0.25,
                height: 10.0,
              ),
            ),
            SpaceH8(),
            FittedBox(
              child: Container(
                margin: const EdgeInsets.all(
                  Sizes.MARGIN_4 - 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
                  color: AppColors.whiteShade_50,
                ),
                width: App.getDeviceHight(context) * 0.1,
                height: 10.0,
              ),
            ),
            Row(
              children: [
                FittedBox(
                  child: Container(
                    margin: const EdgeInsets.all(
                      Sizes.MARGIN_4 - 2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
                      color: AppColors.whiteShade_50,
                    ),
                    width: App.getDeviceHight(context) * 0.1,
                    height: 10.0,
                  ),
                ),
                SpaceH4(),
                FittedBox(
                  child: Container(
                    margin: const EdgeInsets.all(
                      Sizes.MARGIN_4 - 2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
                      color: AppColors.whiteShade_50,
                    ),
                    width: App.getDeviceHight(context) * 0.1,
                    height: 10.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
