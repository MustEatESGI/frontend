
import 'package:dio/dio.dart';
import 'package:must_eat_gui/core/injection.dart';
import 'package:must_eat_gui/models/command.dart';
import 'package:must_eat_gui/models/meal.dart';
import 'package:must_eat_gui/models/restaurant.dart';
import 'package:retrofit/http.dart';

part 'order.g.dart';



@RestApi(baseUrl: backendUrl)
abstract class Order{
  factory Order(Dio dio, {String baseUrl}) = _Order;


  @POST("/order")
  Future<String> submitCart(@Header("Authorization") String authorization, @Body() Command command);



}
