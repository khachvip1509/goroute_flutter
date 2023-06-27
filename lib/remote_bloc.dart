import 'dart:async';

import 'package:bloc_flutter/remote_event.dart';
import 'package:bloc_flutter/remote_state.dart';

class RemoteBloc {
  var state = RemoteState(volume: 70);

  final eventController = StreamController<RemoteEvent>();
  final stateController = StreamController<RemoteState>();

  RemoteBloc() {
    eventController.stream.listen((RemoteEvent event) {
      if (event is IncrementEvent) {
        state = RemoteState(volume: state.volume + event.increment);
      } else if (event is DecrementEvent) {
        state = RemoteState(volume: state.volume - event.decrement);
      } else {
        state = RemoteState(volume: 0);
      }
      stateController.sink.add(state);
    });
  }
  void dispose() {
    stateController.close();
    eventController.close();
  }
}
