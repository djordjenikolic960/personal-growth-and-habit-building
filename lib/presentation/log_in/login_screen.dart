import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../common/constant/colors.dart';
import '../../common/constant/constant.dart';
import '../../data/di/service_locator.dart';
import '../common/assets.dart';
import '../common/router/grow_daily_route.dart';
import '../common/widget/primary_button.dart';
import '../common/widget/text_input_field/text_input_field.dart';
import 'bloc/auth_bloc.dart';
import 'bloc/auth_event.dart';
import 'bloc/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            DailyGrowAssets.loginBackground,
            fit: BoxFit.cover,
          ),
          BlocProvider<AuthBloc>(
            create: (_) => serviceLocator.get<AuthBloc>(),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthError) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                } else if (state is Authenticated) {
                  context.go(GrowDailyRoute.chooseCategory.path);
                }
              },
              builder: (BuildContext context, AuthState state) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      const SizedBox(
                        height: Constant.spaceJumbo,
                      ),
                      Text(
                        "Welcome to \n Daily Grow".toUpperCase(),
                        style: const TextStyle(
                          color: DailyGrowColors.secondaryColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: Constant.spaceJumbo,
                      ),
                      TextInputField(
                        controller: emailController,
                        icon: Icons.email_outlined,
                        hintText: "Email",
                      ),
                      const SizedBox(
                        height: Constant.spaceLarge,
                      ),
                      TextInputField(
                        controller: passwordController,
                        icon: Icons.lock_outline,
                        hintText: "Password",
                        isPassword: true,
                      ),
                      const Spacer(),
                      PrimaryButton(
                        label: "Login",
                        onPressed: () {
                          context.read<AuthBloc>().add(
                                SignInRequested(
                                  emailController.text,
                                  passwordController.text,
                                ),
                              );
                        },
                      ),
                      const SizedBox(height: Constant.spaceMedium),
                      InkWell(
                        onTap: () {
                          // show sign up page
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 8.0,
                          ),
                          child: RichText(
                              text: const TextSpan(children: [
                            TextSpan(
                                text: "Don’t have an account? ",
                                style: TextStyle(
                                  color: DailyGrowColors.secondaryColor,
                                  fontSize: 12,
                                )),
                            TextSpan(
                                text: "Sign up",
                                style: TextStyle(
                                  color: DailyGrowColors.secondaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                )),
                          ])),
                        ),
                      ),
                      const SizedBox(
                        height: Constant.spaceMedium,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
