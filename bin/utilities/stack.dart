class Stack<T> {
  int _currentIndex;
  List<T> _list;

  int get Count 
  {
    return _list.length - _currentIndex;
  }

  Stack() {
    _list = new List<T>();
    _currentIndex = 0;
  }

  void push(T obj) {
    _list.add(obj);
  }

  T pop() {
    if (_list.length == 0 || _currentIndex - _list.length == 1) {
      return null;
    }
    
    T value = _list[_currentIndex++];
    _list[_currentIndex-1] = null;
    return value;
  }
}