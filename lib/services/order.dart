
import 'package:dio/dio.dart';
import 'package:must_eat_gui/models/command.dart';
import 'package:must_eat_gui/models/meal.dart';
import 'package:must_eat_gui/models/restaurant.dart';
import 'package:retrofit/http.dart';

part 'order.g.dart';



@RestApi(baseUrl: "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/")
abstract class Order{
  factory Order(Dio dio, {String baseUrl}) = _Order;


  @POST("/submit-cart")
  Future<Command> submitCart();


}