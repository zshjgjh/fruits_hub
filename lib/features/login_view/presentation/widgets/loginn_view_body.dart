import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utilis/app_routers.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/cutom_text-field.dart';
import 'package:fruits_hub/features/login_view/presentation/widgets/build_dialog.dart';
import 'package:fruits_hub/features/login_view/presentation/widgets/custom_signin_button.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/utilis/styles.dart';
import '../../../../generated/assets.dart';
import '../../data/repos_impl/auth_repo_impl.dart';
import '../manager/auth_cubit.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  String? email;
  String? password;
  GlobalKey<FormState> key = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'تسجيل الدخول'),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            isLoading = true;
            setState(() {});
          } else if (state is AuthFailure) {
            isLoading = false;
            setState(() {});
            buildDialog(context,
                title: 'Fail', dialogType: DialogType.error);
          } else {
            isLoading = false;
            setState(() {});
            buildDialog(context,
                title: 'Success', dialogType: DialogType.success);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
            child: ModalProgressHUD(
              inAsyncCall: isLoading,
              child: Form(
                key: key,
                autovalidateMode: autovalidateMode,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    CustomTextField(
                      onSaved: (value) {
                        email = value;
                      },
                      labelText: 'البريد الالكتروني',
                      style: Styles.bold13.copyWith(color: Color(0xFF949D9E)),
                      textInputType: TextInputType.emailAddress,
                      borderRadius: 4,
                    ),
                    CustomTextField(
                      onSaved: (value) {
                        password = value;
                      },
                      labelText: 'كلمة المرور',
                      style: Styles.bold13.copyWith(color: Color(0xFF949D9E)),
                      hiddenText: true,
                      textInputType: TextInputType.text,
                      borderRadius: 4,
                    ),
                    GestureDetector(
                        onTap: () {
                          GoRouter.of(context)
                              .pushReplacement(AppRouters.kForgetPassword);
                        },
                        child: Text(
                          'نسيت كلمة المرور؟',
                          style: Styles.semiBold13
                              .copyWith(color: Styles.primaryColor),
                        )),
                    CustomButton(
                        onPressed: () {
                          if (key.currentState!.validate()) {
                            key.currentState!.save();

                          } else {
                            autovalidateMode = AutovalidateMode.always;
                          }
                        },
                        title: 'تسجيل دخول',
                        backgroundColor: Styles.primaryColor,
                        borderRadius: 16,
                        titleStyle:
                            Styles.bold16.copyWith(color: Colors.white)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              GoRouter.of(context)
                                  .pushReplacement(AppRouters.kCreateAccount);
                            },
                            child: Text(
                              'قم بانشاء حساب',
                              style: Styles.semiBold16
                                  .copyWith(color: Styles.primaryColor),
                            )),
                        Text(
                          'لا تمتلك حساب؟',
                          style: Styles.semiBold16,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          thickness: 2,
                          color: Color(0xFFDDDFDF),
                        )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('أو', style: Styles.semiBold16),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 2,
                          color: Color(0xFFDDDFDF),
                        )),
                      ],
                    ),
                    CustomSigninButton(
                      onPressed: () {},
                      title: 'تسجيل بواسطة ابل',
                      borderRadius: 16,
                      titleStyle: Styles.semiBold16,
                      leading: Assets.imagesApple,
                      backgroundColor: Colors.transparent,
                      borderColor: Color(0xFFDDDFDF),
                    ),
                    CustomSigninButton(
                      onPressed: () {},
                      title: 'تسجيل بواسطة جوجل',
                      borderRadius: 16,
                      titleStyle: Styles.semiBold16,
                      leading: Assets.imagesGmail,
                      backgroundColor: Colors.transparent,
                      borderColor: Color(0xFFDDDFDF),
                    ),
                    CustomSigninButton(
                      onPressed: () {},
                      title: 'تسجيل بواسطة فيسبوك',
                      borderRadius: 16,
                      titleStyle: Styles.semiBold16,
                      leading: Assets.imagesFacebook,
                      backgroundColor: Colors.transparent,
                      borderColor: Color(0xFFDDDFDF),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
