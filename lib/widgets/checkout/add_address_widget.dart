import 'package:ecommerce/widgets/custom_text-Field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_text.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomText(
                text: 'Billing address is the same as delivery address',
                alignment: Alignment.center,
                fontSize: 15.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              CustomText(
                text: 'Street 1',
                alignment: Alignment.topLeft,
                fontSize: 14.0,
              ),
              CustomTextField(
                hint: '21, Alex Davidson Avenue',
                keyboard: TextInputType.text,
                obsecure: false,
                onSaved: (value) {},
                validator: (value) {},
              ),
              SizedBox(
                height: 10.0,
              ),
              CustomText(
                text: 'Street 2',
                alignment: Alignment.topLeft,
                fontSize: 14.0,
              ),
              CustomTextField(
                hint: 'Opposite Omegatron, Vicent Quarters',
                keyboard: TextInputType.text,
                obsecure: false,
                onSaved: (value) {},
                validator: (value) {},
              ),
              SizedBox(
                height: 10.0,
              ),
              CustomText(
                text: 'City',
                alignment: Alignment.topLeft,
                fontSize: 14.0,
              ),
              CustomTextField(
                hint: 'Victoria Island',
                keyboard: TextInputType.text,
                obsecure: false,
                onSaved: (value) {},
                validator: (value) {},
              ),
              Container(
                padding: EdgeInsets.only(top: 35.0),
                width: Get.width,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          CustomText(
                            text: 'State',
                            alignment: Alignment.topLeft,
                            fontSize: 14.0,
                          ),
                          CustomTextField(
                            hint: 'Lagos State',
                            keyboard: TextInputType.text,
                            obsecure: false,
                            onSaved: (value) {},
                            validator: (value) {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 60.0,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          CustomText(
                            text: 'Country',
                            alignment: Alignment.topLeft,
                            fontSize: 14.0,
                          ),
                          CustomTextField(
                            hint: 'Nigeria',
                            keyboard: TextInputType.text,
                            obsecure: false,
                            onSaved: (value) {},
                            validator: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
