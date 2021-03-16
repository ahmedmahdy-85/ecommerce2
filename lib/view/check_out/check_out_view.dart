import 'package:ecommerce/viewModel/checkout_view_model.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/helper/constants.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';
import 'package:ecommerce/widgets/checkout/add_address_widget.dart';
import 'package:ecommerce/widgets/checkout/summary_widget.dart';
import 'package:ecommerce/widgets/checkout/delivery_time_widget.dart';
import 'package:ecommerce/helper/enum.dart';

class CheckOutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(
      init: CheckoutViewModel(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 45.0,
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "CheckOut",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 100,
              child: StatusChange.tileBuilder(
                theme: StatusChangeThemeData(
                  direction: Axis.horizontal,
                  connectorTheme:
                      ConnectorThemeData(space: 1.0, thickness: 1.0),
                ),
                builder: StatusChangeTileBuilder.connected(
                  itemWidth: (_) =>
                      MediaQuery.of(context).size.width / _processes.length,
                  nameWidgetBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        _processes[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: controller.getColor(index),
                        ),
                      ),
                    );
                  },
                  indicatorWidgetBuilder: (_, index) {
                    if (index <= controller.index) {
                      return DotIndicator(
                        size: 35.0,
                        border: Border.all(color: Colors.green, width: 1),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return OutlinedDotIndicator(
                        size: 30,
                        borderWidth: 1.0,
                        color: todoColor,
                      );
                    }
                  },
                  lineWidgetBuilder: (index) {
                    if (index > 0) {
                      if (index == controller.index) {
                        final prevColor = controller.getColor(index - 1);
                        final color = controller.getColor(index);
                        var gradientColors;
                        gradientColors = [
                          prevColor,
                          Color.lerp(prevColor, color, 0.5)
                        ];
                        return DecoratedLineConnector(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: gradientColors,
                            ),
                          ),
                        );
                      } else {
                        return SolidLineConnector(
                          color: controller.getColor(index),
                        );
                      }
                    } else {
                      return null;
                    }
                  },
                  itemCount: _processes.length,
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            controller.pages == Pages.DeliveryTime
                ? DeliveryTime()
                : controller.pages == Pages.AddAddress
                    ? AddAddress()
                    : Summary(),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomButton(
                  text: 'Next',
                  onPressed: () {
                    controller.changeIndex(controller.index + 1);
                  },
                  width: 160.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final _processes = [
  'Delivery',
  'Address',
  'Summary',
];
