import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tap_assignment_sherif/constant/colors.dart';
import 'package:tap_assignment_sherif/utils/dimensions.dart';

class SpinnerDefault extends StatelessWidget {
  const SpinnerDefault({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.heightSize,
      width: AppSize.widthSize,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SpinKitChasingDots(
        color: AppColors.primaryElement,
        size: AppSize.primarySize * 2.3,
      ),
    );
  }
}
