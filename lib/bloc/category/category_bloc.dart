import 'package:eStore/routes/index.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial());

  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is FetchCategory) {
      if (state is CategoryLoaded) {
        yield state;
      } else {
        yield* _mapLoadCategoryToState(event);
      }
    } else if (event is RefreshCategory) {
      yield* _mapRefreshCategoryToState(event);
    } else if (event is ClearCategory) {
      yield* _mapClearCategoryToState(event);
    }
  }

  Stream<CategoryState> _mapLoadCategoryToState(FetchCategory event) async* {
    yield CategoryLoading();
    try {
      final List<Category> category = await CategoryProvider.getAllCategory(event.context);
      if (category.length == 0 || category == null) {
        yield CategoryEmpty();
      } else {
        yield CategoryLoaded(category: category);
      }
    } catch (e) {
      yield CategoryError();
    }
  }

  Stream<CategoryState> _mapRefreshCategoryToState(
      RefreshCategory event) async* {
    try {
      final List<Category> category = await CategoryProvider.getAllCategory(event.context);
      if (category.length == 0 || category == null) {
        yield CategoryEmpty();
      } else {
        yield CategoryLoaded(category: category);
      }
    } catch (_) {
      yield state;
    }
  }

  Stream<CategoryState> _mapClearCategoryToState(ClearCategory event) async* {
    try {
      yield CategoryEmpty();
    } catch (_) {
      yield state;
    }
  }
}
