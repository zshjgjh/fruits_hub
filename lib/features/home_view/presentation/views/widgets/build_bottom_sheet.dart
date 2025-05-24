import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/cutom_text-field.dart';
import '../../../../../generated/assets.dart';
import '../../manager/products_cubit/products_cubit.dart';

void buildBottomSheet(BuildContext context) {
  RangeValues rangeValues = RangeValues(0, 100);
  num? startRange ;
  num? endRange ;

  TextEditingController minPriceController = TextEditingController(text: rangeValues.start.toInt().toString());
  TextEditingController maxPriceController = TextEditingController(text: rangeValues.end.toInt().toString());

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setModalState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 30,
              children: [
                Text('Sort by', style: Styles.bold19),
                Row(
                  children: [
                    Image.asset(Assets.imagesPrice),
                    Text('Price:', style: Styles.bold13),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        borderRadius: 4,
                        controller: minPriceController,
                        onChanged: (value) {
                          setModalState(() {
                            startRange = num.tryParse(value) ?? 0;
                            rangeValues = RangeValues(startRange?.toDouble()??0, rangeValues.end);
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 8),
                    Text('To', style: Styles.bold13),
                    SizedBox(width: 8),
                    Expanded(
                      child: CustomTextField(
                        borderRadius: 4,
                        controller: maxPriceController,
                        onChanged: (value) {
                          setModalState(() {
                            endRange = num.tryParse(value) ?? 500;
                            rangeValues = RangeValues(rangeValues.start, endRange?.toDouble()??1000);
                          });
                        },
                      ),
                    ),
                  ],
                ),
                RangeSlider(
                  values: rangeValues,
                  min: 0,
                  max: 1000,
                  divisions: 100,
                  labels: RangeLabels(
                    '\$${rangeValues.start.round()}',
                    '\$${rangeValues.end.round()}',
                  ),
                  activeColor: Styles.primaryColor,
                  onChanged: (values) {
                    setModalState(() {
                      rangeValues = values;
                      startRange = values.start.round();
                      endRange = values.end.round();
                      minPriceController.text = startRange.toString();
                      maxPriceController.text = endRange.toString();
                    });
                  },
                ),
                Spacer(),
                CustomButton(
                  onPressed: () {
                    BlocProvider.of<ProductsCubit>(context).getFilteredProducts(
                      startRange: startRange??0,
                      endRange: endRange??1000,
                    );
                    Navigator.pop(context); // إغلاق الشيت
                  },
                  title: 'Filter',
                  backgroundColor: Styles.primaryColor,
                  borderRadius: 16,
                  titleStyle: Styles.bold16.copyWith(color: Colors.white),
                  width: 340,
                  height: 50,
                ),
                Spacer(),
              ],
            ),
          );
        },
      );
    },
  );
}
//connect field  slider with each other using controllers, range values