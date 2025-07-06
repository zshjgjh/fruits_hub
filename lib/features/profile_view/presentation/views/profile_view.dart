import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utilis/save_user_locally.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/cutom_text-field.dart';
import 'package:fruits_hub/features/login_view/presentation/manager/singin_cubit/signin_cubit.dart';
import 'package:fruits_hub/features/profile_view/presentation/views/widgets/custom_edit_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../core/utilis/styles.dart';
import '../../../../core/widgets/build_app_bar.dart';
import '../../../../generated/l10n.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  String? newPassword;
  String? confirmPassword;
  String? name;
  String? email;

  late TextEditingController nameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    final user = getUserDataLocally();
    nameController = TextEditingController(text: user.name);
    emailController = TextEditingController(text: user.email);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        } else if (state is updateProfileSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Profile updated successfully.")),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: state is SigninLoading,
            progressIndicator: const CircularProgressIndicator(),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: _autovalidateMode,
                      child: Column(
                        spacing: 20,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildAppBar(
                            context,
                            title: S.of(context).profile,
                            isArrowExists: false,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            S.of(context).personalinformation,
                            style: Styles.bold19,
                          ),
                          CustomEditField(
                            controller: nameController,
                            textInputType: TextInputType.name,
                            onChanged: (value) {
                              name = value;
                              setState(() {});
                            },
                            onPressed: () {
                              nameController.clear();
                            },
                          ),
                          CustomEditField(
                            controller: emailController,
                            textInputType: TextInputType.emailAddress,
                            onChanged: (value) {
                              email = value;
                              setState(() {});
                            },
                            onPressed: () {
                              emailController.clear();
                            },
                          ),
                          const SizedBox(height: 24),
                          Text(
                            S.of(context).changepassword,
                            style: Styles.bold19,
                          ),
                          CustomTextField(
                            hiddenText: true,
                            labelText: S.of(context).newPassword,
                            validator: (value) {
                              // If user doesn't want to change password (newPassword is empty), no validation error
                              if (value == null || value.isEmpty) {
                                return null;
                              }

                              // Add your password validation rules here, e.g. minimum length
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters long.';
                              }

                              // Add other validation rules as needed

                              return null; // Valid password
                            },
                            onChanged: (value) {
                              newPassword = value;
                              setState(() {});
                            },
                          ),
                          CustomTextField(
                            hiddenText: true,
                            labelText: S.of(context).confirmnewpassword,
                            onChanged: (value) {
                              confirmPassword = value;
                              setState(() {});
                            },
                            validator: (value) {
                              // لا حاجة للتحقق لو لم يكتب New Password
                              if (newPassword == null || newPassword!.isEmpty) {
                                return null;
                              }
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your new password.';
                              }
                              if (value != newPassword) {
                                return 'Passwords do not match.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          CustomButton(
                            title: S.of(context).savechanges,
                            backgroundColor: Styles.primaryColor,
                            borderRadius: 16,
                            titleStyle:
                                Styles.bold19.copyWith(color: Colors.white),
                            height: 55,
                            width: double.infinity,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    String? currentPassword;
                                    return AlertDialog(
                                      title:
                                          const Text('Enter Current Password'),
                                      content: CustomTextField(
                                        hiddenText: true,
                                        labelText:
                                            S.of(context).currentpassword,
                                        onChanged: (value) {
                                          currentPassword = value;
                                        },
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            if (currentPassword == null ||
                                                currentPassword!.isEmpty) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      'Please enter your current password.'),
                                                ),
                                              );
                                              return;
                                            }

                                            Navigator.pop(context);
                                            BlocProvider.of<SigninCubit>(
                                                    context)
                                                .updateProfile(
                                              uid: getUserDataLocally().id,
                                              currentPassword: currentPassword!,
                                              newPassword:
                                                  (newPassword ?? "").isEmpty
                                                      ? null
                                                      : newPassword,
                                              name: name?.trim(),
                                              email: email?.trim(),
                                            );
                                          },
                                          child: const Text('Confirm'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                setState(() {
                                  _autovalidateMode = AutovalidateMode.always;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
