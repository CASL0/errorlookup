import "package:errorlookup/core/models/error_detail.dart";
import "package:errorlookup/core/models/result.dart";

/// エラーコードのデータ層のインターフェース
abstract interface class ErrorCodesDataSource {
  /// Windowsのエラーコード情報を取得します
  Future<Result<List<ErrorDetail>, Exception>> getWindowsErrorCodes();

  /// Linuxのエラーコード情報を取得します
  Future<Result<List<ErrorDetail>, Exception>> getLinuxErrorCodes();

  /// Curlのエラーコード情報を取得します
  Future<Result<List<ErrorDetail>, Exception>> getCurlErrorCodes();
}
