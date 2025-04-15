import 'dart:io';

import 'package:checkbox_list/checkbox_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


import '../../../../../core/utilis/styles.dart';
import '../../../../../core/widgets/build_app_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/cutom_text-field.dart';
import '../../../domain/entities/product_entity.dart';
import '../../manager/add_product_cubit.dart';
import 'image_field.dart';


class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
String? name,code,description;
bool?isFeatured=false;
bool?isOrganig=false;
int?expMonthes,numOfCalories,unitAmount;
int?ratingCount=0;
num?avgRating=0;
num?price;
File?imageFile;

bool isLoading=false;

final GlobalKey<FormState> key=GlobalKey();
AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
  listener: (context, state) {
     if(state is AddProductLoading){
       isLoading=true;
       setState(() {

       });
     }else if(state is AddProductFailure){
       isLoading=false;
       setState(() {

       });
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMessage)));

     }else{
       isLoading=false;
       setState(() {

       });
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Success to add product')));

     }
  },
  builder: (context, state) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
            child: Form(
              key: key,
              child: Column(
                spacing: 24,
                children: [
                 buildAppBar(title: 'Add product',context) ,
                  CustomTextField(
                    labelText: 'product name',
                    style: Styles.bold19,
                    textInputType: TextInputType.name,
                    onSaved: (value){
                      name=value;
                    },
                  ),
                  CustomTextField(
                    labelText: 'price',
                    style: Styles.bold19,
                    textInputType:TextInputType.number ,
                    onSaved: (value){
                      price=num.tryParse(value!);
                    },
                  ),
                  CustomTextField(
                    labelText: 'code',
                    style: Styles.bold19,
                    hiddenText: false,
                    onSaved: (value){
                      code=value!.toLowerCase();
                    },
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: 'calories',
                          style: Styles.bold19,
                          textInputType:TextInputType.number ,
                          onSaved: (value){
                            numOfCalories=int.tryParse(value!);
                          },
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          labelText: 'per unit',
                          style: Styles.bold19,
                          textInputType:TextInputType.number ,
                          onSaved: (value){
                            unitAmount=int.tryParse(value!);
                          },
                        ),
                      ),
                    ],
                  ),
                  CustomTextField(
                    labelText: 'experation date',
                    style: Styles.bold19,
                    textInputType:TextInputType.datetime ,
                    onSaved: (value){
                      expMonthes=int.tryParse(value!);
                    },
                  ),
                  Row(
                    children: [
                      CustomCheckBox(
                          onChanged:(value){
                            isFeatured=value;
                          },
                        multipleChoice:false,
                        textLabel: '  is featured',
                        labelTextStyle: Styles.bold19,
                        checkIconColor: Colors.white,
                        selectedBoxColor: Styles.primaryColor,
                        checkBoxHeight: 25,
                        checkBoxWidth: 25,
        
                      ),
                      Spacer(),
                      CustomCheckBox(
                        onChanged:(value){
                          isOrganig=value;
                        },
                        multipleChoice:false,
                        textLabel: '  is organig',
                        labelTextStyle: Styles.bold19,
                        checkIconColor: Colors.white,
                        selectedBoxColor: Styles.primaryColor,
                        checkBoxHeight: 25,
                        checkBoxWidth: 25,
        
                      ),
                    ],
                  ),
                  CustomTextField(
                    labelText: 'description',
                    style: Styles.bold19,
                    maxLines: 5,
                    onSaved: (value){
                      description=value;
                    },
                  ),
                  ImageField(onFileChanged: (File? value) {
                    imageFile=value;
                  },),
                  CustomButton(
                      onPressed: (){
                        if(imageFile != null){//check if image not null
                          if(key.currentState!.validate())// check field not null
                          {
                            key.currentState!.save();

                            ProductEntity productEntity=ProductEntity(
                                name: name!,
                                code: code!,
                                description: description!,
                                isFeatured: isFeatured!,
                                isOrganig: isOrganig!,
                                expMonthes: expMonthes!,
                                numOfCalories: numOfCalories!,
                                unitAmount: unitAmount!,
                                ratingCount: ratingCount!,
                                avgRating: avgRating!,
                                price: price!,
                                imageFile: imageFile!,
                              //  reviews: [],
                                sellingCount:0);

                            BlocProvider.of<AddProductCubit>(context).addProduct(productEntity);
                          }else{
                            autovalidateMode=AutovalidateMode.always;
                          }

                        }else{
                          ScaffoldMessenger.of(context).
                          showSnackBar(const SnackBar(content: Text('please add an image')));
                        }
                      },
                      title: 'Add Product',
                      backgroundColor: Styles.primaryColor,
                      borderRadius: 12,
                      titleStyle: Styles.bold19.copyWith(color: Colors.white)
                  )
        
                ],
              ),
            ),
          ),
        ),
      ),
    );
  },
);
  }
}