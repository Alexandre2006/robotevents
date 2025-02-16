import 'package:robotevents/src/models/models.dart';

class Skill {
  int? id;
  IdInfo? event;
  IdInfo? team;
  SkillType? type;
  IdInfo? season;
  IdInfo? division;
  int? rank;
  int? score;
  int? attempts;

  Skill({
    this.id,
    this.event,
    this.team,
    this.type,
    this.season,
    this.division,
    this.rank,
    this.score,
    this.attempts,
  });

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      id: json['id'],
      event: json['event'] != null ? IdInfo.fromJson(json['event']) : null,
      team: json['team'] != null ? IdInfo.fromJson(json['team']) : null,
      type: json['type'] == 'driver'
          ? SkillType.driver
          : json['type'] == 'programming'
              ? SkillType.programming
              : SkillType.packageDeliveryTime,
      season: json['season'] != null ? IdInfo.fromJson(json['season']) : null,
      division:
          json['division'] != null ? IdInfo.fromJson(json['division']) : null,
      rank: json['rank'],
      score: json['score'],
      attempts: json['attempts'],
    );
  }
}

enum SkillType { driver, programming, packageDeliveryTime }
