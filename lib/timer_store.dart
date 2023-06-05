import 'dart:async';

import 'package:mobx/mobx.dart';

part 'timer_store.g.dart';

class TimerStore = _TimerStoreBase with _$TimerStore;

abstract class _TimerStoreBase with Store {
  _TimerStoreBase() {}

  @observable
  String timerTable = "pomodoro";

  @observable
  bool started = false;

  @observable
  int seconds = 1500;

  @observable
  Timer? timer;

  @observable
  int breakCount = 0;
}
