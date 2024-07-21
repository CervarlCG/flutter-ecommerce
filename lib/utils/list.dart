Iterable<T> mapWithIndex<T>(List list, T Function(dynamic, int) toElement) {
  int index = 0;
  return list.map((item) {
    return toElement(item, index++);
  });
}
