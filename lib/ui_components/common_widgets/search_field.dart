import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tap_assignment_sherif/constant/constant_values.dart';
import 'package:tap_assignment_sherif/utils/dimensions.dart';
import 'package:tap_assignment_sherif/utils/localizations.dart';
import 'package:tap_assignment_sherif/utils/extension/nullable_extension.dart';
import 'package:tap_assignment_sherif/utils/unfocus_keyboard.dart';
import 'package:tap_assignment_sherif/utils/extension/app_theme_mode.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    Key? key,
    required this.searchTextController,
    required this.onSearching,
    this.hint,
  }) : super(key: key);
  final TextEditingController searchTextController;
  final Function() onSearching;
  final String? hint;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  Timer? searchOnStoppedTyping;

  var hasTyped = false;

  final duration = const Duration(milliseconds: 1200);

  _onChangeHandler() {
    if (widget.searchTextController.text.isNotEmptyOrNull() || hasTyped) {
      hasTyped = true;
      // set the duration that you want call search() after that.
      if (searchOnStoppedTyping != null) {
        searchOnStoppedTyping!.cancel();
      } // clear timer

      searchOnStoppedTyping = Timer(duration, () => widget.onSearching());
    }
  }

  @override
  void initState() {
    /// addListener to Text Controller
    widget.searchTextController.addListener(_onChangeHandler);
    super.initState();
  }

  @override
  void dispose() {
    widget.searchTextController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: MediaQuery.of(context).platformBrightness.isLightMode()
          ? Constants.primaryContainerBoxDecoration
          : Constants.primaryDarkContainerBoxDecoration,
      margin:
          const EdgeInsets.symmetric(horizontal: Constants.horizontalPadding),
      child: TextFormField(
        controller: widget.searchTextController,
        textAlign: TextAlign.start,
        onFieldSubmitted: (text) {
          unFocusKeyboard(context);
          widget.onSearching();
        },
        decoration: InputDecoration(
          fillColor: Theme.of(context).backgroundColor,
          filled: true,
          suffixIcon: Icon(
            Icons.search,
            color: Theme.of(context).iconTheme.color,
          ),
          hintText: widget.hint ?? AppLocalization.myLocal.search,
          hintStyle: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(fontSize: AppSize.textFieldSize),
          errorStyle: TextStyle(fontSize: AppSize.hintFieldSize),
          contentPadding: const EdgeInsets.all(10),
          border: Constants.textFieldBorder,
          enabledBorder: Constants.enabledBorderSearch,
          focusedBorder: Constants.focusedBorder,
        ),
        style: Theme.of(context)
            .textTheme
            .headline2
            ?.copyWith(fontSize: AppSize.textFieldSize),
        maxLines: 1,
        autocorrect: false,
      ),
    );
  }
}
