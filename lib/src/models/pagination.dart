import 'package:robotevents/src/models/award.dart';
import 'package:robotevents/src/models/event.dart';
import 'package:robotevents/src/models/match_obj.dart';
import 'package:robotevents/src/models/program.dart';
import 'package:robotevents/src/models/ranking.dart';
import 'package:robotevents/src/models/season.dart';
import 'package:robotevents/src/models/skill.dart';
import 'package:robotevents/src/models/team.dart';

class PageMeta {
  int? currentPage;
  int? from;
  int? lastPage;
  int? perPage;
  int? to;
  int? total;

  PageMeta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.perPage,
    this.to,
    this.total,
  });

  factory PageMeta.fromJson(Map<String, dynamic> json) {
    return PageMeta(
      currentPage: json['current_page'],
      from: json['from'],
      lastPage: json['last_page'],
      perPage: json['per_page'],
      to: json['to'],
      total: json['total'],
    );
  }
}

class PaginatedTeam {
  PageMeta? meta;
  List<Team>? data;

  PaginatedTeam({
    this.meta,
    this.data,
  });

  factory PaginatedTeam.fromJson(Map<String, dynamic> json) {
    return PaginatedTeam(
      meta: json['meta'] != null ? PageMeta.fromJson(json['meta']) : null,
      data: json['data'] != null
          ? List<Team>.from(json['data'].map((team) => Team.fromJson(team)))
          : null,
    );
  }
}

class PaginatedEvent {
  PageMeta? meta;
  List<Event>? data;

  PaginatedEvent({
    this.meta,
    this.data,
  });

  factory PaginatedEvent.fromJson(Map<String, dynamic> json) {
    return PaginatedEvent(
      meta: json['meta'] != null ? PageMeta.fromJson(json['meta']) : null,
      data: json['data'] != null
          ? List<Event>.from(json['data'].map((event) => Event.fromJson(event)))
          : null,
    );
  }
}

class PaginatedAward {
  PageMeta? meta;
  List<Award>? data;

  PaginatedAward({
    this.meta,
    this.data,
  });

  factory PaginatedAward.fromJson(Map<String, dynamic> json) {
    return PaginatedAward(
      meta: json['meta'] != null ? PageMeta.fromJson(json['meta']) : null,
      data: json['data'] != null
          ? List<Award>.from(json['data'].map((award) => Award.fromJson(award)))
          : null,
    );
  }
}

class PaginatedSeason {
  PageMeta? meta;
  List<Season>? data;

  PaginatedSeason({
    this.meta,
    this.data,
  });

  factory PaginatedSeason.fromJson(Map<String, dynamic> json) {
    return PaginatedSeason(
      meta: json['meta'] != null ? PageMeta.fromJson(json['meta']) : null,
      data: json['data'] != null
          ? List<Season>.from(
              json['data'].map((season) => Season.fromJson(season)),
            )
          : null,
    );
  }
}

class PaginatedRanking {
  PageMeta? meta;
  List<Ranking>? data;

  PaginatedRanking({
    this.meta,
    this.data,
  });

  factory PaginatedRanking.fromJson(Map<String, dynamic> json) {
    return PaginatedRanking(
      meta: json['meta'] != null ? PageMeta.fromJson(json['meta']) : null,
      data: json['data'] != null
          ? List<Ranking>.from(
              json['data'].map((ranking) => Ranking.fromJson(ranking)),
            )
          : null,
    );
  }
}

class PaginatedMatch {
  PageMeta? meta;
  List<MatchObj>? data;

  PaginatedMatch({
    this.meta,
    this.data,
  });

  factory PaginatedMatch.fromJson(Map<String, dynamic> json) {
    return PaginatedMatch(
      meta: json['meta'] != null ? PageMeta.fromJson(json['meta']) : null,
      data: json['data'] != null
          ? List<MatchObj>.from(
              json['data'].map((match) => MatchObj.fromJson(match)),
            )
          : null,
    );
  }
}

class PaginatedSkill {
  PageMeta? meta;
  List<Skill>? data;

  PaginatedSkill({
    this.meta,
    this.data,
  });

  factory PaginatedSkill.fromJson(Map<String, dynamic> json) {
    return PaginatedSkill(
      meta: json['meta'] != null ? PageMeta.fromJson(json['meta']) : null,
      data: json['data'] != null
          ? List<Skill>.from(
              json['data'].map((skill) => Skill.fromJson(skill)),
            )
          : null,
    );
  }
}

class PaginatedProgram {
  PageMeta? meta;
  List<Program>? data;

  PaginatedProgram({
    this.meta,
    this.data,
  });

  factory PaginatedProgram.fromJson(Map<String, dynamic> json) {
    return PaginatedProgram(
      meta: json['meta'] != null ? PageMeta.fromJson(json['meta']) : null,
      data: json['data'] != null
          ? List<Program>.from(
              json['data'].map((program) => Program.fromJson(program)),
            )
          : null,
    );
  }
}
