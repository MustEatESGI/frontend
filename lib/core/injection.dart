
import 'package:dio/dio.dart';
import 'package:must_eat_gui/services/authentication.dart';
import 'package:must_eat_gui/services/order.dart';
import 'package:must_eat_gui/services/search.dart';
import 'package:must_eat_gui/ui/states/search/search_cubit.dart';

import '../ui/states/auth/auth_cubit.dart';
import '../ui/states/order/order_cubit.dart';

class Injection {
  static Dio get dio => Dio();
  static Authentication get authentication => Authentication(dio);
  static Search get search => Search(dio);
  static SearchCubit get searchCubit => SearchCubit(search);
  static Order get order => Order(dio);
  static OrderCubit get orderCubit => OrderCubit(search, order);
  static AuthCubit get authCubit => AuthCubit();

}