import 'package:errorlookup/core/models/error_detail.dart';
import 'package:errorlookup/core/models/result.dart';

/// エラーコードのリポジトリ層のインターフェース
abstract interface class ErrorCodesRepository {
  /// 指定したエラーコード情報を取得します
  Future<Result<List<ErrorDetail>, Exception>> getErrorCodes(
      final ErrorType type);
}

enum ErrorType { windows, linux, curl }
