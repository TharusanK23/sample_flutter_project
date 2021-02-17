part of 'category_bloc.dart';

abstract class CategoryEvent {}

class FetchCategory extends CategoryEvent {
  final BuildContext context;
  FetchCategory(this.context);
}

class RefreshCategory extends CategoryEvent {
  final BuildContext context;

  RefreshCategory(this.context);
}

class ClearCategory extends CategoryEvent {}
