import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:robotevents/src/error.dart';
import 'package:robotevents/src/models/models.dart';
import 'package:robotevents/src/utils.dart';

Future<PaginatedSeason> getSeasonsEndpoint(
  // Dio Client (Required)
  Dio client,
  // Filters (Optional)
  List<int>? id,
  List<int>? program,
  List<int>? team,
  DateTime? start,
  DateTime? end,
  bool? active,
  // Pagination (Optional)
  int? page,
  int? limit,
) async {
  // Prepare query parameters
  final Map<String, dynamic> queryParameters = {};
  if (id != null) queryParameters['id'] = id.join(',');
  if (program != null) queryParameters['program'] = program.join(',');
  if (team != null) queryParameters['team'] = team.join(',');
  if (start != null) queryParameters['start'] = dateTimeToRfc3339(start);
  if (end != null) queryParameters['end'] = dateTimeToRfc3339(end);
  if (active != null) queryParameters['active'] = active.toString();
  if (page != null) queryParameters['page'] = page;
  if (limit != null) queryParameters['per_page'] = limit;

  try {
    // Make the request
    final response =
        await client.get('/seasons', queryParameters: queryParameters);

    // Parse the response to JSON
    Map<String, dynamic> json = jsonDecode(response.toString());

    // Check for an error
    if (json.containsKey('code') && json['code'] != 0) {
      throw RobotEventsError(json['code'], json['message']);
    }

    return PaginatedSeason.fromJson(json);
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

Future<Season> getSeasonEndpoint(
  // Dio Client (Required)
  Dio client,
  // Season ID (Required)
  int id,
) async {
  try {
    // Make the request
    final response = await client.get('/seasons/$id');

    // Parse the response to JSON
    Map<String, dynamic> json = jsonDecode(response.toString());

    // Check for an error
    if (json.containsKey('code') && json['code'] != 0) {
      throw RobotEventsError(json['code'], json['message']);
    }

    return Season.fromJson(json);
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

Future<PaginatedEvent> getSeasonEventsEndpoint(
  // Dio Client (Required)
  Dio client,
  // Season ID (Required)
  int id,
  // Filters (Optional)
  List<String>? sku,
  List<int>? team,
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
  if (team != null) queryParameters['team'] = team.join(',');
  if (start != null) queryParameters['start'] = dateTimeToRfc3339(start);
  if (end != null) queryParameters['end'] = dateTimeToRfc3339(end);
  if (level != null) {
    queryParameters['level'] =
        level.map((e) => e.toString().split('.').last).join(',');
  }
  if (page != null) queryParameters['page'] = page;
  if (limit != null) queryParameters['per_page'] = limit;

  try {
    // Make the request
    final response = await client.get('/seasons/$id/events',
        queryParameters: queryParameters);

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
