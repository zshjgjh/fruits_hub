import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utilis/app_routers.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';

import 'package:fruits_hub/features/login_view/presentation/manager/singin_cubit/signin_cubit.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utilis/styles.dart';
import '../../../../core/widgets/cutom_text-field.dart';
import '../../../../generated/l10n.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleResetPassword() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();

      context.read<SigninCubit>().sendPasswordResetEmail(email: email);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).checkemail)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: S.of(context).forgetPassword,
        isArrowExists: true,
        onPressed: () => Navigator.of(context).pop(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).dontworry,
                style: Styles.semiBold16.copyWith(color: const Color(0xFF616A6B)),
                maxLines: 2,
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: _emailController,
                labelText: S.of(context).email,
                style: Styles.bold13.copyWith(color: const Color(0xFF949D9E)),
                textInputType: TextInputType.emailAddress,
                borderRadius: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).emailRequired;
                  }
                  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(value)) {
                    return S.of(context).invalidEmail;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                onPressed: _handleResetPassword,
                title: S.of(context).forgetPassword,
                backgroundColor: Styles.primaryColor,
                borderRadius: 16,
                titleStyle: Styles.bold16.copyWith(color: Colors.white),
                width: double.infinity,
                height: 54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
