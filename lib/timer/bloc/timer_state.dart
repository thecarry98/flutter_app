/*
5 state
1: TimerInitial: (icon:play_arrow)
2: TimerRunPause: (icon: [play_arrow, replay])
3: TimerRunInProgress: (icon: [pause, replay])
4: TimerRunComplete: (icon: [replay])

 */
part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  const TimerState(this.duration);

  final int duration;

  @override
  List<Object> get props => [duration];
}

class TimerInitial extends TimerState {
  const TimerInitial(super.duration);
}

class TimerRunPause extends TimerState {
  const TimerRunPause(super.duration);
}

class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.duration);
}

class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}
