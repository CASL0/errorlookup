import "dart:convert";

import "package:errorlookup/core/models/error_details.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  const typicalObjectJson = <String, dynamic>{
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
      },
      {
        "code": 2,
        "alias": "ERROR_FILE_NOT_FOUND",
        "description": "The system cannot find the file specified."
      },
      {
        "code": 3,
        "alias": "ERROR_PATH_NOT_FOUND",
        "description": "The system cannot find the path specified."
      }
    ]
  };

  const typicalStringJson = '''
  {
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
      },
      {
        "code": 2,
        "alias": "ERROR_FILE_NOT_FOUND",
        "description": "The system cannot find the file specified."
      },
      {
        "code": 3,
        "alias": "ERROR_PATH_NOT_FOUND",
        "description": "The system cannot find the path specified."
      }
    ]
  }
  ''';

  group("ErrorDetailsTest", () {
    test("JSONのMapから変換するテスト", () {
      final errorDetails = ErrorDetails.fromJson(typicalObjectJson);
      expect(errorDetails.errors.length, 4);

      expect(errorDetails.errors[0].code, 0);
      expect(errorDetails.errors[0].alias, "ERROR_SUCCESS");
      expect(errorDetails.errors[0].description,
          "The operation completed successfully.");

      expect(errorDetails.errors[1].code, 1);
      expect(errorDetails.errors[1].alias, "ERROR_INVALID_FUNCTION");
      expect(errorDetails.errors[1].description, "Incorrect function.");

      expect(errorDetails.errors[2].code, 2);
      expect(errorDetails.errors[2].alias, "ERROR_FILE_NOT_FOUND");
      expect(errorDetails.errors[2].description,
          "The system cannot find the file specified.");

      expect(errorDetails.errors[3].code, 3);
      expect(errorDetails.errors[3].alias, "ERROR_PATH_NOT_FOUND");
      expect(errorDetails.errors[3].description,
          "The system cannot find the path specified.");
    });

    test("JSONの文字列から変換するテスト", () {
      final jsonMap = jsonDecode(typicalStringJson) as Map<String, dynamic>;
      final errorDetails = ErrorDetails.fromJson(jsonMap);

      expect(errorDetails.errors.length, 4);

      expect(errorDetails.errors[0].code, 0);
      expect(errorDetails.errors[0].alias, "ERROR_SUCCESS");
      expect(errorDetails.errors[0].description,
          "The operation completed successfully.");

      expect(errorDetails.errors[1].code, 1);
      expect(errorDetails.errors[1].alias, "ERROR_INVALID_FUNCTION");
      expect(errorDetails.errors[1].description, "Incorrect function.");

      expect(errorDetails.errors[2].code, 2);
      expect(errorDetails.errors[2].alias, "ERROR_FILE_NOT_FOUND");
      expect(errorDetails.errors[2].description,
          "The system cannot find the file specified.");

      expect(errorDetails.errors[3].code, 3);
      expect(errorDetails.errors[3].alias, "ERROR_PATH_NOT_FOUND");
      expect(errorDetails.errors[3].description,
          "The system cannot find the path specified.");
    });
  });
}
