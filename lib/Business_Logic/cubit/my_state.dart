part of 'my_cubit.dart';

@immutable
abstract class MyState {}

class MyInitial extends MyState {}

class GotAllUsers extends MyState {
  final List<Users> usersList;
  GotAllUsers(this.usersList);
}

class GotUserById extends MyState {
  final Users user;
  GotUserById(this.user);
}

class CreatedUser extends MyState {
  final Users newUser;
  CreatedUser(this.newUser);
}

class userDeleted extends MyState {}
