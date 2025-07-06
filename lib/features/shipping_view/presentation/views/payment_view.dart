import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import '../../../../core/utilis/styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/l10n.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({
    super.key,
    required this.onNext,
  });
  final VoidCallback onNext;
  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';
  bool showBackView = false;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers:[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
              children: [
                CreditCardWidget(
                    cardType: CardType.americanExpress,
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    showBackView: showBackView,
                    onCreditCardWidgetChange: (CreditCardBrand brand) {},
                    bankName: 'USA Bank',
                    cardBgColor: const Color(0xFF012169),
                    enableFloatingCard: true,
                    floatingConfig: const FloatingConfig(
                      isGlareEnabled: true,
                      isShadowEnabled: false,
                      shadowConfig: FloatingShadowConfig(),
                    )),
                CreditCardForm(
                    autovalidateMode: autovalidateMode,
                    formKey: formKey, // Required
                    cardNumber: cardNumber, // Required
                    expiryDate: expiryDate, // Required
                    cardHolderName: cardHolderName, // Required
                    cvvCode: cvvCode, // Required
                    onCreditCardModelChange: (CreditCardModel creditCardModel) {
                      cardHolderName = creditCardModel.cardHolderName;
                      cardNumber = creditCardModel.cardNumber;
                      expiryDate = creditCardModel.expiryDate;
                      cvvCode = creditCardModel.cvvCode;
                      showBackView = creditCardModel.isCvvFocused;
                      setState(() {});
                    }, // Required
                    obscureCvv: true,
                    obscureNumber: true,
                    isHolderNameVisible: true,
                    isCardNumberVisible: true,
                    isExpiryDateVisible: true,
                    enableCvv: true,
                    cvvValidationMessage: 'Please input a valid CVV',
                    dateValidationMessage: 'Please input a valid date',
                    numberValidationMessage: 'Please input a valid number',
                    inputConfiguration: const InputConfiguration(
                        cardNumberDecoration: InputDecoration(
                          labelText: 'Number',
                          hintText: 'XXXX XXXX XXXX XXXX',
                        ),
                        expiryDateDecoration: InputDecoration(
                          labelText: 'Expired Date',
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: InputDecoration(
                          labelText: 'CVV',
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: InputDecoration(
                          labelText: 'Card Holder',
                        ))),

                CustomButton(
                  title: S.of(context).next,
                  height: 55,
                  width: double.infinity,
                  backgroundColor: Styles.primaryColor,
                  borderRadius: 16,
                  titleStyle: Styles.bold19.copyWith(color: Colors.white),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      widget.onNext();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                    }
                  },
                )
              ],
                        ),
            ),
          ),
            ]
      );

  }
}
