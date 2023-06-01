import 'package:mobx/mobx.dart';

part 'timer_store.g.dart';

class TimerStore = _TimerStoreBase with _$TimerStore;

abstract class _TimerStoreBase with Store {
  _TimerStoreBase() {}

  @observable
  String timerTable = "pomodoro";
}
