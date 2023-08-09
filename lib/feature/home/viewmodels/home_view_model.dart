import 'package:errorlookup/core/data/repository/default_error_codes_repository.dart';
import 'package:errorlookup/core/data/repository/error_codes_repository.dart';
import 'package:errorlookup/core/data/source/local/local_error_codes_data_source.dart';
import 'package:errorlookup/core/models/error_detail.dart';
import 'package:errorlookup/core/models/result.dart';
import 'package:errorlookup/feature/home/models/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ホーム画面のビジネスロジックを扱うViewModel
class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel({required ErrorCodesRepository errorCodesRepository})
      : _errorCodesRepository = errorCodesRepository,
        super(const HomeState());

  final ErrorCodesRepository _errorCodesRepository;

  /// エラーコードの一覧を取得します
  Future<Result<Object, Exception>> fetchErrorCodes() async {
    if (!state.isFetchingErrorCodes) {
      state = state.copyWith(isFetchingErrorCodes: true);
      List<Result<List<ErrorDetail>, Exception>> errorCodes =
          await Future.wait([
        _errorCodesRepository.getErrorCodes(ErrorType.windows),
        _errorCodesRepository.getErrorCodes(ErrorType.linux),
        _errorCodesRepository.getErrorCodes(ErrorType.curl)
      ]);
      for (final element in errorCodes) {
        // 一部が取得失敗していた場合はその旨を返す
        if (element is Failure) {
          return element;
        }
      }
      state = state.copyWith(
          windowsErrorDetails:
              (errorCodes[0] as Success<List<ErrorDetail>, Exception>).value,
          linuxErrorDetails:
              (errorCodes[1] as Success<List<ErrorDetail>, Exception>).value,
          curlErrorDetails:
              (errorCodes[2] as Success<List<ErrorDetail>, Exception>).value,
          isFetchingErrorCodes: false);
      return const Success("success");
    }
    return const Success("fetching now");
  }
}

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeState>(
    (ref) => HomeViewModel(
        errorCodesRepository: DefaultErrorCodesRepository(
            dataSource: LocalErrorCodesDataSource())));
