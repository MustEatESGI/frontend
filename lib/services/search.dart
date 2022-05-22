
import 'package:dio/dio.dart';
import 'package:must_eat_gui/models/meal.dart';
import 'package:must_eat_gui/models/restaurant.dart';
import 'package:retrofit/http.dart';

part 'search.g.dart';



@RestApi(baseUrl: "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/")
abstract class Search{
  factory Search(Dio dio, {String baseUrl}) = _Search;

  @GET("/restaurant/trending")
  Future<List<Restaurant>> searchTrendyRestaurants();

  @GET("/search")
  Future<List<Meal>> searchByMeal(@Query("name") String name, @Query("sort") String sort);

  @GET("/search/{id}")
  Future<Meal> searchSingleMealByID(@Path("id") String id);

  @GET("/restaurant/{id}")
  Future<Meal> searchRestaurantByID(@Path("id") String id);
}