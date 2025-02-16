import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:robotevents/src/error.dart';
import 'package:robotevents/src/models/models.dart';

Future<PaginatedProgram> getProgramsEndpoint(
  // Dio Client (Required)
  Dio client,
  // Filters (Optional)
  List<int>? ids,
  // Pagination (Optional)
  int? page,
  int? limit,
) async {
  // Prepare query parameters
  final Map<String, dynamic> queryParameters = {};
  if (page != null) queryParameters['page'] = page;
  if (limit != null) queryParameters['per_page'] = limit;

  try {
    // Make the request
    final response =
        await client.get('/programs', queryParameters: queryParameters);

    // Parse the response to JSON
    Map<String, dynamic> json = jsonDecode(response.toString());

    // Check for an error
    if (json.containsKey('code') && json['code'] != 0) {
      throw RobotEventsError(json['code'], json['message']);
    }

    return PaginatedProgram.fromJson(json);
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

Future<Program> getProgramEndpoint(
  // Dio Client (Required)
  Dio client,
  // Program ID (Required)
  int id,
) async {
  try {
    // Make the request
    final response = await client.get('/programs/$id');

    // Parse the response to JSON
    Map<String, dynamic> json = jsonDecode(response.toString());

    // Check for an error
    if (json.containsKey('code') && json['code'] != 0) {
      throw RobotEventsError(json['code'], json['message']);
    }

    return Program.fromJson(json);
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
