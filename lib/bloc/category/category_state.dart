part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryEmpty extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> category;

  CategoryLoaded({@required this.category}) : assert(category != null);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CategoryLoaded && o.category == category;
  }

  @override
  int get hashCode => category.hashCode;
}

class CategoryError extends CategoryState {}
