import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:robotevents/robotevents.dart';
import 'package:robotevents/src/error.dart';
import 'package:robotevents/src/models/models.dart';
import 'package:robotevents/src/models/pagination.dart';

Future<PaginatedTeam> getTeamsEndpoint(
  // Dio Client (Required)
  Dio client,
  // Filters (Optional)
  List<int>? id,
  List<String>? number,
  List<int>? event,
  bool? registered,
  List<int>? program,
  List<Grade>? grade,
  List<String>? country,
  // Pagination (Optional)
  int? page,
  int? limit,
) async {
  // Prepare query parameters
  final Map<String, dynamic> queryParameters = {};
  if (id != null) queryParameters['id'] = id.join(',');
  if (number != null) queryParameters['number'] = number.join(',');
  if (event != null) queryParameters['event'] = event.join(',');
  if (registered != null) queryParameters['registered'] = registered;
  if (program != null) queryParameters['program'] = program.join(',');
  if (grade != null) {
    queryParameters['grade'] = grade.map((e) => e.name).join(',');
  }
  if (country != null) queryParameters['country'] = country.join(',');
  if (page != null) queryParameters['page'] = page;
  if (limit != null) queryParameters['per_page'] = limit;

  try {
    // Make the request
    final response =
        await client.get('/teams', queryParameters: queryParameters);

    // Parse the response to JSON
    Map<String, dynamic> json = jsonDecode(response.toString());

    // Check for an error
    if (json.containsKey('code') && json['code'] != 0) {
      throw RobotEventsError(json['code'], json['message']);
    }

    return PaginatedTeam.fromJson(json);
  } on DioException catch (e) {
    // Check for an error caused by the RobotEvents API
    if (e.response != null) {
      // Try decoding the response to JSON
      try {
        Map<String, dynamic> json = jsonDecode(e.response.toString());
        if (json.containsKey('code') && json['code'] != 0) {
          throw RobotEventsError(json['code'], json['message']);
        }
      } on Exception {
        // Ignore it, rethrow original error
      }
    }

    // Rethrow the error
    rethrow;
  } on Exception {
    rethrow;
  }
}

Future<Team> getTeamEndpoint(
    // Dio Client (Required)
    Dio client,
    // Team ID (Required)
    int id) async {
  try {
    // Make the request
    final response = await client.get('/teams/$id');

    // Parse the response to JSON
    Map<String, dynamic> json = jsonDecode(response.toString());

    // Check for an error
    if (json.containsKey('code') && json['code'] != 0) {
      throw RobotEventsError(json['code'], json['message']);
    }

    return Team.fromJson(json);
  } on DioException catch (e) {
    // Check for an error caused by the RobotEvents API
    if (e.response != null) {
      // Try decoding the response to JSON
      try {
        Map<String, dynamic> json = jsonDecode(e.response.toString());
        if (json.containsKey('code') && json['code'] != 0) {
          throw RobotEventsError(json['code'], json['message']);
        }
      } on Exception {
        // Ignore it, rethrow original error
      }
    }

    // Rethrow the error
    rethrow;
  } on Exception {
    rethrow;
  }
}

Future<PaginatedEvent> getTeamEventsEndpoint(
  // Dio Client (Required)
  Dio client,
  // Team ID (Required)
  int id,
  // Filters (Optional)
  List<String>? sku,
  List<int>? season,
  DateTime? start,
  DateTime? end,
  List<EventLevel>? level,
  // Pagination (Optional)
  int? page,
  int? limit,
) async {
  // Prepare query parameters
  final Map<String, dynamic> queryParameters = {};
  if (sku != null) queryParameters['sku'] = sku.join(',');
  if (season != null) queryParameters['season'] = season.join(',');
  if (start != null) queryParameters['start'] = start.toIso8601String();
  if (end != null) queryParameters['end'] = end.toIso8601String();
  if (level != null)
    queryParameters['level'] = level.map((e) => e.name).join(',');
  if (page != null) queryParameters['page'] = page;
  if (limit != null) queryParameters['per_page'] = limit;

  try {
    // Make the request
    final response =
        await client.get('/teams/$id/events', queryParameters: queryParameters);

    // Parse the response to JSON
    Map<String, dynamic> json = jsonDecode(response.toString());

    // Check for an error
    if (json.containsKey('code') && json['code'] != 0) {
      throw RobotEventsError(json['code'], json['message']);
    }

    return PaginatedEvent.fromJson(json);
  } on DioException catch (e) {
    // Check for an error caused by the RobotEvents API
    if (e.response != null) {
      // Try decoding the response to JSON
      try {
        Map<String, dynamic> json = jsonDecode(e.response.toString());
        if (json.containsKey('code') && json['code'] != 0) {
          throw RobotEventsError(json['code'], json['message']);
        }
      } on Exception {
        // Ignore it, rethrow original error
      }
    }

    // Rethrow the error
    rethrow;
  } on Exception {
    rethrow;
  }
}

