import "package:errorlookup/core/models/error_detail.dart";
import "package:json_annotation/json_annotation.dart";

part "error_details.g.dart";

@JsonSerializable()
class ErrorDetails {
  final List<ErrorDetail> errors;

  ErrorDetails({required this.errors});

  factory ErrorDetails.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDetailsToJson(this);
}
