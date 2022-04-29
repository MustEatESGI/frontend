import 'package:dio/dio.dart';
import 'package:must_eat_gui/models/user.dart';
import 'package:retrofit/http.dart';

part 'authentication.g.dart';

@RestApi(baseUrl: "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/")
abstract class Authentication{

  factory Authentication(Dio dio, {String baseUrl}) = _Authentication;

  @POST("/sign-up")
  Future<User> signUp();

  @POST("/sign-in")
  Future<User> signIn();

  @POST("/sign-out")
  Future<void> signOut(User user);

}