import 'package:flutter/material.dart';
import 'package:tap_assignment_sherif/constant/constant_values.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/primary_button.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.title,
    required this.func,
  }) : super(key: key);
  final String title;
  final Function() func;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(Constants.horizontalPadding),
          child: PrimaryButton(
            title: title,
            func: func,
          ),
        ),
      ),
    );
  }
}
