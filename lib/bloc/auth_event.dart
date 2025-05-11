part of 'auth_bloc.dart';

sealed class AuthEvent{}
class AuthInitial extends AuthEvent{}

class AuthLoginRequest extends AuthEvent{
  final String name;
  final String date;

  AuthLoginRequest({required this.name, required this.date});
}