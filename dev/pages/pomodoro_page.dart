import 'package:meta/meta.dart';
import 'package:dartNotionAPI/dart-notionAPI.dart';

import '../schemas/pomodoro_schema.dart';

class PomodoroPage extends Page<PomodoroSchema> {
  PomodoroPage(IClient client, String id)
      : super(
          client: client,
          id: id,
        );

  @override
  @protected
  PomodoroSchema propsFromMap(Map<String, dynamic> data) => PomodoroSchema(
        data,
        done: CheckBox.fromData(data, key: 'done'),
        name: data['name'],
        //
        status: Select(
          data['status'],
          option: PomodoroSchema.statusOptions(),
        ),
        type: Select(
          data['type'],
          option: PomodoroSchema.typeOptions(),
        ),
      );
}