Future<PaginatedMatch> getTeamMatchesEndpoint(
  // Dio Client (Required)
  Dio client,
  // Team ID (Required)
  int id,
  // Filters (Optional)
  List<int>? event,
  List<int>? season,
  List<int>? round,
  List<int>? instance,
  List<int>? matchnum,
  // Pagination (Optional)
  int? page,
  int? limit,
) async {
  // Prepare query parameters
  final Map<String, dynamic> queryParameters = {};
  if (event != null) queryParameters['event'] = event.join(',');
  if (season != null) queryParameters['season'] = season.join(',');
  if (round != null) queryParameters['round'] = round.join(',');
  if (instance != null) queryParameters['instance'] = instance.join(',');
  if (matchnum != null) queryParameters['matchnum'] = matchnum.join(',');
  if (page != null) queryParameters['page'] = page;
  if (limit != null) queryParameters['per_page'] = limit;

  try {
    // Make the request
    final response = await client.get('/teams/$id/matches',
        queryParameters: queryParameters);

    // Parse the response to JSON
    Map<String, dynamic> json = jsonDecode(response.toString());

    // Check for an error
    if (json.containsKey('code') && json['code'] != 0) {
      throw RobotEventsError(json['code'], json['message']);
    }

    return PaginatedMatch.fromJson(json);
  } on DioException catch (e) {
    // Check for an error caused by the RobotEvents API
    if (e.response != null) {
      // Try decoding the response to JSON
      try {
        Map<String, dynamic> json = jsonDecode(e.response.toString());
        if (json.containsKey('code') && json['code'] != 0) {
          throw RobotEventsError(json['code'], json['message']);
        }
      } on Exception {
        // Ignore it, rethrow original error
      }
    }

    // Rethrow the error
    rethrow;
  } on Exception {
    rethrow;
  }
}

Future<PaginatedRanking> getTeamRankingsEndpoint(
  // Dio Client (Required)
  Dio client,
  // Team ID (Required)
  int id,
  // Filters (Optional)
  List<int>? event,
  List<int>? rank,
  List<int>? season,
  // Pagination (Optional)
  int? page,
  int? limit,
) async {
  // Prepare query parameters
  final Map<String, dynamic> queryParameters = {};
  if (event != null) queryParameters['event'] = event.join(',');
  if (rank != null) queryParameters['rank'] = rank.join(',');
  if (season != null) queryParameters['season'] = season.join(',');
  if (page != null) queryParameters['page'] = page;
  if (limit != null) queryParameters['per_page'] = limit;

  try {
    // Make the request
    final response = await client.get('/teams/$id/rankings',
        queryParameters: queryParameters);

    // Parse the response to JSON
    Map<String, dynamic> json = jsonDecode(response.toString());

    // Check for an error
    if (json.containsKey('code') && json['code'] != 0) {
      throw RobotEventsError(json['code'], json['message']);
    }

    return PaginatedRanking.fromJson(json);
  } on DioException catch (e) {
    // Check for an error caused by the RobotEvents API
    if (e.response != null) {
      // Try decoding the response to JSON
      try {
        Map<String, dynamic> json = jsonDecode(e.response.toString());
        if (json.containsKey('code') && json['code'] != 0) {
          throw RobotEventsError(json['code'], json['message']);
        }
      } on Exception {
        // Ignore it, rethrow original error
      }
    }

    // Rethrow the error
    rethrow;
  } on Exception {
    rethrow;
  }
}

Future<PaginatedSkill> getTeamSkillsEndpoint(
  // Dio Client (Required)
  Dio client,
  // Team ID (Required)
  int id,
  // Filters (Optional)
  List<int>? event,
  List<SkillType>? type,
  List<int>? season,
  // Pagination (Optional)
  int? page,
  int? limit,
) async {
  // Prepare query parameters
  final Map<String, dynamic> queryParameters = {};
  if (event != null) queryParameters['event'] = event.join(',');
  if (type != null) queryParameters['type'] = type.map((e) => e.name).join(',');
  if (season != null) queryParameters['season'] = season.join(',');
  if (page != null) queryParameters['page'] = page;
  if (limit != null) queryParameters['per_page'] = limit;

  try {
    // Make the request
    final response =
        await client.get('/teams/$id/skills', queryParameters: queryParameters);

    // Parse the response to JSON
    Map<String, dynamic> json = jsonDecode(response.toString());

    // Check for an error
    if (json.containsKey('code') && json['code'] != 0) {
      throw RobotEventsError(json['code'], json['message']);
    }

    return PaginatedSkill.fromJson(json);
  } on DioException catch (e) {
    // Check for an error caused by the RobotEvents API
    if (e.response != null) {
      // Try decoding the response to JSON
      try {
        Map<String, dynamic> json = jsonDecode(e.response.toString());
        if (json.containsKey('code') && json['code'] != 0) {
          throw RobotEventsError(json['code'], json['message']);
        }
      } on Exception {
        // Ignore it, rethrow original error
      }
    }

    // Rethrow the error
    rethrow;
  } on Exception {
    rethrow;
  }
}

Future<PaginatedAward> getTeamAwardsEndpoint(
  // Dio Client (Required)
  Dio client,
  // Team ID (Required)
  int id,
  // Filters (Optional)
  List<int>? event,
  List<int>? season,
  // Pagination (Optional)
  int? page,
  int? limit,
) async {
  // Prepare query parameters
  final Map<String, dynamic> queryParameters = {};
  if (event != null) queryParameters['event'] = event.join(',');
  if (season != null) queryParameters['season'] = season.join(',');
  if (page != null) queryParameters['page'] = page;
  if (limit != null) queryParameters['per_page'] = limit;

  try {
    // Make the request
    final response =
        await client.get('/teams/$id/awards', queryParameters: queryParameters);

    // Parse the response to JSON
    Map<String, dynamic> json = jsonDecode(response.toString());

    // Check for an error
    if (json.containsKey('code') && json['code'] != 0) {
      throw RobotEventsError(json['code'], json['message']);
    }

    return PaginatedAward.fromJson(json);
  } on DioException catch (e) {
    // Check for an error caused by the RobotEvents API
    if (e.response != null) {
      // Try decoding the response to JSON
      try {
        Map<String, dynamic> json = jsonDecode(e.response.toString());
        if (json.containsKey('code') && json['code'] != 0) {
          throw RobotEventsError(json['code'], json['message']);
        }
      } on Exception {
        // Ignore it, rethrow original error
      }
    }

    // Rethrow the error
    rethrow;
  } on Exception {
    rethrow;
  }
}
