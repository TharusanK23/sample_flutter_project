part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileEmpty extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final Customer customer;

  ProfileLoaded({@required this.customer}) : assert(customer != null);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ProfileLoaded && o.customer == customer;
  }

  @override
  int get hashCode => customer.hashCode;
}

class ProfileError extends ProfileState {}
