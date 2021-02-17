import 'package:eStore/routes/index.dart';

class UploadImage extends StatelessWidget {
  final Function onGalleryTap;
  final Function onCameraTap;

  const UploadImage({Key key, this.onGalleryTap, this.onCameraTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder:
        (BuildContext context, StateSetter setState /*You can rename this!*/) {
      return SingleChildScrollView(
          child: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Container(
          padding: EdgeInsets.only(
              left: Sizes.PADDING_10,
              right: Sizes.PADDING_10,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          App.backScreenOnce(context);
                        },
                        child: Container(
                            padding: EdgeInsets.all(Sizes.PADDING_8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: AppColors.black),
                            child: Icon(
                              Icons.arrow_back,
                              size: 20,
                              color: AppColors.white,
                            )),
                      ),
                      SpaceW16(),
                      Text(
                        "ADD IMAGE".toUpperCase(),
                        style: Styles.customMediumTextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: Sizes.TEXT_SIZE_18)
                            .copyWith(
                          letterSpacing: 2.2,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      App.backScreenOnce(context);
                    },
                    child: Text(
                      "CANCEL".toUpperCase(),
                      style: Styles.customMediumTextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.TEXT_SIZE_18)
                          .copyWith(
                        letterSpacing: 2.2,
                      ),
                    ),
                  )
                ],
              ),
              SpaceH4(),
              Container(
                  height: 100,
                  padding: EdgeInsets.only(
                      top: Sizes.PADDING_14,
                      left: Sizes.PADDING_14,
                      right: Sizes.PADDING_14),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(Sizes.RADIUS_8)),
                  child: Column(children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
                        child: Container(
                            height: 85,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: onGalleryTap,
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.brand,
                                              width: 3.0),
                                          borderRadius: BorderRadius.circular(
                                              Sizes.RADIUS_12),
                                        ),
                                        padding:
                                            EdgeInsets.all(Sizes.PADDING_8),
                                        child: Icon(
                                          Icons.image,
                                          color: AppColors.brand,
                                        ),
                                      ),
                                      Text('GALLERY',
                                          style: Styles.customMediumTextStyle(
                                              color: AppColors.black
                                                  .withOpacity(0.6),
                                              fontWeight: FontWeight.w600,
                                              fontSize: Sizes.TEXT_SIZE_18))
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: onCameraTap,
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.brand,
                                                width: 3.0),
                                            borderRadius: BorderRadius.circular(
                                                Sizes.RADIUS_12),
                                            color: AppColors.brand),
                                        padding:
                                            EdgeInsets.all(Sizes.PADDING_8),
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.camera,
                                              color: AppColors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text('CAMERA',
                                          style: Styles.customMediumTextStyle(
                                              color: AppColors.black
                                                  .withOpacity(0.6),
                                              fontWeight: FontWeight.w600,
                                              fontSize: Sizes.TEXT_SIZE_18))
                                    ],
                                  ),
                                )
                              ],
                            )))
                  ])),
              SpaceH4(),
              InkWell(
                onTap: () {
                  App.backScreenOnce(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.all(Sizes.PADDING_16),
                  decoration: BoxDecoration(
                      color: AppColors.brand,
                      borderRadius: BorderRadius.circular(Sizes.RADIUS_8)),
                  child: Text(
                    "CANCEL".toUpperCase(),
                    style: Styles.customMediumTextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.TEXT_SIZE_18)
                        .copyWith(
                      letterSpacing: 2.2,
                    ),
                  ),
                ),
              ),
              SpaceH4(),
            ],
          ),
        ),
      ));
    });
  }
}
