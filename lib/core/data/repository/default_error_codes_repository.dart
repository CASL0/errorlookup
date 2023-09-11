import "package:errorlookup/core/data/repository/error_codes_repository.dart";
import "package:errorlookup/core/data/source/error_codes_data_source.dart";
import "package:errorlookup/core/models/error_detail.dart";
import "package:errorlookup/core/models/result.dart";

/// エラーコードのリポジトリ層の実装
class DefaultErrorCodesRepository implements ErrorCodesRepository {
  final ErrorCodesDataSource _dataSource;

  /// コンストラクタ
  DefaultErrorCodesRepository({required ErrorCodesDataSource dataSource})
      : _dataSource = dataSource;

  /// 指定したエラーコード情報を取得します
  @override
  Future<Result<List<ErrorDetail>, Exception>> getErrorCodes(
      final ErrorType type) async {
    switch (type) {
      case ErrorType.windows:
        return _dataSource.getWindowsErrorCodes();
      case ErrorType.linux:
        return _dataSource.getLinuxErrorCodes();
      case ErrorType.curl:
        return _dataSource.getCurlErrorCodes();
    }
  }
}
