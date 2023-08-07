import 'dart:convert';

import 'package:errorlookup/core/data/source/error_codes_data_source.dart';
import 'package:errorlookup/core/models/error_detail.dart';
import 'package:errorlookup/core/models/error_details.dart';
import 'package:errorlookup/core/models/result.dart';
import 'package:flutter/services.dart';

class LocalErrorCodesDataSource implements ErrorCodesDataSource {
  @override
  Future<Result<List<ErrorDetail>, Exception>> getCurlErrorCodes() async {
    return Success(await _getErrorCodes("assets/json/curl_errors.json"));
  }

  @override
  Future<Result<List<ErrorDetail>, Exception>> getLinuxErrorCodes() async {
    return Success(await _getErrorCodes("assets/json/errno.json"));
  }

  @override
  Future<Result<List<ErrorDetail>, Exception>> getWindowsErrorCodes() async {
    return Success(
        await _getErrorCodes("assets/json/windows_system_errors.json"));
  }

  Future<List<ErrorDetail>> _getErrorCodes(final String assetPath) async {
    final jsonString = await rootBundle.loadString(assetPath);
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return ErrorDetails.fromJson(jsonMap).errors;
  }
}
