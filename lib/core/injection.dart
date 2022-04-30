
import 'package:dio/dio.dart';
import 'package:must_eat_gui/services/authentication.dart';

class Injection {
  static Dio get dio => Dio();
  static Authentication get authentication => Authentication(dio);

}