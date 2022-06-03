
import 'package:dio/dio.dart';
import 'package:must_eat_gui/models/meal.dart';
import 'package:must_eat_gui/models/restaurant.dart';
import 'package:retrofit/http.dart';

part 'search.g.dart';



@RestApi(baseUrl: "http://localhost:8080/")
abstract class Search{
  factory Search(Dio dio, {String baseUrl}) = _Search;

  @GET("/restaurant/trending")
  Future<List<Restaurant>> searchTrendyRestaurants();

  @GET("/search/{mealName}/{sort}")
  Future<List<Meal>> searchByMeal(@Path("mealName") String name, @Path("sort") String sort);

  @GET("/search/{id}")
  Future<Meal> searchSingleMealByID(@Path("id") String id);

  @GET("/restaurant/{id}")
  Future<Restaurant> searchRestaurantByID(@Path("id") String id);
}