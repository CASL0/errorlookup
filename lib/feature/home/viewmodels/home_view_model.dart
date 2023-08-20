import 'package:errorlookup/core/data/repository/error_codes_repository.dart';
import 'package:errorlookup/core/models/error_detail.dart';
import 'package:errorlookup/core/models/result.dart';
import 'package:errorlookup/feature/home/models/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

/// ホーム画面のビジネスロジックを扱うViewModel
class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel(
      {required ErrorCodesRepository errorCodesRepository,
      bool initialFetch = true})
      : _errorCodesRepository = errorCodesRepository,
        super(const HomeState()) {
    if (initialFetch) {
      fetchErrorCodes();
    }
  }

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
          state = state.copyWith(isFetchingErrorCodes: false);
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

  /// ErrorCodeの入力値を更新する
  void updateErrorCodeInput(final String newValue) {
    final newErrorInput = int.tryParse(newValue) ?? -1;
    state = state.copyWith(errorCodeInput: newErrorInput);
  }
}

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeState>(
    (ref) =>
        HomeViewModel(errorCodesRepository: GetIt.I<ErrorCodesRepository>()));
