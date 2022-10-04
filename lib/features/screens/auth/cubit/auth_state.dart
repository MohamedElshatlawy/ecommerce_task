// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoggedSuccessfully extends AuthState {}

class Logging extends AuthState {}

class UserDataLoading extends AuthState {}

class UserDataLoaded extends AuthState {}

class UserDataError extends AuthState {}

class Registering extends AuthState {}

class RegisteredSuccessfully extends AuthState {}

class Loginfailed extends AuthState {}

class Registerfailed extends AuthState {}
