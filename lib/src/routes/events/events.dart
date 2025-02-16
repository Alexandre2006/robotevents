import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:robotevents/robotevents.dart';
import 'package:robotevents/src/error.dart';
import 'package:robotevents/src/models/models.dart';
import 'package:robotevents/src/utils.dart';

Future<PaginatedEvent> getEventsEndpoint(
  // Dio Client (Required)
  Dio client,
  // Filters (Optional)
  List<int>? id,
  List<String>? sku,
  List<int>? team,
  List<int>? season,
  DateTime? start,
  DateTime? end,
  String? region,
  List<EventLevel>? level,
  List<EventType>? type,
  // Pagination (Optional)
  int? page,
  int? limit,
) async {
  // Prepare query parameters
  final Map<String, dynamic> queryParameters = {};
  if (id != null) queryParameters['id'] = id.join(',');
  if (sku != null) queryParameters['sku'] = sku.join(',');
  if (team != null) queryParameters['team'] = team.join(',');
  if (season != null) queryParameters['season'] = season.join(',');
  if (start != null) queryParameters['start'] = dateTimeToRfc3339(start);
  if (end != null) queryParameters['end'] = dateTimeToRfc3339(end);
  if (region != null) queryParameters['region'] = region;
  if (level != null) {
    queryParameters['level'] = level.map((e) => convertEventLevelToString(e)).join(',');
  }
  if (type != null) {
    queryParameters['type'] = type.map((e) => e.toString().split('.').last).join(',');
  }
  if (page != null) queryParameters['page'] = page;
  if (limit != null) queryParameters['per_page'] = limit;

  try {
    // Make the request
    final response =
        await client.get('/events', queryParameters: queryParameters);

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

Future<Event> getEventEndpoint(
    // Dio Client (Required)
    Dio client,
    // Event ID (Required)
    int id) async {
  try {
    // Make the request
    final response = await client.get('/events/$id');

    // Parse the response to JSON
    Map<String, dynamic> json = jsonDecode(response.toString());

    // Check for an error
    if (json.containsKey('code') && json['code'] != 0) {
      throw RobotEventsError(json['code'], json['message']);
    }

    return Event.fromJson(json);
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

Future<PaginatedTeam> getEventTeamsEndpoint(
  // Dio Client (Required)
  Dio client,
  // Event information (Required)
  int id,
  // Filters (Optional)
  List<String>? number,
  bool? registered,
  List<Grade>? grade,
  List<String>? country,
  // Pagination (Optional)
  int? page,
  int? limit,
) {
  // Prepare query parameters
  final Map<String, dynamic> queryParameters = {};
  if (number != null) queryParameters['number'] = number.join(',');
  if (registered != null) queryParameters['registered'] = registered;
  if (grade != null) {
    queryParameters['grade'] = grade.map((e) => convertGradeToString(e)).join(',');
  }
  if (country != null) queryParameters['country'] = country.join(',');
  if (page != null) queryParameters['page'] = page;
  if (limit != null) queryParameters['per_page'] = limit;

  try {
    // Make the request
    return client
        .get('/events/$id/teams', queryParameters: queryParameters)
        .then((response) {
      // Parse the response to JSON
      Map<String, dynamic> json = jsonDecode(response.toString());

      // Check for an error
      if (json.containsKey('code') && json['code'] != 0) {
        throw RobotEventsError(json['code'], json['message']);
      }

      return PaginatedTeam.fromJson(json);
    });
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

Future<PaginatedSkill> getEventSkillsEndpoint(
  // Dio Client (Required)
  Dio client,
  // Event information (Required)
  int id,
  // Filters (Optional)
  List<int>? team,
  List<SkillType>? type,
  // Pagination (Optional)
  int? page,
  int? limit,
) async {
  // Prepare query parameters
  final Map<String, dynamic> queryParameters = {};
  if (team != null) queryParameters['team'] = team.join(',');
  if (type != null) {
    queryParameters['type'] = type.map((e) => convertSkillTypeToString(e)).join(',');
  }
  if (page != null) queryParameters['page'] = page;
  if (limit != null) queryParameters['per_page'] = limit;

  try {
    // Make the request
    final response = await client.get('/events/$id/skills',
        queryParameters: queryParameters);

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

Future<PaginatedAward> getEventAwardsEndpoint(
  // Dio Client (Required)
  Dio client,
  // Event information (Required)
  int id,
  // Filters (Optional)
  List<int>? team,
  List<String>? winner,
  // Pagination (Optional)
  int page,
  int limit,
) async {
  // Prepare query parameters
  final Map<String, dynamic> queryParameters = {};
  if (team != null) queryParameters['team'] = team.join(',');
  if (winner != null) queryParameters['winner'] = winner.join(',');
  queryParameters['page'] = page;
  queryParameters['per_page'] = limit;

  try {
    // Make the request
    final response = await client.get('/events/$id/awards',
        queryParameters: queryParameters);

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

Future<PaginatedMatch> getEventMatchesEndpoint(
  // Dio Client (Required)
  Dio client,
  // Event + Division information (Required)
  int id,
  int division,
  // Filters (Optional)
  List<int>? team,
  List<int>? round,
  List<int>? instance,
  List<int>? matchnum,
  // Pagination (Optional)
  int? page,
  int? limit,
) async {
  // Prepare query parameters
  final Map<String, dynamic> queryParameters = {};
  if (team != null) queryParameters['team'] = team.join(',');
  if (round != null) queryParameters['round'] = round.join(',');
  if (instance != null) queryParameters['instance'] = instance.join(',');
  if (matchnum != null) queryParameters['matchnum'] = matchnum.join(',');
  if (page != null) queryParameters['page'] = page;
  if (limit != null) queryParameters['per_page'] = limit;

  try {
    // Make the request
    final response = await client.get('/events/$id/divisions/$division/matches',
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

Future<PaginatedRanking> getEventFinalistRankingsEndpoint(
  // Dio Client (Required)
  Dio client,
  // Event + Division information (Required)
  int id,
  int division,
  // Filters (Optional)
  List<int>? team,
  List<int>? rank,
  // Pagination (Optional)
  int? page,
  int? limit,
) async {
  // Prepare query parameters
  final Map<String, dynamic> queryParameters = {};
  if (team != null) queryParameters['team'] = team.join(',');
  if (rank != null) queryParameters['rank'] = rank.join(',');
  if (page != null) queryParameters['page'] = page;
  if (limit != null) queryParameters['per_page'] = limit;

  try {
    // Make the request
    final response = await client.get(
        '/events/$id/divisions/$division/finalistRankings',
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

Future<PaginatedRanking> getEventRankingsEndpoint(
  // Dio Client (Required)
  Dio client,
  // Event + Division information (Required)
  int id,
  int division,
  // Filters (Optional)
  List<int>? team,
  List<int>? rank,
  // Pagination (Optional)
  int? page,
  int? limit,
) async {
  // Prepare query parameters
  final Map<String, dynamic> queryParameters = {};
  if (team != null) queryParameters['team'] = team.join(',');
  if (rank != null) queryParameters['rank'] = rank.join(',');
  if (page != null) queryParameters['page'] = page;
  if (limit != null) queryParameters['per_page'] = limit;

  try {
    // Make the request
    final response = await client.get(
        '/events/$id/divisions/$division/rankings',
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
