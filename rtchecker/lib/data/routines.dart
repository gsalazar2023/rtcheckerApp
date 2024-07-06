class Task {
  String taskName;
  bool status;

  Task({required this.taskName, required this.status});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      taskName: json['task name'],
      status: json['status'],
    );
  }
}

class Routine {
  int id;
  String gameName;
  String name;
  String difficulty;
  String description;
  String objective;
  List<Task> tasks;
  String results;

  Routine({
    required this.id,
    required this.gameName,
    required this.name,
    required this.difficulty,
    required this.description,
    required this.objective,
    required this.tasks,
    required this.results,
  });

  factory Routine.fromJson(Map<String, dynamic> json) {
    var tasksList = json['tasks'] as List;
    List<Task> tasks =
        tasksList.map((taskJson) => Task.fromJson(taskJson)).toList();

    return Routine(
      id: json['id'],
      gameName: json['game name'],
      name: json['name'],
      difficulty: json['difficulty'],
      description: json['description'],
      objective: json['objective'],
      tasks: tasks,
      results: json['results'],
    );
  }
}
