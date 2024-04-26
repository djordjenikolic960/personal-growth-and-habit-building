import 'dart:async';

extension StreamConcatExtension<T> on Stream<T> {
  Stream<T> concat(Stream<T> other) {
    return concatStreams(this, other);
  }

  Stream<T> concatStreams<T>(Stream<T> first, Stream<T> second) {
    StreamController<T> controller = StreamController<T>();

    StreamSubscription<T>? firstSubscription;
    StreamSubscription<T>? secondSubscription;

    firstSubscription = first.listen(
      (data) => controller.add(data),
      onError: (err) => controller.addError(err),
      onDone: () {
        firstSubscription?.cancel();
        secondSubscription = second.listen(
          (data) => controller.add(data),
          onError: (err) => controller.addError(err),
          onDone: () => controller.close(),
        );
      },
    );

    return controller.stream;
  }
}
