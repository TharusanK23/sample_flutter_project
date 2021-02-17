import 'package:eStore/routes/index.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial());

  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is FetchProfile) {
      if (state is ProfileLoaded) {
        yield state;
      } else {
        yield* _mapLoadProfileToState(event);
      }
    } else if (event is RefreshProfile) {
      yield* _mapRefreshProfileToState(event);
    } else if (event is ClearProfile) {
      yield* _mapClearProfileToState(event);
    }
  }

  Stream<ProfileState> _mapLoadProfileToState(FetchProfile event) async* {
    yield ProfileLoading();
    try {
      final Customer customer =
          await CustomerProvider.getCustomer(event.context, event.customerId);
      if (customer == null) {
        yield ProfileEmpty();
      } else {
        yield ProfileLoaded(customer: customer);
      }
    } catch (e) {
      yield ProfileError();
    }
  }

  Stream<ProfileState> _mapRefreshProfileToState(RefreshProfile event) async* {
    try {
      final Customer customer =
          await CustomerProvider.getCustomer(event.context, event.customerId);
      if (customer == null) {
        yield ProfileEmpty();
      } else {
        yield ProfileLoaded(customer: customer);
      }
    } catch (_) {
      yield state;
    }
  }

  Stream<ProfileState> _mapClearProfileToState(ClearProfile event) async* {
    try {
      yield ProfileEmpty();
    } catch (_) {
      yield state;
    }
  }
}
