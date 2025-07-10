import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utilis/app_routers.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/cutom_text-field.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';

import '../../manager/singin_cubit/signin_cubit.dart';
import 'custom_signin_button.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  String? email;
  String? password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: S.of(context).login,
        isArrowExists: true,
        onPressed: () => Navigator.of(context).pop(),
      ),
      body: BlocListener<SigninCubit, SigninState>(
        listener: (context, state) {
          if (state is SigninLoading) {
            setState(() => isLoading = true);
          } else if (state is SigninFailure) {
            setState(() => isLoading = false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(child: Text(state.errorMessage)),
                backgroundColor: Colors.redAccent,
              ),
            );
          } else if (state is SigninSuccess) {
            setState(() => isLoading = false);
            GoRouter.of(context).pushReplacement(AppRouters.kHomeView);
          }
        },
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Form(
              key: _formKey,
              autovalidateMode: _autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    labelText: S.of(context).email,
                    textInputType: TextInputType.emailAddress,
                    borderRadius: 4,
                    onSaved: (value) => email = value,
                    style: Styles.bold13.copyWith(color: Color(0xFF949D9E)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).emailRequired;
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return S.of(context).invalidEmail;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    labelText: S.of(context).password,
                    textInputType: TextInputType.text,
                    hiddenText: true,
                    borderRadius: 4,
                    onSaved: (value) => password = value,
                    style: Styles.bold13.copyWith(color: Color(0xFF949D9E)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).passwordRequired;
                      } else if (value.length < 6) {
                        return S.of(context).passwordTooShort;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context)
                          .pushReplacement(AppRouters.kForgetPassword);
                    },
                    child: Text(
                      S.of(context).forgetPassword,
                      style:
                      Styles.semiBold13.copyWith(color: Styles.primaryColor),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    onPressed: _onLoginPressed,
                    title: S.of(context).login,
                    backgroundColor: Styles.primaryColor,
                    borderRadius: 16,
                    height: 54,
                    width: double.infinity,
                    titleStyle: Styles.bold16.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  _buildRegisterRow(context),
                  const SizedBox(height: 16),
                  _buildDividerWithText(context),
                  const SizedBox(height: 16),
                  CustomSigninButton(
                    onPressed: () {},
                    title: S.of(context).apple,
                    borderRadius: 16,
                    titleStyle: Styles.semiBold16,
                    leading: Assets.imagesApple,
                    backgroundColor: Colors.transparent,
                    borderColor: const Color(0xFFDDDFDF),
                  ),
                  const SizedBox(height: 12),
                  CustomSigninButton(
                    onPressed: () {},
                    title: S.of(context).google,
                    borderRadius: 16,
                    titleStyle: Styles.semiBold16,
                    leading: Assets.imagesGmail,
                    backgroundColor: Colors.transparent,
                    borderColor: const Color(0xFFDDDFDF),
                  ),
                  const SizedBox(height: 12),
                  CustomSigninButton(
                    onPressed: () {},
                    title: S.of(context).facebook,
                    borderRadius: 16,
                    titleStyle: Styles.semiBold16,
                    leading: Assets.imagesFacebook,
                    backgroundColor: Colors.transparent,
                    borderColor: const Color(0xFFDDDFDF),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onLoginPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      BlocProvider.of<SigninCubit>(context).signinWithEmailAndPassword(
        email: email!,
        password: password!,
      );
    } else {
      setState(() {
        // trigger UI update for validation
      });
    }
  }

  Widget _buildRegisterRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).unaccountably1, style: Styles.semiBold16),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pushReplacement(AppRouters.kCreateAccount);
          },
          child: Text(
            S.of(context).unaccountably2,
            style: Styles.semiBold16.copyWith(color: Styles.primaryColor),
          ),
        ),
      ],
    );
  }

  Widget _buildDividerWithText(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(thickness: 2, color: Color(0xFFDDDFDF)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(S.of(context).or, style: Styles.semiBold16),
        ),
        const Expanded(
          child: Divider(thickness: 2, color: Color(0xFFDDDFDF)),
        ),
      ],
    );
  }
}
