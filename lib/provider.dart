import 'package:eStore/routes/index.dart';

class Providers {
  Providers._();

  static final providers = [
    BlocProvider<CategoryBloc>(
      create: (context) => CategoryBloc(),
    ),
    BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(),
    ),
  ];
}
