import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utilis/app_routers.dart';
import 'package:fruits_hub/core/utilis/styles.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/cutom_text-field.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../generated/l10n.dart';
import '../manager/signup_cubit/signup_cubit.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  String? email;
  String? password;
  String? name;
  bool isChecked = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: S.of(context).newAccount,
        isArrowExists: true,
        onPressed: () => Navigator.of(context).pop(),
      ),
      body: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpLoading) {
            setState(() => isLoading = true);
          } else if (state is SignUpFailure) {
            setState(() => isLoading = false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(child: Text(state.errorMessage)),
                backgroundColor: Colors.redAccent,
              ),
            );
          } else if (state is SignUpSuccess) {
            setState(() => isLoading = false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(child: Text(S.of(context).success)),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 2),
              ),
            );
            GoRouter.of(context).pushReplacement(AppRouters.kLoginView);
          }
        },
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
            child: Form(
              key: _formKey,
              autovalidateMode: _autovalidateMode,
              child: Column(
                children: [
                  CustomTextField(
                    labelText: S.of(context).name,
                    textInputType: TextInputType.name,
                    borderRadius: 4,
                    onSaved: (value) => name = value,
                    style: Styles.bold13.copyWith(color: const Color(0xFF949D9E)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).nameRequired;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    labelText: S.of(context).email,
                    textInputType: TextInputType.emailAddress,
                    borderRadius: 4,
                    onSaved: (value) => email = value,
                    style: Styles.bold13.copyWith(color: const Color(0xFF949D9E)),
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
                    style: Styles.bold13.copyWith(color: const Color(0xFF949D9E)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).passwordRequired;
                      } else if (value.length < 6) {
                        return S.of(context).passwordTooShort;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      CustomCheckBox(
                        value: isChecked,
                        onChanged: (val) {
                          setState(() => isChecked = val);
                        },
                        borderColor: Colors.grey,
                        checkedFillColor: Styles.primaryColor,
                        uncheckedFillColor: Colors.white,
                        checkedIcon: Icons.check,
                        checkedIconColor: Colors.white,
                        borderRadius: 4,
                        checkBoxSize: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).terms1,
                              style: Styles.semiBold13,
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigate to terms
                              },
                              child: Text(
                                S.of(context).terms2,
                                style: Styles.semiBold13.copyWith(
                                    color: Styles.primaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    onPressed: _onSignupPressed,
                    title: S.of(context).createnewaccount,
                    backgroundColor: Styles.primaryColor,
                    borderRadius: 16,
                    height: 54,
                    width: double.infinity,
                    titleStyle: Styles.bold16.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(S.of(context).haveaccount, style: Styles.semiBold16),
                      GestureDetector(
                        onTap: () => GoRouter.of(context)
                            .pushReplacement(AppRouters.kLoginView),
                        child: Text(
                          S.of(context).login,
                          style: Styles.semiBold16
                              .copyWith(color: Styles.primaryColor),
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
    );
  }

  void _onSignupPressed() {
    if (_formKey.currentState!.validate()) {
      if (isChecked) {
        _formKey.currentState!.save();
        BlocProvider.of<SignUpCubit>(context).createUserWithEmailAndPassword(
          email: email!,
          password: password!,
          name: name!,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).agreeterms)),
        );
      }
    } else {
      setState(() {}); // To trigger UI rebuild if needed
    }
  }
}
