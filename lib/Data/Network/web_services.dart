import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../Models/users.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: "https://gorest.co.in/public/v2/")
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET("users")
  Future<List<Users>> getUsers();

  @GET("users/{id}")
  Future<Users> getUserById(@Path("id") int id);

  @POST("users")
  Future<Users> createUser(@Body() Users user , @Header("Authorization") String token);

  @DELETE("users/{id}")
  Future<void> deleteUser(@Path("id") int id , @Header("Authorization") String token);
}
