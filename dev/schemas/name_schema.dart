import '../../bin/schema.dart';

enum Tags { person, device }
enum Contexts { random, learning, programming }

class NameProperties extends SchemaProperties {
  final Text? name;
  final Text? desc;
  final Number? year;
  final Select<Tags>? tags;
  final MultiSelect<Contexts>? context;

  NameProperties({
    this.name,
    this.desc,
    this.year,
    this.tags,
    this.context,
  });

  @override
  Map<String, dynamic> toMap() {
    // todo the kays belows are the same as Page.propsFromMap!!
    return createMap({
      'name': name,
      'desc': desc,
      'year': year,
      'Tags': tags,
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

  NameSchema(
    Map<String, dynamic> data, {
    required this.name,
    required this.desc,
    required this.year,
    required this.tags,
    required this.context,
  }) : super(data);

  static Map<Tags, String> tagsOptions() => {
        Tags.device: 'device',
        Tags.person: 'person',
      };
  static Map<Contexts, String> contextsOptions() => {
        Contexts.learning: 'learning',
        Contexts.programming: 'programming',
        Contexts.random: 'random'
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
