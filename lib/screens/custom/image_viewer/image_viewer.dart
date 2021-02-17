
import 'package:eStore/routes/index.dart';

class ImageViewer extends StatefulWidget {
  final List<dynamic> images;
  final List<dynamic> thumbnail;
  final int viewedIndex;
  ImageViewer({@required this.images, this.thumbnail, this.viewedIndex: 0});

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  List<dynamic> images, thumbnail;
  int activeImage = 0;
  static double bottemImageHeight = 60.0;
  static double closeScreenHeight = 20.0;
  double thumnailImageListWidth = 0.0;
  PageController _pageController = PageController();
  @override
  // ignore: must_call_super
  initState() {
    images = widget.images == null ? [] : widget.images;
    thumbnail = widget.thumbnail == null ? images : widget.thumbnail;
    setState(() {
      activeImage = widget.viewedIndex;
    });
    Future.delayed(const Duration(milliseconds: 10), () {
      _pageController.jumpToPage(
        widget.viewedIndex,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      height: App.getDeviceHight(context),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                  height: App.getDeviceHight(context) - (closeScreenHeight * 5.0 + (8 + bottemImageHeight)),
                  width: App.getDeviceWidth(context),
                  child: PhotoViewGallery.builder(
                    backgroundDecoration: BoxDecoration(color: AppColors.white),
                    scrollPhysics: const BouncingScrollPhysics(),
                    builder: (BuildContext context, int index) {
                      return PhotoViewGalleryPageOptions(
                        minScale: PhotoViewComputedScale.contained / 3,
                        filterQuality: FilterQuality.high,
                        imageProvider: NetworkImage(images[index]),
                        initialScale: PhotoViewComputedScale.contained * 1,
                      );
                    },
                    pageController: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        activeImage = index;
                      });
                    },
                    itemCount: images.length,
                    loadingBuilder: (context, event) => Center(
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        child: CircularProgressIndicator(
                          value: event == null ? 0 : event.cumulativeBytesLoaded / event.expectedTotalBytes,
                        ),
                      ),
                    ),
                  )),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          backgroundColor: AppColors.white,
                          radius: 15,
                          child: Icon(
                            Icons.close,
                            color: AppColors.black,
                            size: 25,
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),

          // SizedBox(
          //   height: 5,
          // ),

          Container(
            height: bottemImageHeight,
            alignment: Alignment.center,
            width: App.getDeviceWidth(context),
            child: ListView.builder(
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: thumbnail.length,
                itemBuilder: (BuildContext context, int index) => InkWell(
                      onTap: () {
                        _pageController.jumpToPage(
                          index,
                        );
                      },
                      child: MeasureSize(
                        onChange: (size) {
                          setState(() {
                            thumnailImageListWidth = thumnailImageListWidth + size.width;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: index == thumbnail.length ? 0.0 : 5.0),
                          child: Container(
                              height: bottemImageHeight, //bottemImageHeight
                              width: bottemImageHeight,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  border: Border.all(
                                      color: activeImage == index ? AppColors.brandDark : AppColors.grey.withOpacity(0.5),
                                      width: activeImage == index ? 2.0 : 1.0),
                                  image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(thumbnail[index])))),
                        ),
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
