import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constant/colors.dart';
import '../../../../common/constant/constant.dart';
import '../../../../data/di/service_locator.dart';
import 'bloc/text_input_field_bloc.dart';
import 'bloc/text_input_field_event.dart';
import 'bloc/text_input_field_state.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final bool isPassword;

  const TextInputField({
    super.key,
    required this.controller,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InputFieldBloc>(
      create: (context) => serviceLocator.get<InputFieldBloc>(),
      child: BlocBuilder<InputFieldBloc, InputFieldState>(
        builder: (context, state) {
          return TextFormField(
            cursorColor: DailyGrowColors.textColor,
            controller: controller,
            autocorrect: false,
            obscureText: isPassword && !state.isPasswordVisible,
            style: TextStyle(color: _getIconColor(state)),
            decoration: InputDecoration(
              prefixIcon: Container(
                  margin: const EdgeInsets.only(right: Constant.spaceMedium),
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(
                            color: DailyGrowColors.textColor.withOpacity(0.7))),
                  ),
                  child: Icon(icon, color: _getIconColor(state))),
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        state.isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: DailyGrowColors.hintColor,
                      ),
                      onPressed: () => context
                          .read<InputFieldBloc>()
                          .add(TogglePasswordVisibility()),
                    )
                  : null,
              hintText: hintText,
              hintStyle: const TextStyle(color: DailyGrowColors.hintColor),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (text) => context
                .read<InputFieldBloc>()
                .add(InputFieldContentChanged(text)),
          );
        },
      ),
    );
  }

  Color _getIconColor(InputFieldState state) {
    if (state.isNotEmpty) {
      return DailyGrowColors.textColor;
    } else {
      return DailyGrowColors.hintColor;
    }
  }
}
