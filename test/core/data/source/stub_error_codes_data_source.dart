import "package:errorlookup/core/data/source/error_codes_data_source.dart";
import "package:errorlookup/core/models/error_detail.dart";
import "package:errorlookup/core/models/error_details.dart";
import "package:errorlookup/core/models/result.dart";

/// エラーコードのデータ層のスタブ
class StubErrorCodesDataSource implements ErrorCodesDataSource {
  final ErrorDetails _windowsErrorDetails;
  final ErrorDetails _linuxErrorDetails;
  final ErrorDetails _curlErrorDetails;

  StubErrorCodesDataSource(
      {required Map<String, dynamic> windowsJson,
      required Map<String, dynamic> linuxJson,
      required Map<String, dynamic> curlJson})
      : _windowsErrorDetails = ErrorDetails.fromJson(windowsJson),
        _linuxErrorDetails = ErrorDetails.fromJson(linuxJson),
        _curlErrorDetails = ErrorDetails.fromJson(curlJson);

  @override
  Future<Result<List<ErrorDetail>, Exception>> getCurlErrorCodes() async {
    return Success(_curlErrorDetails.errors);
  }

  @override
  Future<Result<List<ErrorDetail>, Exception>> getLinuxErrorCodes() async {
    return Success(_linuxErrorDetails.errors);
  }

  @override
  Future<Result<List<ErrorDetail>, Exception>> getWindowsErrorCodes() async {
    return Success(_windowsErrorDetails.errors);
  }
}
