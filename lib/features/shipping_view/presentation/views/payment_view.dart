import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:hive/hive.dart';
import '../../../../core/utilis/constants.dart';
import '../../../../core/utilis/styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/l10n.dart';

import '../../../profile_view/data/models/card_model.dart'; // Import your CardModel

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
  late TextEditingController cardNumberController;
  late TextEditingController expiryDateController;
  late TextEditingController cardHolderNameController;
  late TextEditingController cvvController;

  bool showBackView = false;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();

    cardNumberController = TextEditingController();
    expiryDateController = TextEditingController();
    cardHolderNameController = TextEditingController();
    cvvController = TextEditingController();

    _loadDefaultCard();
  }

  void _loadDefaultCard() {
    // Open your Hive box (make sure it's opened before this screen)
    final cardBox = Hive.box<CardModel>(kCards);

    // Filter cards marked as default
    final defaultCards = cardBox.values.where((card) => card.isDefault).toList();

    if (defaultCards.isNotEmpty) {
      // Pick the latest default card - assuming HiveObject has 'key' as int incrementing
      defaultCards.sort((a, b) => (b.key as int).compareTo(a.key as int));
      final card = defaultCards.first;

      cardNumberController.text = card.cardNumber;
      expiryDateController.text = card.expiryDate;
      cardHolderNameController.text = card.cardHolderName;
      cvvController.text = card.cvv;

      // Update UI to show the front of the card initially
      showBackView = false;
    }
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    expiryDateController.dispose();
    cardHolderNameController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CreditCardWidget(
                cardType: CardType.americanExpress,
                cardNumber: cardNumberController.text,
                expiryDate: expiryDateController.text,
                cardHolderName: cardHolderNameController.text,
                cvvCode: cvvController.text,
                showBackView: showBackView,
                onCreditCardWidgetChange: (CreditCardBrand brand) {},
                bankName: 'USA Bank',
                cardBgColor: const Color(0xFF012169),
                enableFloatingCard: true,
                floatingConfig: const FloatingConfig(
                  isGlareEnabled: true,
                  isShadowEnabled: false,
                  shadowConfig: FloatingShadowConfig(),
                ),
              ),
              CreditCardForm(
                autovalidateMode: autovalidateMode,
                formKey: formKey,
                cardNumber: cardNumberController.text,
                expiryDate: expiryDateController.text,
                cardHolderName: cardHolderNameController.text,
                cvvCode: cvvController.text,
                onCreditCardModelChange: (CreditCardModel creditCardModel) {
                  showBackView = creditCardModel.isCvvFocused;
                  setState(() {});
                },
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
                  ),
                ),
              ),
              const SizedBox(height: 12),
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
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
