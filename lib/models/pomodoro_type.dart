
enum PomodoroType {
  work, researchAndDevelopment, leisure, reading, languageLearning, sideProjects
}

extension TaskTypeExtension on PomodoroType {
  String get type {
    switch (this) {
      case PomodoroType.work:
        return 'Work';
      case PomodoroType.researchAndDevelopment:
        return 'Research & Development';
      case PomodoroType.leisure:
        return 'Leisure';
      case PomodoroType.reading:
        return 'Reading';
      case PomodoroType.languageLearning:
        return 'Language Learning';
      case PomodoroType.sideProjects:
        return 'Side Projects';
    }
  }
}