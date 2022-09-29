import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/timer/timer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ticker.dart';
import '../cubit/timer_cubit.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerCubit(ticker: const Ticker()),
      child: TimerView(),
    );
  }
}

class TimerView extends StatelessWidget {
  // const TimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 100),
            child: Center(
              child: TimerText(),
            ),
          ),
          Actions(),
        ],
      ),
    );
  }
}

class TimerText extends StatelessWidget {
  const TimerText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final duration = context.watch<TimerCubit>().state.duration;
    final minutesStr =
        ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).toString().padLeft(2, '0');

    return Text(
      '$minutesStr : $secondsStr',
      style: const TextStyle(
        fontSize: 40,
        color: Colors.red,
      ),
    );
  }
}

class Actions extends StatelessWidget {
  const Actions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          if (state is TimerInitial) ...[
            FloatingActionButton(
                child: Icon(Icons.play_arrow),
                onPressed: () => context.read<TimerCubit>().onStarted()
                // .add(TimerStarted(duration: state.duration)),
                ),
          ],
          if (state is TimerRunInProgress) ...[
            FloatingActionButton(
              child: Icon(Icons.pause),
              onPressed: () => context.read<TimerCubit>().onPaused(),
              // .add(TimerPaused(duration: state.duration)),
            ),
            FloatingActionButton(
              child: Icon(Icons.replay),
              onPressed: () => context.read<TimerCubit>().onReset(),
              // .add(TimerReset(duration: state.duration)),
            ),
          ],
          if (state is TimerRunPause) ...[
            FloatingActionButton(
                child: Icon(Icons.play_arrow),
                onPressed: () => context.read<TimerCubit>().onResumed()
                // .add(TimerResumed(duration: state.duration)),
                ),
            FloatingActionButton(
                child: Icon(Icons.replay),
                onPressed: () => context.read<TimerCubit>().onReset()
                // .add(TimerReset(duration: state.duration)),
                ),
          ],
          if (state is TimerRunComplete) ...[
            FloatingActionButton(
              child: Icon(Icons.replay),
              onPressed: () => context.read<TimerCubit>().onReset(),
              // .add(TimerReset(duration: state.duration)),
            ),
          ],
        ]);
      },
    );
  }
}
