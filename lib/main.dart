import 'package:eStore/routes/index.dart';

void main() =>
    runApp(MultiBlocProvider(providers: Providers.providers, child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildLightTheme(context),
      initialRoute: AppRouter.splashScreen,
      onGenerateRoute: AppRouter.onGenerateRoute,
      navigatorKey: AppRouter.navigator.key,
    );
  }
}
