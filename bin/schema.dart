import 'package:meta/meta.dart';

class Schema {
  final String id;
  final DateTime created;
  final DateTime updated;

  Schema(Map<String, dynamic> data)
      : id = data['id'],
        created = DateTime.parse(data['created_time']),
        updated = DateTime.parse(data['last_edited_time']);
}

/// helps to update some properties in pages
/// used in the ```page.setProps(SchemaProperties props)```
abstract class SchemaProperties {
  Map<String, dynamic> toMap();

  @protected
  Map<String, dynamic> createMap(Map<String, dynamic> props) {
    var data = <String, dynamic>{};

    // todo all properties of the schema must be an instance of Record
    props.forEach((key, value) {
      if (value != null) {
        if (value is Record) {
          data[key] = value.toMap();
        } else {
          data[key] = value;
        }
      }
    });

    return data;
  }
}

// todo the value must be private and use getter to get it
abstract class Record<T> {
  final T value;

  Record(this.value);

  dynamic toMap();

  static void test() {}
}

class Text implements Record<String> {
  @override
  final String value;

  Text(this.value);

  factory Text.fromData(
    Map<String, dynamic> data, {
    required String key,
  }) {
    final texts = data['properties'][key] as List<dynamic>;
    final text = texts.fold<String>(
        '', (previousValue, element) => previousValue + ' ' + element['text']);
    return Text(text);
  }

  @override
  List<Map<String, dynamic>> toMap() {
    return [
      {
        'text': value,
        'annotations': {'formatting': [], 'color': 'default', 'link': null},
        'inline_object': null
      }
    ];
  }
}

void main() {}

class Select<T> implements Record<T> {
  @override
  final T value;

  // todo rename it to option->s<-
  final Map<T, String> option;

  Select(this.value, {this.option = const {}});

  factory Select.fromData(
    Map<String, dynamic> data, {
    required String key,
    required Map<T, String> option,
  }) {
    final name = data['properties'][key]['name'];
    return Select(name, option: option);
  }

  String select(T key) {
    if (option[key] != null) {
      return option[key] as String;
    } else {
      throw ('Invalide Select key');
    }
  }

  @override
  Map<String, dynamic> toMap() {
    final value = option[this.value];

    return {
      'select': {'name': value}
    };
  }
}
