import 'package:robotevents/src/models/id_info.dart';

class Skill {
  int id;
  IdInfo event;
  IdInfo team;
  SkillType type;
  IdInfo season;
  IdInfo division;
  int rank;
  int score;
  int attempts;

  Skill({
    required this.id,
    required this.event,
    required this.team,
    required this.type,
    required this.season,
    required this.division,
    required this.rank,
    required this.score,
    required this.attempts,
  });

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      id: json['id'],
      event: IdInfo.fromJson(json['event']),
      team: IdInfo.fromJson(json['team']),
      type: json['type'] == 'driver'
          ? SkillType.driver
          : json['type'] == 'programming'
              ? SkillType.programming
              : SkillType.packageDeliveryTime,
      season: IdInfo.fromJson(json['season']),
      division: IdInfo.fromJson(json['division']),
      rank: json['rank'],
      score: json['score'],
      attempts: json['attempts'],
    );
  }
}

enum SkillType { driver, programming, packageDeliveryTime }
