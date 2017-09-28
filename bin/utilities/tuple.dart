class Tuple<T1, T2> {
  T1 _item1;
  T2 _item2;

  T1 get Item1 {
    return _item1;
  }

  void set Item1(T1 item1) {
    _item1 = item1;
  }

  T2 get Item2 {
    return _item2;
  }

  void set Item2(T2 item2) {
    _item2 = item2;
  }

  Tuple(T1 item1, T2 item2) {
    _item1 = item1;
    _item2 = item2;
  }
}