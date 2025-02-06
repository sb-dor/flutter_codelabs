import 'dart:convert';

import 'package:flutter/foundation.dart';

sealed class ResponseBody<T> {
  //
  ResponseBody({required this.body});

  T? body;
}

final class StringResponseBody extends ResponseBody<String> {
  StringResponseBody({required super.body});
}

final class BytesResponseBody extends ResponseBody<List<int>> {
  BytesResponseBody({required super.body});
}

final class MapResponseBody extends ResponseBody<Map<String, dynamic>> {
  MapResponseBody({required super.body});
}

final class ResponseParser {
  // jsonUTF8 helps to decode bytes
  static final _jsonUTF8 = json.fuse(utf8);

  Future<Map<String, dynamic>?> decode({
    required ResponseBody<Object>? data,
    int? statusCode,
  }) async {
    //
    // this was implemented with required parameter
    // check for "no named" parameter
    // https://github.com/hawkkiller/sizzle_starter/blob/main/packages/rest_client/lib/src/rest_client_base.dart
    final decodedBody = switch (data) {
      MapResponseBody(body: final Map<String, Object?> data) => data,
      StringResponseBody(body: final String data) => await _decodeString(data),
      BytesResponseBody(body: final List<int> data) => await _decodeBytes(data),
      _ => <String, dynamic>{},
    };

    if (decodedBody case {"error": final Map<String, dynamic> error}) {
      return error;
    }

    if (decodedBody case {"data": final Map<String, dynamic> data}) {
      return data;
    }

    return decodedBody;
    //
  }

  //
  Future<Map<String, dynamic>?> _decodeString(String body) async {
    if (body.isEmpty) return null;

    if (body.length > 1000) {
      return (await compute(jsonDecode, body)) as Map<String, dynamic>;
    }

    return jsonDecode(body) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>?> _decodeBytes(List<int> bytes) async {
    if (bytes.isEmpty) return null;

    if (bytes.length > 1000) {
      return (await compute(_jsonUTF8.decode, bytes)) as Map<String, dynamic>;
    }

    return _jsonUTF8.decode(bytes) as Map<String, dynamic>;
  }
}
