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
import '../log_in/bloc/auth_bloc.dart';
import '../log_in/bloc/auth_event.dart';
import '../log_in/bloc/auth_state.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider<AuthBloc>(
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
            final isLoading = state is AuthLoading;
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: Constant.spaceJumbo,
                      ),
                      Image.asset(DailyGrowAssets.signUpAvatar),
                      const SizedBox(
                        height: Constant.spaceJumbo,
                      ),
                      Text(
                        "Create your account".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: DailyGrowColors.secondaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: Constant.spaceJumbo,
                      ),
                      TextInputField(
                        controller: nameController,
                        icon: Icons.account_circle_sharp,
                        hintText: "Name",
                      ),
                      const SizedBox(
                        height: Constant.spaceLarge,
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
                        label: "Create Account",
                        onPressed: () {
                          context.read<AuthBloc>().add(
                                SignUpRequested(
                                  emailController.text,
                                  passwordController.text,
                                  nameController.text,
                                ),
                              );
                        },
                      ),
                      const SizedBox(height: Constant.spaceMedium),
                      InkWell(
                        onTap: () => context.go(GrowDailyRoute.logIn.path),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 8.0,
                          ),
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "Already have an account? ",
                                  style: TextStyle(
                                    color: DailyGrowColors.secondaryColor,
                                    fontSize: 12,
                                  ),
                                ),
                                TextSpan(
                                  text: "Log in",
                                  style: TextStyle(
                                    color: DailyGrowColors.secondaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: Constant.spaceMedium,
                      )
                    ],
                  ),
                  isLoading
                      ? const CircularProgressIndicator()
                      : const SizedBox.shrink(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
