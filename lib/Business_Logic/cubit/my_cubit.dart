import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../Data/Repository/my_repo.dart';

import '../../Data/Models/users.dart';

part 'my_state.dart';

class MyCubit extends Cubit<MyState> {
  final MyRepo _myRepo;
  MyCubit(this._myRepo) : super(MyInitial());

  void getAllUsers(List<Users> usersList) {
    _myRepo.getAllUsers().then((usersList) {
      emit(GotAllUsers(usersList));
    });
  }

  void getUserById(int id) {
    _myRepo.getUserById(id).then((user) {
      emit(GotUserById(user));
    });
  }

  void createUser(Users user) {
    _myRepo.createUser(user).then((user) {
      emit(CreatedUser(user));
    });
  }

  void deleteUser(int id) {
    _myRepo.deleteUser(id).then((value) {
      emit(userDeleted());
    });
  }
}
