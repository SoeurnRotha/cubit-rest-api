
import 'dart:convert';

Todod tododFromJson(String str) => Todod.fromJson(json.decode(str));

String tododToJson(Todod data) => json.encode(data.toJson());

class Todod {
  List<Todo> todos;
  int total;
  int skip;
  int limit;

  Todod({
    required this.todos,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory Todod.fromJson(Map<String, dynamic> json) => Todod(
    todos: List<Todo>.from(json["todos"].map((x) => Todo.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "todos": List<dynamic>.from(todos.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class Todo {
  int id;
  String todo;
  bool completed;
  int userId;

  Todo({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json["id"],
    todo: json["todo"],
    completed: json["completed"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "todo": todo,
    "completed": completed,
    "userId": userId,
  };
}
