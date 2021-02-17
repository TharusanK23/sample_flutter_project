part of 'package:eStore/screens/views/product_full_view/product_full_view.dart';

class _ProductTitleWithImage extends ViewModelWidget<ProductFullViewModel> {
  const _ProductTitleWithImage({Key key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, ProductFullViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Sizes.PADDING_20, vertical: Sizes.PADDING_68),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Aristocratic Hand Bag",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            model.product.title,
            style: Styles.customMediumTextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
                fontSize: Sizes.TEXT_SIZE_28),
          ),
          Container(
            margin: EdgeInsets.only(top: Sizes.MARGIN_10),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "Price\n"),
                          TextSpan(
                            text: "${App.getPrice(model.product.price)}",
                            style: Styles.customMediumTextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: Sizes.TEXT_SIZE_22),
                          ),
                        ],
                      ),
                    ),
                    SpaceH10(),
                    Container(
                      width: App.getDeviceWidth(context) * 0.35,
                      height: App.getDeviceWidth(context) * 0.1,
                      child: Row(
                        children: [
                          Flexible(
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: model.product.image.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () => model.setImage(
                                        image: model.product.image[index],
                                        index: index),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 500),
                                      width: 40.0,
                                      height: 40.0,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: Sizes.MARGIN_4),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Sizes.RADIUS_4),
                                          border: Border.all(
                                              color: model.imageCurrentIndex ==
                                                      index
                                                  ? AppColors.brandDark
                                                  : AppColors.grey
                                                      .withOpacity(0.5),
                                              width: 1.5),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  model.product.image[index]))),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SpaceW20(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Hero(
                          tag: "${model.product.id}",
                          child: FittedBox(
                            child: GestureDetector(
                              onTap: () => model.viewProductImage(context),
                              child: Container(
                                height: App.getDeviceWidth(context) * 0.4,
                                width: App.getDeviceWidth(context) * 0.45,
                                margin: EdgeInsets.only(right: Sizes.MARGIN_8),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(Sizes.RADIUS_14),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.fill,
                                    imageUrl: (model.imageUrl),
                                    placeholder: (context, url) => Center(
                                      child: SvgPicture.asset(
                                        ImagePath.placeholder,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Center(
                                      child: SvgPicture.asset(
                                        ImagePath.placeholder,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),

                  // Image.network(
                  //   model.product.image,
                  //   fit: BoxFit.fill,
                  // ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
