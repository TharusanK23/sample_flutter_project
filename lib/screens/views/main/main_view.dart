import 'package:eStore/routes/index.dart';

part 'package:eStore/screens/views/main/components/bottom_appbar.dart';

class MainView extends StatelessWidget {
  static const routeName = '/main-view';
  const MainView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
        builder: (context, model, child) {
          return SafeArea(
              child: Stack(
            children: [
              Scaffold(
                key: model.scaffoldKey,
                appBar: PreferredSize(
                  //==== Common AppBar ===
                  child: CommonAppBarMain(
                    isProfile: false,
                  ),
                  preferredSize: Size.fromHeight(55.0),
                ),
                body: model.widgetList[model.currentIndex],
                bottomNavigationBar: _NavigationBottomBar(),
              ),
              // IgnorePointer(child: AnimationScreen(color: AppColors.white))
            ],
          ));
        },
        viewModelBuilder: () => MainViewModel());
  }
}
