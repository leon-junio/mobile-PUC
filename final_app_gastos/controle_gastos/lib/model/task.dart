class Task {
  int id;
  String name;
  bool completed;
  DateTime date;
  Task(this.id, this.name, this.completed, this.date);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'completed': completed ? 1 : 0,
      'date': date.toString()
    };
  }

  Map<String, dynamic> toInsertion() {
    return {
      'name': name,
      'completed': completed ? 1 : 0,
      'date': date.toString()
    };
  }
}
