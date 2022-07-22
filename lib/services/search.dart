
import 'package:dio/dio.dart';
import 'package:must_eat_gui/core/injection.dart';
import 'package:must_eat_gui/models/meal.dart';
import 'package:must_eat_gui/models/restaurant.dart';
import 'package:retrofit/http.dart';

part 'search.g.dart';



@RestApi(baseUrl: backendUrl)
abstract class Search{
  factory Search(Dio dio, {String baseUrl}) = _Search;

  @GET("/restaurants/trending")
  Future<List<Restaurant>> searchTrendyRestaurants(@Header("Authorization") String authorization);

  @GET("/search/{mealName}/{sort}")
  Future<List<Meal>> searchByMeal(@Header("Authorization") String authorization, @Path("mealName") String name, @Path("sort") String sort);

  @GET("/search/{id}")
  Future<Meal> searchSingleMealByID(@Header("Authorization") String authorization, @Path("id") String id);

  @GET("/restaurant/{id}")
  Future<Restaurant> searchRestaurantByID(@Header("Authorization") String authorization, @Path("id") String id);
}
