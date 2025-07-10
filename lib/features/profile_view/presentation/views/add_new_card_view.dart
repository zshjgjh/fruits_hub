import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/profile_view/data/models/card_model.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/utilis/styles.dart';
import '../../../../core/widgets/build_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/cutom_text-field.dart';
import '../../../../generated/l10n.dart';
import '../manager/card_cubit/card_cubit.dart';

class AddNewCardView extends StatefulWidget {
  const AddNewCardView({super.key});

  @override
  State<AddNewCardView> createState() => _AddNewCardViewState();
}

class _AddNewCardViewState extends State<AddNewCardView> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool isDefault = false;
  String? cardHolderName;
  String? cardNumber;
  String? expiryDate;
  String? cvv;

  // ========== VALIDATORS ==========

  String? validateCardHolder(String? value) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).requiredCardName;
    } else if (value.trim().length < 2) {
      return S.of(context).shortCardName;
    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return S.of(context).invalidCardName;
    }
    return null;
  }

  String? validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).requiredCardNumber;
    } else if (!RegExp(r'^\d{16}$').hasMatch(value)) {
      return S.of(context).cardNumberDigits; // "رقم البطاقة يجب أن يحتوي على 16 رقمًا"
    }
    return null;
  }

  String? validateExpiryDate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).requiredExpiryDate;
    }

    final cleanedValue = value.trim();

    // تحقق من صيغة MM/YY
    if (!RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$').hasMatch(cleanedValue)) {
      return S.of(context).invalidExpiryFormat; // صيغة غير صحيحة للتاريخ
    }

    final parts = cleanedValue.split('/');
    final month = int.tryParse(parts[0]);
    final year = int.tryParse(parts[1]);

    if (month == null || year == null) {
      return S.of(context).invalidExpiryFormat;
    }

    final now = DateTime.now();
    final currentYear = now.year % 100; // مثلا 23 للسنة 2023
    final currentFullYear = now.year;

    final fullYear = 2000 + year;

    if (fullYear < currentFullYear) {
      return S.of(context).cardExpired;
    }

    if (fullYear == currentFullYear && month < now.month) {
      return S.of(context).cardExpired;
    }

    return null;
  }

  String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).requiredCVV;
    } else if (!RegExp(r'^\d{3}$').hasMatch(value)) {
      return S.of(context).cvvDigits;
    }
    return null;
  }

  // ========== UI ==========

  @override
  Widget build(BuildContext context) {
    return BlocListener<CardCubit, CardState>(
      listener: (context, state) {
        if (state is CardSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).successaddcard)),
          );
          // يمكن إضافة إغلاق الشاشة أو إعادة تعيين الحقول هنا إذا أردت
        } else if (state is CardFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).failaddcard)),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Form(
            key: key,
            autovalidateMode: autovalidateMode,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildAppBar(
                    context,
                    title: S.of(context).addcard,
                    isArrowExists: true,
                    onPressed: () => PersistentNavBarNavigator.pop(context),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    labelText: S.of(context).cardholde,
                    onSaved: (value) => cardHolderName = value,
                    validator: validateCardHolder,
                    textInputType: TextInputType.name,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    labelText: S.of(context).cardnumber,
                    onSaved: (value) => cardNumber = value,
                    validator: validateCardNumber,
                    textInputType: TextInputType.number,

                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: S.of(context).expdate,
                          onSaved: (value) => expiryDate = value,
                          validator: validateExpiryDate,
                          textInputType: TextInputType.datetime,


                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomTextField(
                          labelText: S.of(context).cvv,
                          onSaved: (value) => cvv = value,
                          validator: validateCVV,
                          textInputType: TextInputType.number,

                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      CustomCheckBox(
                        checkedFillColor: Styles.primaryColor,
                        uncheckedFillColor: Colors.white,
                        checkedIcon: Icons.check,
                        checkedIconColor: Colors.white,
                        borderColor: Colors.grey,
                        checkBoxSize: 20,
                        borderRadius: 4,
                        value: isDefault,
                        onChanged: (bool value) {
                          setState(() {
                            isDefault = value;
                          });
                        },
                      ),
                      const SizedBox(width: 8),
                      Text(
                        S.of(context).savevirtualcard,
                        style: Styles.semiBold16
                            .copyWith(color: Colors.grey.withOpacity(0.6)),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomButton(
                    title: S.of(context).addnewpayment,
                    height: 55,
                    backgroundColor: Styles.primaryColor,
                    borderRadius: 16,
                    titleStyle: Styles.bold19.copyWith(color: Colors.white),
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        key.currentState!.save();
                        final card = CardModel(
                          cardHolderName: cardHolderName!,
                          cardNumber: cardNumber!,
                          expiryDate: expiryDate!,
                          cvv: cvv!,
                          isDefault: isDefault,
                        );
                        BlocProvider.of<CardCubit>(context).addCard(card: card);
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
