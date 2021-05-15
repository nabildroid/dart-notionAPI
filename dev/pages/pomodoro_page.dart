import 'package:meta/meta.dart';

import '../../bin/page.dart';
import '../../bin/client.dart';
import '../../bin/schema.dart';
import '../schemas/pomodoro_schema.dart';

class PomodoroPage extends Page<PomodoroSchema> {
  PomodoroPage(Client client, String id)
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
