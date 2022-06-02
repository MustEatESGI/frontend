import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:must_eat_gui/core/injection.dart';
import 'package:must_eat_gui/ui/auth/auth_page.dart';
import 'package:must_eat_gui/ui/cart/cart_page.dart';
import 'package:must_eat_gui/ui/home/home_page.dart';
import 'package:must_eat_gui/ui/restaurant/restaurant_page.dart';
import 'package:must_eat_gui/ui/states/auth/auth_cubit.dart';
import 'package:must_eat_gui/ui/states/order/order_cubit.dart';
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
            builder: (BuildContext context, GoRouterState state) =>
                const HomePage(),
          ),
          GoRoute(
            path: '/auth',
            builder: (BuildContext context, GoRouterState state) =>
                const AuthPage(),
          ),
          GoRoute(
            path: '/restaurant/:rid',
            builder: (BuildContext context, GoRouterState state) {
              final restaurantID = state.params['rid'] as String;
              return RestaurantPage(restaurantID: restaurantID);
            },
          ),
          GoRoute(
              path: '/cart',
              builder: (BuildContext context, GoRouterState state) {
                return const CartPage();
              }),
        ],
        initialLocation: '/auth',
        redirect: (state) {
          // if(context.read<AuthCubit>().state.isLoggedIn){
          //   return '/';
          // }
          // if(isLogged) return '/';
          return null;
        });

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => Injection.authCubit),
          BlocProvider(
              create: (context) =>
                  Injection.searchCubit..getTrendyRestaurants()),
          BlocProvider(create: (context) => Injection.orderCubit)
        ],
        child: MaterialApp.router(
          title: 'Must EAT',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
        ));
  }
}
