import 'package:errorlookup/core/models/error_detail.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const typicalObjectJson = <String, dynamic>{
    "code": 0,
    "alias": "ERROR_SUCCESS",
    "description": "The operation completed successfully."
  };

  group("ErrorDetailTest", () {
    test("JSONのMapから変換するテスト", () {
      final errorDetail = ErrorDetail.fromJson(typicalObjectJson);
      expect(errorDetail.code, 0);
      expect(errorDetail.alias, "ERROR_SUCCESS");
      expect(errorDetail.description, "The operation completed successfully.");
    });
  });
}
