import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../store/store.dart';

class Timer extends StatelessWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Observer(
      builder: (context) => Container(
        color: store.isWorking() ? Colors.red : Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              store.isWorking() ? 'Time to work!' : 'Time to rest :)',
              style: GoogleFonts.oxygen(
                fontSize: 48,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '${store.minutes.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2, '0')}',
              style: GoogleFonts.oxygen(
                fontSize: 120,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!store.isRunning)
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: TimerButton(
                      title: 'START',
                      icon: Icons.play_arrow,
                      action: store.startTimer,
                    ),
                  ),
                if (store.isRunning)
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: TimerButton(
                      title: 'STOP',
                      icon: Icons.stop,
                      action: store.stopTimer,
                    ),
                  ),
                TimerButton(
                  title: 'REFRESH',
                  icon: Icons.refresh,
                  action: store.refreshTimer,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
