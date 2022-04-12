import 'package:flutter/material.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/exit_will_pop_scope.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/spinner.dart';

class UnDismissibleSpinner extends StatelessWidget {
  const UnDismissibleSpinner({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Material(
      child: PressBackTwice(child: SpinnerDefault()),
    );
  }
}
