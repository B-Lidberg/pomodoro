import 'package:equatable/equatable.dart';
import 'package:pomodoro/models/pomodoro_type.dart';

class Pomodoro extends Equatable {
  const Pomodoro({
      required this.taskType,
      this.description = '',
  });

  final PomodoroType taskType;
  final String description;

  @override
  List<Object> get props => [
    description,
  ];
}