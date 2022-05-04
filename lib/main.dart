import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:must_eat_gui/core/injection.dart';
import 'package:must_eat_gui/ui/auth/auth_page.dart';
import 'package:must_eat_gui/ui/discover/discover_page.dart';
import 'package:must_eat_gui/ui/home/home_page.dart';
import 'package:must_eat_gui/ui/meals/meals_page.dart';
import 'package:must_eat_gui/ui/order/order_page.dart';
import 'package:must_eat_gui/ui/restaurants/restaurants_page.dart';
import 'package:must_eat_gui/ui/states/auth/auth_cubit.dart';
import 'package:must_eat_gui/ui/states/search/search_cubit.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: <GoRoute>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) => BlocProvider(create: (context) => Injection.searchCubit, child: const HomePage(),),
        ),
        GoRoute(
          path: '/auth',
          builder: (BuildContext context, GoRouterState state) => const AuthPage(),
        ),
        GoRoute(
          path: '/restaurants',
          builder: (BuildContext context, GoRouterState state) => const RestaurantsPage(),
        ),
        GoRoute(
          path: '/meals',
          builder: (BuildContext context, GoRouterState state) => const MealsPage(),
        ),
        GoRoute(
          path: '/order',
          builder: (BuildContext context, GoRouterState state) => const OrderPage(),
        ),
        GoRoute(
          path: '/discover',
          builder: (BuildContext context, GoRouterState state) => const DiscoverPage(),
        ),
      ],
      initialLocation: '/',
      redirect: (state) {
        // if(context.read<AuthCubit>().state.isLoggedIn){
        //   return '/';
        // }
        // if(isLogged) return '/';
        return null;
      }
    );


    return MultiBlocProvider(providers: [
          BlocProvider(create: (context) => AuthCubit())
    ], child: MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    ));
  }
}










