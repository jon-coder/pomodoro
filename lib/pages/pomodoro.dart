import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../store/store.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Timer(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Observer(
              builder: (context) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TimeIn(
                    title: 'Work',
                    value: store.workTime,
                    dec: store.isRunning && store.isWorking() ? null : store.decrementWorkTimer,
                    inc: store.isRunning && store.isWorking() ? null : store.incrementWorkTimer,
                  ),
                  TimeIn(
                    title: 'Rest',
                    value: store.restTime,
                    dec: store.isRunning && store.isResting() ? null : store.decrementRestTimer,
                    inc: store.isRunning && store.isResting() ? null : store.incrementRestTimer,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
