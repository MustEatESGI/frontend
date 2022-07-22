import 'dart:io';

import 'package:dio/dio.dart';
import 'package:must_eat_gui/core/injection.dart';
import 'package:must_eat_gui/models/credentials.dart';
import 'package:must_eat_gui/models/user.dart';
import 'package:retrofit/http.dart';

part 'authentication.g.dart';

@RestApi(baseUrl: backendUrl)
abstract class Authentication{

  factory Authentication(Dio dio, {String baseUrl}) = _Authentication;

  @POST("/user")
  Future<String> signUp(@Body() User user);

  @POST("/login")
  @FormUrlEncoded()
  Future<Credentials> signIn(@Field() String username, @Field() String password);

  @GET('/users/token/refresh')
  Future<Credentials> refresh(@Header("Authorization") String authorization);

}
