import 'package:flutter/material.dart';
import 'package:pomodoro_timer_flutter/timer_store.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  TimerStore store = TimerStore();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      margin: EdgeInsets.only(top: 20),
      height: 300,
      decoration: BoxDecoration(
        color: Colors.green[900],
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
                    store.timerTable = "pomodoro";
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  decoration: BoxDecoration(
                    color: store.timerTable == "pomodoro"
                        ? Colors.green[900]
                        : Colors.green.shade300,
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
                            : Colors.green[900]),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    store.timerTable = "short_break";
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                  padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  decoration: BoxDecoration(
                    color: store.timerTable == "short_break"
                        ? Colors.green[900]
                        : Colors.green.shade300,
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
                            : Colors.green[900]),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    store.timerTable = "long_break";
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  decoration: BoxDecoration(
                    color: store.timerTable == "long_break"
                        ? Colors.green[900]
                        : Colors.green.shade300,
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
                            : Colors.green[900]),
                  ),
                ),
              )
            ],
          ),
          Text(
            "25:00",
            style: TextStyle(fontSize: 100, color: Colors.white),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsetsDirectional.fromSTEB(30, 15, 30, 15),
              child: Text(
                "Start",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.green[800],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
