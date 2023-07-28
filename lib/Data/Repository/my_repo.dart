import '../Models/users.dart';
import '../Network/web_services.dart';

class MyRepo {
  final WebServices _webServices;
  MyRepo(this._webServices);
  Future<List<Users>> getAllUsers() async {
    final response = await _webServices.getUsers();
    return response
        .map((userObject) => Users.fromJson(userObject.toJson()))
        .toList();
  }

  Future<Users> getUserById(int id) async {
    final response = await _webServices.getUserById(id);
    return response;
  }

  Future<Users> createUser(Users user ) async{
    final response = await _webServices.createUser(user , "Bearer ab0191e230ad1863f5280f7508dbd9375d79ba222cbf572d817ff84f3fcfe7cd");
    return response;
  }

  Future<void> deleteUser(int id) async {
    final response = _webServices.deleteUser(id , "Bearer ab0191e230ad1863f5280f7508dbd9375d79ba222cbf572d817ff84f3fcfe7cd");
    return response.then((value) {
      print("User Deleted");
    });
  }
}
