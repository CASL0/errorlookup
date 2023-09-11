import "package:errorlookup/core/data/repository/default_error_codes_repository.dart";
import "package:errorlookup/core/data/repository/error_codes_repository.dart";
import "package:errorlookup/core/models/error_detail.dart";
import "package:errorlookup/core/models/result.dart";
import "package:flutter_test/flutter_test.dart";

import "../source/stub_error_codes_data_source.dart";

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
  DefaultErrorCodesRepository? repository;
  setUpAll(() {
    final stubDataSource = StubErrorCodesDataSource(
        windowsJson: windowsObjectJson,
        linuxJson: linuxObjectJson,
        curlJson: curlObjectJson);

    repository = DefaultErrorCodesRepository(dataSource: stubDataSource);
  });
  tearDownAll(() => repository = null);

  group("DefaultErrorCodesRepositoryTest", () {
    test("Windowsエラーコードの取得テスト", () async {
      final windowsError = await repository?.getErrorCodes(ErrorType.windows);
      expect(windowsError is Success, true);
      final errorCodes =
          (windowsError as Success<List<ErrorDetail>, Exception>).value;
      expect(errorCodes.length, 2);
      expect(errorCodes[0].code, 0);
      expect(errorCodes[0].alias, "ERROR_SUCCESS");
      expect(
          errorCodes[0].description, "The operation completed successfully.");
      expect(errorCodes[1].code, 1);
      expect(errorCodes[1].alias, "ERROR_INVALID_FUNCTION");
      expect(errorCodes[1].description, "Incorrect function.");
    });
    test("Linuxエラーコードの取得テスト", () async {
      final linuxError = await repository?.getErrorCodes(ErrorType.linux);
      expect(linuxError is Success, true);
      final errorCodes =
          (linuxError as Success<List<ErrorDetail>, Exception>).value;
      expect(errorCodes.length, 2);
      expect(errorCodes[0].code, 1);
      expect(errorCodes[0].alias, "EPERM");
      expect(errorCodes[0].description, "Operation not permitted");
      expect(errorCodes[1].code, 2);
      expect(errorCodes[1].alias, "ENOENT");
      expect(errorCodes[1].description, "No such file or directory");
    });
    test("curlエラーコードの取得テスト", () async {
      final curlError = await repository?.getErrorCodes(ErrorType.curl);
      expect(curlError is Success, true);
      final errorCodes =
          (curlError as Success<List<ErrorDetail>, Exception>).value;
      expect(errorCodes.length, 2);
      expect(errorCodes[0].code, 0);
      expect(errorCodes[0].alias, "CURLE_OK");
      expect(errorCodes[0].description, "All fine. Proceed as usual. ");
      expect(errorCodes[1].code, 1);
      expect(errorCodes[1].alias, "CURLE_UNSUPPORTED_PROTOCOL");
      expect(errorCodes[1].description,
          "The URL you passed to libcurl used a protocol that this libcurl does not support. The support might be a compile-time option that you did not use, it can be a misspelled protocol string or just a protocol libcurl has no code for. ");
    });
  });
}
