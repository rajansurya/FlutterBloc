part of 'auth_bloc.dart';

abstract class AuthState {}


final class AuthStateInitial extends AuthState{}
final class AuthStateSuccess extends AuthState{}
final class AuthStateFailure extends AuthState{}