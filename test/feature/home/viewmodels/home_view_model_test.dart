import 'package:errorlookup/core/data/repository/error_codes_repository.dart';
import 'package:errorlookup/core/models/error_detail.dart';
import 'package:errorlookup/core/models/error_details.dart';
import 'package:errorlookup/core/models/result.dart';
import 'package:errorlookup/feature/home/models/home_state.dart';
import 'package:errorlookup/feature/home/viewmodels/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../core/data/repository/spy_error_codes_repository.dart';

void main() {
  const windowsObjectJson = <String, dynamic>{
    "errors": [
      {
        "code": 0,
        "alias": "ERROR_SUCCESS",
        "description": "The operation completed successfully."
      },
      {
        "code": 1,
        "alias": "ERROR_INVALID_FUNCTION",
        "description": "Incorrect function."
      }
    ]
  };
  const linuxObjectJson = <String, dynamic>{
    "errors": [
      {"code": 1, "alias": "EPERM", "description": "Operation not permitted"},
      {"code": 2, "alias": "ENOENT", "description": "No such file or directory"}
    ]
  };
  const curlObjectJson = <String, dynamic>{
    "errors": [
      {
        "code": 0,
        "alias": "CURLE_OK",
        "description": "All fine. Proceed as usual. "
      },
      {
        "code": 1,
        "alias": "CURLE_UNSUPPORTED_PROTOCOL",
        "description":
            "The URL you passed to libcurl used a protocol that this libcurl does not support. The support might be a compile-time option that you did not use, it can be a misspelled protocol string or just a protocol libcurl has no code for. "
      }
    ]
  };
  late ErrorDetails windowsErrorDetails;
  late ErrorDetails linuxErrorDetails;
  late ErrorDetails curlErrorDetails;
  setUpAll(() {
    windowsErrorDetails = ErrorDetails.fromJson(windowsObjectJson);
    linuxErrorDetails = ErrorDetails.fromJson(linuxObjectJson);
    curlErrorDetails = ErrorDetails.fromJson(curlObjectJson);
  });
  group("HomeViewModelTest", () {
    test("fetchErrorCodesの排他制御", () async {
      final Map<ErrorType, Result<List<ErrorDetail>, Exception>> result = {
        ErrorType.windows: Success(windowsErrorDetails.errors),
        ErrorType.linux: Success(linuxErrorDetails.errors),
        ErrorType.curl: Success(curlErrorDetails.errors)
      };
      final spyRepository =
          SpyErrorCodesRepository(getErrorCodesResultMap: result);
      final viewModel = HomeViewModel(errorCodesRepository: spyRepository);
      final future = viewModel.fetchErrorCodes();
      viewModel.fetchErrorCodes();
      expect(spyRepository.callCount, 3);
      await future;
      await viewModel.fetchErrorCodes();
      expect(spyRepository.callCount, 6);
    });
  });

  test("一部のエラーコードの取得に失敗した場合はfetchErrorCodesがFailureを返す", () async {
    final Map<ErrorType, Result<List<ErrorDetail>, Exception>> result = {
      ErrorType.windows: Success(windowsErrorDetails.errors),
      ErrorType.linux: Failure(Exception("取得失敗")),
      ErrorType.curl: Success(curlErrorDetails.errors)
    };
    final spyRepository =
        SpyErrorCodesRepository(getErrorCodesResultMap: result);
    final viewModel = HomeViewModel(errorCodesRepository: spyRepository);
    final res = await viewModel.fetchErrorCodes();
    expect(res is Failure, true);
    expect((res as Failure<Object, Exception>).exception.toString(),
        Exception("取得失敗").toString());
  });

  test("updateErrorCodeInputでErrorCodeの入力値の状態を更新", () {
    final spyRepository = SpyErrorCodesRepository(
        getErrorCodesResultMap: <ErrorType,
            Result<List<ErrorDetail>, Exception>>{});
    final viewModel =
        HomeViewModel(errorCodesRepository: spyRepository, initialFetch: false);
    expect(viewModel.debugState, const HomeState(errorCodeInput: -1));
    viewModel.updateErrorCodeInput("123");
    expect(viewModel.debugState, const HomeState(errorCodeInput: 123));
  });

  test("入力値が数字以外の場合は-1の状態に更新する", () {
    final spyRepository = SpyErrorCodesRepository(
        getErrorCodesResultMap: <ErrorType,
            Result<List<ErrorDetail>, Exception>>{});
    final viewModel =
        HomeViewModel(errorCodesRepository: spyRepository, initialFetch: false);
    viewModel.updateErrorCodeInput("");
    expect(viewModel.debugState, const HomeState(errorCodeInput: -1));
    viewModel.updateErrorCodeInput("+123");
    expect(viewModel.debugState, const HomeState(errorCodeInput: 123));
  });
}
