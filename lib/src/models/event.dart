import 'package:robotevents/src/models/division.dart';
import 'package:robotevents/src/models/id_info.dart';
import 'package:robotevents/src/models/location.dart';

enum EventType { tournament, league, workshop, virtual }

enum EventLevel { world, national, regional, state, signature, other }

class Event {
  int id;
  String sku;
  String name;
  DateTime? start;
  DateTime? end;
  IdInfo season;
  IdInfo program;
  Location location;
  List<Location>? locations;
  List<Division>? divisions;
  EventLevel? level;
  bool? ongoing;
  bool? awardsFinalized;
  EventType? eventType;

  Event({
    required this.id,
    required this.sku,
    required this.name,
    this.start,
    this.end,
    required this.season,
    required this.program,
    required this.location,
    this.locations,
    this.divisions,
    this.level,
    this.ongoing,
    this.awardsFinalized,
    this.eventType,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      sku: json['sku'],
      name: json['name'],
      start: json['start'] != null ? DateTime.parse(json['start']) : null,
      end: json['end'] != null ? DateTime.parse(json['end']) : null,
      season: IdInfo.fromJson(json['season']),
      program: IdInfo.fromJson(json['program']),
      location: Location.fromJson(json['location']),
      locations: json['locations'] != null
          ? List<Location>.from((json['locations'] as Map<String, dynamic>)
              .values
              .map((location) => Location.fromJson(location)))
          : null,
      divisions: json['divisions'] != null
          ? List<Division>.from(
              json['divisions'].map((division) => Division.fromJson(division)))
          : null,
      level: json['level'] != null
          ? EventLevel.values.firstWhere((e) =>
              e.toString().split('.').last ==
              (json['level'] as String).toLowerCase())
          : null,
      ongoing: json['ongoing'],
      awardsFinalized: json['awards_finalized'],
      eventType: json['event_type'] != null
          ? EventType.values.firstWhere(
              (e) => e.toString().split('.').last == json['event_type'])
          : null,
    );
  }
}
