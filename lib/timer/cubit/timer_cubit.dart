import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ticker.dart';
import '../timer.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit({required Ticker ticker})
      : _ticker = ticker,
        super(TimerInitial(_duration));
  final Ticker _ticker;
  static const int _duration = 60;
  StreamSubscription<int>? _tickerSubscription;

  Future<void> onStarted() async {
    emit(TimerRunInProgress(state.duration));
    _tickerSubscription?.cancel();

    _tickerSubscription =
        _ticker.tick(ticks: state.duration).listen((event) => onTicked(event));
  }

  Future<void> onPaused() async {
    if (state is TimerRunInProgress) {
      _tickerSubscription?.pause();
      emit(TimerRunPause(state.duration));
    }
  }

  Future<void> onResumed() async {
    if (state is TimerRunPause) {
      _tickerSubscription?.resume();
      emit(TimerRunInProgress(state.duration));
    }
  }

  Future<void> onReset() async {
    _tickerSubscription?.cancel();
    emit(const TimerInitial(_duration));
  }

  Future<void> onTicked(int duration) async {
    emit(
      duration > 0 ? TimerRunInProgress(duration) : const TimerRunComplete(),
    );
  }
  //comment cubit
}
