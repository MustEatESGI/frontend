import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:must_eat_gui/main.dart';

import '../states/auth/auth_cubit.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          height: double.infinity,
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(size: 150),
              const SizedBox(height: 50),
              TextFormField(
                onChanged: context.read<AuthCubit>().onEmailChange,
                decoration: const InputDecoration(hintText: "Email"),
              ),
              const SizedBox(height: 25),
              TextFormField(
                onChanged: context.read<AuthCubit>().onPasswordChange,
                decoration: const InputDecoration(hintText: "Password"),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GFButton(
                    onPressed: () {
                      context.read<AuthCubit>().onQuickLogin(context);
                    },
                    text: "Connexion",
                  ),
                  GFButton(
                    color: GFColors.SUCCESS,
                    onPressed: () {
                      context.read<AuthCubit>().onSignUp(context);
                    },
                    text: "Inscription",
                  ),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
