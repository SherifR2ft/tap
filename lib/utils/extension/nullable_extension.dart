extension NullableString on String {
  bool isNotEmptyOrNull() {
    return this == '' || trim() == '' || this == 'null' ? false : true;
  }
}

extension NullableEmptyString on String? {
  bool isNotEmptyOrNull() {
    return this == null || this == '' || this?.trim() == '' || this == 'null'
        ? false
        : true;
  }
}
