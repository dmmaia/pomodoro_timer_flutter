import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro_timer_flutter/timer_store.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  TimerStore store = TimerStore();

  void startTimer() {
    if (store.started) {
      store.timer!.cancel();
    } else {
      const oneSec = const Duration(seconds: 1);
      store.timer = Timer.periodic(
        oneSec,
        (Timer timer) {
          if (store.seconds == 0) {
            setState(() {
              switch (store.timerTable) {
                case "pomodoro":
                  if (store.breakCount == 4) {
                    changeTimerByTab("long_break");
                  } else {
                    changeTimerByTab("short_break");
                    store.breakCount++;
                  }
                  break;
                case "short_break":
                  changeTimerByTab("pomodoro");
                  break;
                case "long_break":
                  changeTimerByTab("pomodoro");
                  store.breakCount = 0;

                  break;
                default:
              }
            });
          } else {
            setState(() {
              store.seconds--;
            });
          }
        },
      );
    }
    store.started = !store.started;
  }

  formatedTime(int timeInSecond) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute:$second";
  }

  changeTimerByTab(String tab) {
    setState(() {
      store.timerTable = tab;
    });
    switch (store.timerTable) {
      case "pomodoro":
        setState(() {
          store.seconds = 1500;
        });
        break;
      case "short_break":
        setState(() {
          store.seconds = 300;
        });
        break;
      case "long_break":
        setState(() {
          store.seconds = 900;
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      margin: EdgeInsets.only(top: 20),
      height: 300,
      decoration: BoxDecoration(
        color: Colors.red[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    if (store.timerTable != "pomodoro") {
                      if (store.timer != null) store.timer!.cancel();
                      store.started = false;
                      changeTimerByTab("pomodoro");
                    }
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  decoration: BoxDecoration(
                    color: store.timerTable == "pomodoro"
                        ? Colors.red[900]
                        : Colors.red.shade300,
                    border: store.timerTable == "pomodoro"
                        ? Border(
                            right: BorderSide(color: Colors.white),
                            top: BorderSide(color: Colors.white),
                            left: BorderSide(color: Colors.white))
                        : Border(),
                  ),
                  child: Text(
                    "Pomodoro",
                    style: TextStyle(
                        fontSize: 20,
                        color: store.timerTable == "pomodoro"
                            ? Colors.white
                            : Colors.red[900]),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    if (store.timerTable != "short_break") {
                      if (store.timer != null) store.timer!.cancel();
                      store.started = false;
                      changeTimerByTab("short_break");
                    }
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                  padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  decoration: BoxDecoration(
                    color: store.timerTable == "short_break"
                        ? Colors.red[900]
                        : Colors.red.shade300,
                    border: store.timerTable == "short_break"
                        ? Border(
                            right: BorderSide(color: Colors.white),
                            top: BorderSide(color: Colors.white),
                            left: BorderSide(color: Colors.white))
                        : Border(),
                  ),
                  child: Text(
                    "Short Break",
                    style: TextStyle(
                        fontSize: 20,
                        color: store.timerTable == "short_break"
                            ? Colors.white
                            : Colors.red[900]),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    if (store.timerTable != "long_break") {
                      if (store.timer != null) store.timer!.cancel();
                      store.started = false;
                      changeTimerByTab("long_break");
                    }
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  decoration: BoxDecoration(
                    color: store.timerTable == "long_break"
                        ? Colors.red[900]
                        : Colors.red.shade300,
                    border: store.timerTable == "long_break"
                        ? Border(
                            right: BorderSide(color: Colors.white),
                            top: BorderSide(color: Colors.white),
                            left: BorderSide(color: Colors.white))
                        : Border(),
                  ),
                  child: Text(
                    "Long Break",
                    style: TextStyle(
                        fontSize: 20,
                        color: store.timerTable == "long_break"
                            ? Colors.white
                            : Colors.red[900]),
                  ),
                ),
              )
            ],
          ),
          Text(
            formatedTime(store.seconds),
            style: TextStyle(fontSize: 100, color: Colors.white),
          ),
          InkWell(
            onTap: () {
              setState(() {
                startTimer();
              });
            },
            child: store.started
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.red[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsetsDirectional.fromSTEB(30, 15, 30, 15),
                    child: Text(
                      "Pause",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsetsDirectional.fromSTEB(30, 15, 30, 15),
                    child: Text(
                      "Start",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.red[800],
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
