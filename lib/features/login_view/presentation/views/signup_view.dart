import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/cutom_text-field.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/utilis/app_routers.dart';
import '../../../../core/utilis/styles.dart';
import '../../../../generated/assets.dart';
import '../manager/signup_cubit/signup_cubit.dart';


class SignupView extends StatefulWidget {
  const SignupView({super.key,});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  String? email;
  String? password;
  String? name;
  bool isChecked = false;
  GlobalKey<FormState> key = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'New account', isArrowExists: true,onPressed: (){ Navigator.of(context).pop();}),
      body: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpLoading) {
            isLoading = true;
            setState(() {});
          } else if (state is SignUpFailure) {
            isLoading = false;
            setState(() {});
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text(state.errorMessage)),backgroundColor: Colors.redAccent,));
          } else {
            isLoading = false;
            setState(() {});
            ScaffoldMessenger.of(context).
            showSnackBar(SnackBar(
              content: Center(child: Text('Success')),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),));

            GoRouter.of(context).pushReplacement(AppRouters.kLoginView);

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
                  spacing: 20,
                  children: [
                    CustomTextField(
                      onSaved: (value) {
                        name = value;
                      },
                      labelText: 'Full name',
                      style: Styles.bold13.copyWith(color: Color(0xFF949D9E)),
                      textInputType: TextInputType.name,
                      borderRadius: 4,
                    ),
                    CustomTextField(
                      onSaved: (value) {
                        email = value;
                      },
                      labelText: 'Email',
                      style: Styles.bold13.copyWith(color: Color(0xFF949D9E)),
                      textInputType: TextInputType.emailAddress,
                      borderRadius: 4,
                    ),
                    CustomTextField(
                      onSaved: (value) {
                        password = value;
                      },
                      labelText: 'Password',
                      style: Styles.bold13.copyWith(color: Color(0xFF949D9E)),
                      hiddenText: true,
                      textInputType: TextInputType.text,
                      borderRadius: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomCheckBox(
                            checkedFillColor: Styles.primaryColor,
                            uncheckedFillColor: Colors.white,
                            checkedIcon: Icons.check,
                            checkedIconColor: Colors.white,
                            borderColor: Colors.grey,
                            checkBoxSize: 20,
                            borderRadius: 4,
                            value: isChecked,
                            onChanged: (value) {
                              isChecked = value!;
                              setState(() {});
                            }),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'By creating an account, you agree to',
                              style: Styles.semiBold13,
                              textDirection: TextDirection.rtl,
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Our Terms and Conditions',
                                  style: Styles.semiBold13
                                      .copyWith(color: Styles.primaryColor),
                                  textDirection: TextDirection.rtl,
                                )),
                          ],
                        ),

                      ],
                    ),
                    CustomButton(
                        onPressed: () {
                          if (key.currentState!.validate()) {
                            if (isChecked == true) {
                              key.currentState!.save();
                            BlocProvider.of<SignUpCubit>(context).createUserWithEmailAndPassword(email:email!,password:  password!,name:name!);

                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Please agree to the privacy terms.')));
                            }
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                          }
                        },
                        title: 'Create new account',
                        backgroundColor: Styles.primaryColor,
                        borderRadius: 16,
                        titleStyle:
                            Styles.bold16.copyWith(color: Colors.white),
                      width: double.infinity,
                      height: 54,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'already have an account? ',
                          style: Styles.semiBold16

                        ),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context)
                                .pushReplacement(AppRouters.kLoginView);
                          },
                          child: Text(
                            'Sign In',
                            style: Styles.semiBold16.copyWith(color: Styles.primaryColor),
                          ),
                        ),
                      ],
                    ),
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
