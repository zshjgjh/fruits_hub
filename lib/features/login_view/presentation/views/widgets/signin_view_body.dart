import 'package:awesome_dialog/awesome_dialog.dart';
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
import '../../manager/signup_cubit/signup_cubit.dart';
import '../../manager/singin_cubit/signin_cubit.dart';
import 'custom_signin_button.dart';


class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  String? email;
  String? password;
  GlobalKey<FormState> key = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: S.of(context).login, isArrowExists: true,onPressed: (){ Navigator.of(context).pop();}),
      body: BlocListener<SigninCubit, SigninState>(
        listener: (context, state) {
          if (state is SigninLoading) {
            isLoading = true;
            setState(() {});
          } else if (state is SigninFailure) {
            isLoading = false;
            setState(() {});
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text(state.errorMessage)),backgroundColor: Colors.redAccent,));
          } else {
            isLoading = false;
            setState(() {});

            GoRouter.of(context).pushReplacement(AppRouters.kHomeView);
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
                      labelText: S.of(context).email,
                      style: Styles.bold13.copyWith(color: Color(0xFF949D9E)),
                      textInputType: TextInputType.emailAddress,
                      borderRadius: 4,
                    ),
                    CustomTextField(
                      onSaved: (value) {
                        password = value;
                      },
                      labelText: S.of(context).password,
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
                          S.of(context).forgetPassword,
                          style: Styles.semiBold13
                              .copyWith(color: Styles.primaryColor),
                        )),
                    CustomButton(
                        onPressed: () {
                          if (key.currentState!.validate()) {
                            key.currentState!.save();
                            BlocProvider.of<SigninCubit>(context).signinWithEmailAndPassword(email:email!, password:password!);

                          } else {
                            autovalidateMode = AutovalidateMode.always;
                          }
                        },
                        title:S.of(context).login,
                        backgroundColor: Styles.primaryColor,
                        borderRadius: 16,
                        titleStyle:
                            Styles.bold16.copyWith(color: Colors.white),
                      width: double.infinity,
                      height: 54,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(S.of(context).unaccountably1,
                          style: Styles.semiBold16

                        ),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context)
                                .pushReplacement(AppRouters.kCreateAccount);
                          },
                          child: Text(S.of(context).unaccountably2,
                            style: Styles.semiBold16.copyWith(color: Styles.primaryColor),
                          ),
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
                          child: Text(S.of(context).or, style: Styles.semiBold16),
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
                      title: S.of(context).apple,
                      borderRadius: 16,
                      titleStyle: Styles.semiBold16,
                      leading: Assets.imagesApple,
                      backgroundColor: Colors.transparent,
                      borderColor: Color(0xFFDDDFDF),
                    ),
                    CustomSigninButton(
                      onPressed: () {},
                      title: S.of(context).google,
                      borderRadius: 16,
                      titleStyle: Styles.semiBold16,
                      leading: Assets.imagesGmail,
                      backgroundColor: Colors.transparent,
                      borderColor: Color(0xFFDDDFDF),
                    ),
                    CustomSigninButton(
                      onPressed: () {},
                      title: S.of(context).facebook,
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
