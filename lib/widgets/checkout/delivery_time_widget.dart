import 'package:ecommerce/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/helper/enum.dart';

class DeliveryTime extends StatefulWidget {
  @override
  _DeliveryTimeState createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery delivery = Delivery.StandardDelivery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          RadioListTile<Delivery>(
            value: Delivery.StandardDelivery,
            groupValue: delivery,
            onChanged: (Delivery value) {
              setState(() {
                delivery = value;
              });
            },
            title: CustomText(
              text: 'Standard Delivery',
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
            ),
            subtitle: CustomText(
              text: '\nOrder will be delivered between 3 - 5 business days',
              fontSize: 14.0,
            ),
            activeColor: Colors.green,
          ),
          SizedBox(
            height: 30.0,
          ),
          RadioListTile<Delivery>(
            value: Delivery.NextDayDelivery,
            groupValue: delivery,
            onChanged: (Delivery value) {
              setState(() {
                delivery = value;
              });
            },
            title: CustomText(
              text: 'Next Day Delivery',
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
            ),
            subtitle: CustomText(
              text: '\nPlace your order before 6pm and your '
                  'items will be delivered the next day',
              fontSize: 14.0,
            ),
            activeColor: Colors.green,
          ),
          SizedBox(
            height: 30.0,
          ),
          RadioListTile<Delivery>(
            value: Delivery.NominatedDelivery,
            groupValue: delivery,
            onChanged: (Delivery value) {
              setState(() {
                delivery = value;
              });
            },
            title: CustomText(
              text: 'Nominated Delivery',
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
            ),
            subtitle: CustomText(
              text: '\nPick a particular date '
                  'from the calendar and order will be delivered on selected date',
              fontSize: 14.0,
            ),
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
