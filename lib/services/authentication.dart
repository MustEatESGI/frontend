import 'dart:io';

import 'package:dio/dio.dart';
import 'package:must_eat_gui/models/credentials.dart';
import 'package:must_eat_gui/models/user.dart';
import 'package:retrofit/http.dart';

part 'authentication.g.dart';

@RestApi(baseUrl: "http://localhost:8080/")
abstract class Authentication{

  factory Authentication(Dio dio, {String baseUrl}) = _Authentication;

  @POST("/user")
  Future<bool> signUp(@Body() User user);

  @POST("/login")
  @FormUrlEncoded()
  Future<Credentials> signIn(@Field() String username, @Field() String password);

  @GET('/users/token/refresh')
  Future<Credentials> refresh(@Header("Authorization") String authorization);

}