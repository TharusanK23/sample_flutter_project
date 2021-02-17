part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class FetchProfile extends ProfileEvent {
  final BuildContext context;
  final String customerId;
  FetchProfile(this.context, this.customerId);
}

class RefreshProfile extends ProfileEvent {
  final BuildContext context;
  final String customerId;
  RefreshProfile(this.context, this.customerId);
}

class ClearProfile extends ProfileEvent {}
