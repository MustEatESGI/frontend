import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {


  runApp(const MyApp());
}

bool isLogged = false;


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: <GoRoute>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) => const HomePage(),
        ),
        GoRoute(
          path: '/auth',
          builder: (BuildContext context, GoRouterState state) => const AuthPage(),
        ),
        GoRoute(
          path: '/restaurants',
          builder: (BuildContext context, GoRouterState state) => const AuthPage(),
        ),
        GoRoute(
          path: '/meals',
          builder: (BuildContext context, GoRouterState state) => const AuthPage(),
        ),
        GoRoute(
          path: '/order',
          builder: (BuildContext context, GoRouterState state) => const AuthPage(),
        ),
        GoRoute(
          path: '/discover',
          builder: (BuildContext context, GoRouterState state) => const AuthPage(),
        ),
      ],
      initialLocation: '/auth',
      redirect: (state) {
        // if(isLogged) return '/';
        return null;
      }
    );


    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}


class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: TextButton(onPressed: (){
      isLogged = true;
      context.go('/');
    }, child: Text('go to /')),),);
  }
}

class SignInTab extends StatelessWidget {
  const SignInTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class SignUpTab extends StatelessWidget {
  const SignUpTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('home'),),);
  }
}

class RestaurantsPage extends StatelessWidget {
  const RestaurantsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class MealsPage extends StatelessWidget {
  const MealsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


