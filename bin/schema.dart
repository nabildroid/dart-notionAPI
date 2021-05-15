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

  const Record(this.value);

  dynamic toMap();
}

class Text implements Record<String> {
  @override
  final String value;
  final bool isTitle;
  const Text(this.value, {this.isTitle = false});

  factory Text.fromData(
    Map<String, dynamic> data, {
    required String key,
    bool isTitle = false,
  }) {
    final indicator = isTitle ? 'title' : 'text';
    final texts = data['properties'][key][indicator] as List<dynamic>;
    final text = texts.fold<String>(
        '',
        (previousValue, element) =>
            previousValue + ' ' + element['plain_text']);
    return Text(text.trim(), isTitle: isTitle);
  }

  @override
  Map<String, dynamic> toMap() {
    final m = {
      'text': [
        {
          'type': 'text',
          'text': {'content': value}
        }
      ]
    };
    if (isTitle) {
      return {'title': m};
    } else {
      return m;
    }
  }
}

class Number implements Record<double> {
  @override
  final double value;

  const Number(this.value);

  factory Number.fromData(
    Map<String, dynamic> data, {
    required String key,
  }) {
    final n = data['properties'][key]['number'];

    return Number(double.parse(n.toString()));
  }

  @override
  Map<String, dynamic> toMap() {
    return {'number': value.toString()};
  }
}

class CheckBox implements Record<bool> {
  @override
  final bool value;

  const CheckBox(this.value);

  factory CheckBox.fromData(
    Map<String, dynamic> data, {
    required String key,
  }) {
    final check = data['properties'][key]['checkbox'] as bool;
    return CheckBox(check);
  }

  @override
  Map<String, dynamic> toMap() {
    return {'checkbox': value};
  }
}

T _findKeyFromValue<T>(Map<T, String> options, String value) {
  final item = options.entries.firstWhere(
    (element) => (element.value == value),
    orElse: () {
      // todo better error handling
      throw ('value "$value" doesn\'t exists in the options $options');
    },
  );

  return item.key;
}

class Select<T> implements Record<T> {
  @override
  final T value;

  // todo rename it to option->s<-
  final Map<T, String> option;

  const Select(this.value, {this.option = const {}});

  factory Select.fromData(
    Map<String, dynamic> data, {
    required String key,
    required Map<T, String> option,
  }) {
    final name = data['properties'][key]['select']['name'];
    final value = _findKeyFromValue(option, name);
    return Select(value, option: option);
  }

  @override
  Map<String, dynamic> toMap() {
    final value = option[this.value];

    return {
      'select': {'name': value}
    };
  }
}

class MultiSelect<T> implements Record<List<T>> {
  @override
  final List<T> value;

  // todo rename it to option->s<-
  final Map<T, String> option;

  const MultiSelect(this.value, {this.option = const {}});

  factory MultiSelect.fromData(
    Map<String, dynamic> data, {
    required String key,
    required Map<T, String> option,
  }) {
    final names = data['properties'][key]['multi_select'] as List<dynamic>;
    final valuesStr = names.map<String>((e) => e['name']).toList();
    final values =
        valuesStr.map<T>((e) => _findKeyFromValue(option, e)).toList();
    return MultiSelect(values, option: option);
  }

  @override
  Map<String, dynamic> toMap() {
    final values = value.map((key) => {'name': option[key]}).toList();

    return {'multi_select': values};
  }
}
