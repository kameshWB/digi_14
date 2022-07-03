import 'dart:convert';
import 'dart:developer' as dev;

import 'package:sentry_flutter/sentry_flutter.dart';

import '../errors/errors.dart';
import 'connection_info.dart';

abstract class NetworkCalls {
  Future<String> get(String api);

  Future<String> post(
    String api, {
    Map<String, dynamic>? payload,
    Map<String, String>? overrideHeaders,
  });
}

class NetworkCallsImpl implements NetworkCalls {
  final SentryHttpClient client;
  final ConnectionInfo info;

  NetworkCallsImpl({
    required this.client,
    required this.info,
  });

  @override
  Future<String> get(String api) async {
    dev.log("Calling API --> $api", name: "ZUZU GET API");

    try {
      if (!(await info.isConnected())) {
        dev.log("Internet Connection Error", name: "ZUZU ERROR");

        throw const InternetConnectionFailure();
      } else {
        Uri uri = Uri.parse(api);

        final response = await client.get(uri);

        dev.log("Response for ($api) --> ${response.body}",
            name: "ZUZU GET API");

        if (response.statusCode == 200 || response.statusCode == 201) {
          return response.body;
        } else {
          dev.log("Response Not 200 Error", name: "ZUZU ERROR");

          dev.log(
              "Not 200 Response --> \nCode : ${response.statusCode}\nBody : ${response.body}",
              name: "ZUZU ERROR");
          throw ResponseNot200Failure(
              code: response.statusCode,
              body: response.body,
              message: "Something went wrong!");
        }
      }
    } catch (e) {
      dev.log("Get API ($api) call error $e", name: "ZUZU ERROR");
      rethrow;
    }
  }

  @override
  Future<String> post(
    String api, {
    Map<String, dynamic>? payload,
    Map<String, String>? overrideHeaders,
  }) async {
    dev.log("Calling API --> $api // payload --> $payload",
        name: "ZUZU POST API");

    try {
      if (!(await info.isConnected())) {
        dev.log("Internet Connection Error", name: "ZUZU ERROR");

        throw const InternetConnectionFailure();
      } else {
        Uri uri = Uri.parse(api);

        Map<String, String> headers = {
          "Accept": "application/json",
          "Content-Type": "application/json"
        };

        if (overrideHeaders != null) headers = overrideHeaders;

        final response = await client.post(
          uri,
          headers: headers,
          body: jsonEncode(payload),
        );

        dev.log(
            "Response for api ($api) (code -- ${response.statusCode}) --> ${response.body}",
            name: "ZUZU POST API");

        if (response.statusCode == 200 || response.statusCode == 201) {
          return response.body;
        } else {
          dev.log("Response Not 200 Error", name: "ZUZU ERROR");
          dev.log(
              "Response Not 200 Response --> \nCode : ${response.statusCode}\nBody : ${response.body}",
              name: "ZUZU ERROR");
          throw ResponseNot200Failure(
              code: response.statusCode,
              body: response.body,
              message: "Something went wrong!");
        }
      }
    } catch (e) {
      dev.log("Post API ($api) call error $e", name: "ZUZU ERROR");
      rethrow;
    }
  }
}