

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: SizedBox(
        width: 200,
        height: double.infinity,
        child: Form(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(''),
            const FlutterLogo(size: 150,),
          const SizedBox(height: 25,),
          TextFormField(),
            const SizedBox(height: 25,),

            TextFormField(),
        ],)),
      ),
    ),);
  }
}