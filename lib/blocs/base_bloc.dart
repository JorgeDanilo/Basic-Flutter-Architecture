import 'dart:async';

class BaseBloc<T> {
  final _stremController = StreamController<T>();
  get strema => _stremController.stream;

  void add(T object) {
    _stremController.add(object);
  }

  void addError(Object object) {
    _stremController.addError(object);
  }

  void close() {
    _stremController.close();
  }
}