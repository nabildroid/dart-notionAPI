import '../../bin/schema.dart';

enum Status { pending, done, progress }
enum Type { coding, design, writing }

class PomodoroProperties extends SchemaProperties {
  final String? name;
  final CheckBox? done;
  final Select<Status>? status;
  final Select<Type>? type;

  PomodoroProperties({
    this.name,
    this.done,
    this.status,
    this.type,
  });

  @override
  Map<String, dynamic> toMap() {
    // optionls proprties
    return createMap({
      'name': name,
      'done': done,
      'status': status,
      'type': type,
    });
  }
}

class PomodoroSchema extends Schema implements PomodoroProperties {
  // forced properties unlike the optional properties of PomodoroProperties
  @override
  final String name;
  @override
  final CheckBox done;
  @override
  final Select<Status> status;
  @override
  final Select<Type> type;

  PomodoroSchema(
    Map<String, dynamic> data, {
    required this.done,
    required this.name,
    required this.type,
    required this.status,
  }) : super(data);

  static Map<Status, String> statusOptions() => {
        Status.done: 'done',
        Status.pending: 'pending',
        Status.progress: 'progress',
      };
  static Map<Type, String> typeOptions() => {
        Type.coding: 'coding',
        Type.design: 'desgin',
        Type.writing: 'writing',
      };

  @override
  Map<String, dynamic> toMap() {
    // returns all properties
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> createMap(Map<String, dynamic> props) {
    // TODO: implement createJson
    throw UnimplementedError();
  }
}
