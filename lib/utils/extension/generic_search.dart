extension GenericSearch<E> on Map {
  // for non nested object
  bool genericSearch(String searchKeyWord) {
    try {
      return values.toString().contains(searchKeyWord.trim());
    } catch (e) {
      return false;
    }
  }
}
