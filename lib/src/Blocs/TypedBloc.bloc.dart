import 'dart:async';
import 'package:rxdart/rxdart.dart';

class Bloc<T> {
  final _controller = BehaviorSubject<T>();
  final StreamTransformer<T, T> validator;

  final T init;

  Bloc({this.validator, this.init}) {
    this.sink(init);
  }

  Stream<T> get stream => validator != null
      ? _controller.stream.transform(validator)
      : _controller.stream;
  Function(T) get sink => _controller.sink.add;
  T get value => _controller.value;

  dispose() {
    _controller?.close();
  }
}
