import 'package:errorlookup/core/data/repository/error_codes_repository.dart';
import 'package:errorlookup/core/models/error_detail.dart';
import 'package:errorlookup/core/models/result.dart';

/// エラーコードのリポジトリ層のスパイ
class SpyErrorCodesRepository implements ErrorCodesRepository {
  /// コンストラクタ
  SpyErrorCodesRepository(
      {required Map<ErrorType, Result<List<ErrorDetail>, Exception>>
          getErrorCodesResultMap})
      : _getErrorCodesResultMap = getErrorCodesResultMap;

  final Map<ErrorType, Result<List<ErrorDetail>, Exception>>
      _getErrorCodesResultMap;

  /// getErrorCodes()の呼び出し回数を記録
  int _callCount = 0;
  int get callCount => _callCount;

  @override
  Future<Result<List<ErrorDetail>, Exception>> getErrorCodes(
      ErrorType type) async {
    _callCount++;
    await Future.delayed(const Duration(milliseconds: 500));
    return Future.value(_getErrorCodesResultMap[type]);
  }
}
