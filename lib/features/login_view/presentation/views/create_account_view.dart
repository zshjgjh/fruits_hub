import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/cutom_text-field.dart';
import 'package:fruits_hub/features/login_view/data/repos_impl/auth_repo_impl.dart';
import 'package:fruits_hub/features/login_view/presentation/widgets/custom_signin_button.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/utilis/app_routers.dart';
import '../../../../core/utilis/styles.dart';
import '../../../../generated/assets.dart';
import '../manager/auth_cubit.dart';
import '../widgets/build_dialog.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key,});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  String? email;
  String? password;
  bool isChecked = false;
  GlobalKey<FormState> key = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'حساب جديد'),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            isLoading = true;
            setState(() {});
          } else if (state is AuthFailure) {
            isLoading = false;
            setState(() {});
            buildDialog(context, title: 'Fail', dialogType: DialogType.error);
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
                  spacing: 20,
                  children: [
                    CustomTextField(
                      labelText: 'الاسم كامل',
                      style: Styles.bold13.copyWith(color: Color(0xFF949D9E)),
                      textInputType: TextInputType.name,
                      borderRadius: 4,
                    ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Text(
                              'من خلال إنشاء حساب ، فإنك توافق على',
                              style: Styles.semiBold13,
                              textDirection: TextDirection.rtl,
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'الشروط والأحكام الخاصة بنا',
                                  style: Styles.semiBold13
                                      .copyWith(color: Styles.primaryColor),
                                  textDirection: TextDirection.rtl,
                                )),
                          ],
                        ),
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
                            })
                      ],
                    ),
                    CustomButton(
                        onPressed: () {
                          if (key.currentState!.validate()) {
                            if (isChecked == true) {
                              key.currentState!.save();
                            BlocProvider.of<AuthCubit>(context).createUserWithEmailAndPassword(email!, password!);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'ارجو الموافقة على شروط الخصوصية')));
                            }
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                          }
                        },
                        title: 'إنشاء حساب جديد',
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
                                  .pushReplacement(AppRouters.kLoginView);
                            },
                            child: Text(
                              'تسجيل دخول ',
                              style: Styles.semiBold16
                                  .copyWith(color: Styles.primaryColor),
                            )),
                        Text(
                          'تمتلك حساب بالفعل؟',
                          style: Styles.semiBold16,
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
