class Logger {
  void write(Object tag, String line, [List parameters]) {
    print('[' + tag.toString() + '] ' + _format(line, parameters));
  }

  String _format(String _format, List parameters) {
    if (parameters == null) return _format;

    for (int i = 0; i < parameters.length; i++) {
      _format = _format.replaceAll('{' + i.toString() + '}', parameters[i].toString());
    }

    return _format;
  }
}