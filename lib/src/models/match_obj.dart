import 'package:robotevents/src/models/models.dart';

class MatchObj {
  int id;
  IdInfo event;
  IdInfo division;
  int round;
  int instance;
  int matchnum;
  DateTime? scheduled;
  DateTime? started;
  String? field;
  bool scored;
  String name;
  List<Alliance> alliances;

  MatchObj({
    required this.id,
    required this.event,
    required this.division,
    required this.round,
    required this.instance,
    required this.matchnum,
    required this.scheduled,
    required this.started,
    required this.field,
    required this.scored,
    required this.name,
    required this.alliances,
  });

  factory MatchObj.fromJson(Map<String, dynamic> json) {
    return MatchObj(
      id: json['id'],
      event: IdInfo.fromJson(json['event']),
      division: IdInfo.fromJson(json['division']),
      round: json['round'],
      instance: json['instance'],
      matchnum: json['matchnum'],
      scheduled:
          json['scheduled'] != null ? DateTime.parse(json['scheduled']) : null,
      started: json['started'] != null ? DateTime.parse(json['started']) : null,
      field: json['field'],
      scored: json['scored'],
      name: json['name'],
      alliances: (json['alliances'] as List)
          .map((alliance) => Alliance.fromJson(alliance))
          .toList(),
    );
  }
}
