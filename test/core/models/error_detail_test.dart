import "dart:convert";

import "package:errorlookup/core/models/error_detail.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  const typicalObjectJson = <String, dynamic>{
    "code": 0,
    "alias": "ERROR_SUCCESS",
    "description": "The operation completed successfully."
  };
  const typicalStringJson = '''
  {
    "code": 10,
    "alias": "ERROR_BAD_ENVIRONMENT",
    "description": "The environment is incorrect."
  }
  ''';

  group("ErrorDetailTest", () {
    test("JSONのMapから変換するテスト", () {
      final errorDetail = ErrorDetail.fromJson(typicalObjectJson);
      expect(errorDetail.code, 0);
      expect(errorDetail.alias, "ERROR_SUCCESS");
      expect(errorDetail.description, "The operation completed successfully.");
    });

    test("JSONの文字列から変換するテスト", () {
      final jsonMap = jsonDecode(typicalStringJson) as Map<String, dynamic>;
      final errorDetail = ErrorDetail.fromJson(jsonMap);
      expect(errorDetail.code, 10);
      expect(errorDetail.alias, "ERROR_BAD_ENVIRONMENT");
      expect(errorDetail.description, "The environment is incorrect.");
    });
  });
}
