/*
Events: 
TimerStarted: has duration
TimerPaused: no duration
TimerResumed: no duration
TimerReset: no duration
TimerTicketd: has duration
 */

part of 'timer_bloc.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class TimerStarted extends TimerEvent {
  const TimerStarted({required this.duration});
  final int duration;
}

class TimerPaused extends TimerEvent {
  const TimerPaused({required int duration});
}

class TimerResumed extends TimerEvent {
  const TimerResumed({required int duration});
}

class TimerReset extends TimerEvent {
  const TimerReset({required int duration});
}

class TimerTicked extends TimerEvent {
  const TimerTicked({required this.duration});
  final int duration;
  @override
  // TODO: implement props
  List<Object> get props => [duration];
}
