import '../../bin/schema.dart';

enum Tags { person, device, DEFAULT }
enum Contexts { random, learning, programming, DEFAULT }

class NameProperties extends SchemaProperties {
  final Text? name;
  final Text? desc;
  final Number? year;
  final Select<Tags>? tags;
  final MultiSelect<Contexts>? context;
  final CheckBox? done;

  NameProperties({
    this.name,
    this.desc,
    this.year,
    this.tags,
    this.context,
    this.done,
  });

  // todo Dart's fault not mine
  NameProperties.fromValues({
    String? name,
    String? desc,
    double? year,
    Tags? tags,
    List<Contexts>? context,
    bool? done,
  })  : name = name != null ? Text(name, isTitle: true) : null,
        desc = desc != null ? Text(desc) : null,
        year = year != null ? Number(year) : null,
        tags = tags != null
            ? Select(tags, option: NameSchema.tagsOptions())
            : null,
        context = context != null
            ? MultiSelect(context, option: NameSchema.contextsOptions())
            : null,
        done = done != null ? CheckBox(done) : null;

  @override
  Map<String, dynamic> toMap() {
    // todo the keys below are the same as Page.propsFromMap!!
    return createMap({
      'name': name,
      'desc': desc,
      'year': year,
      'Tags': tags,
      'done': done,
      'context': context,
    });
  }
}

class NameSchema extends Schema implements NameProperties {
  @override
  final Text name;
  @override
  final Text desc;
  @override
  final Number year;
  @override
  final Select<Tags> tags;
  @override
  final MultiSelect<Contexts> context;
  @override
  final CheckBox done;

  NameSchema(
    Map<String, dynamic> data, {
    required this.name,
    required this.desc,
    required this.year,
    required this.tags,
    required this.context,
    required this.done,
  }) : super(data);

  static Map<Tags, String> tagsOptions() => {
        Tags.device: 'device',
        Tags.person: 'person',
        Tags.DEFAULT: '',
      };
  static Map<Contexts, String> contextsOptions() => {
        Contexts.learning: 'learning',
        Contexts.programming: 'programming',
        Contexts.random: 'random',
        Contexts.DEFAULT: '',
      };

  @override
  Map<String, dynamic> createMap(Map<String, dynamic> props) {
    // TODO: implement createMap
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
