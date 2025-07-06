import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/features/profile_view/presentation/views/widgets/custom_edit_field.dart';

import '../../../../core/utilis/styles.dart';
import '../../../../core/widgets/build_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/cutom_text-field.dart';
import '../../../../generated/l10n.dart';

class AddCardView extends StatefulWidget {
  const AddCardView({super.key});

  @override
  State<AddCardView> createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> {
  GlobalKey<FormState> key = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              buildAppBar(context, title: S.of(context).addcard, isArrowExists: true,),
              CustomTextField(labelText: S.of(context).cardholde,),
              CustomTextField(labelText: S.of(context).cardnumber,),
              Row(
                spacing: 10,
                children: [
                  Expanded(child: CustomTextField(labelText: S.of(context).expdate,)), 
                  Expanded(child: CustomTextField(labelText: S.of(context).cvv,)),
                ],
              ),
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
                    value: isChecked, onChanged: (bool value) {
                    isChecked = value;
                    setState(() {});
                  },),
                  Text(S.of(context).savevirtualcard,style: Styles.semiBold16.copyWith(color: Colors.grey.withOpacity(.6)),)
                ],
              ),
              Spacer(),
              CustomButton(
                title: S.of(context).addnewpayment,
                height: 55,
                backgroundColor: Styles.primaryColor,
                borderRadius: 16,
                titleStyle: Styles.bold19.copyWith(color: Colors.white),
                onPressed:(){
                  if (key.currentState!.validate()) {
                    if (isChecked == true) {
                      key.currentState!.save();


                    }
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}