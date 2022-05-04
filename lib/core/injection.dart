
import 'package:dio/dio.dart';
import 'package:must_eat_gui/services/authentication.dart';
import 'package:must_eat_gui/services/search.dart';
import 'package:must_eat_gui/ui/states/search/search_cubit.dart';

class Injection {
  static Dio get dio => Dio();
  static Authentication get authentication => Authentication(dio);
  static Search get search => Search(dio);
  static SearchCubit get searchCubit => SearchCubit(search);

}