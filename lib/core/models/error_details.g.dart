// GENERATED CODE - DO NOT MODIFY BY HAND

part of "error_details.dart";

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorDetails _$ErrorDetailsFromJson(Map<String, dynamic> json) => ErrorDetails(
      errors: (json["errors"] as List<dynamic>)
          .map((e) => ErrorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ErrorDetailsToJson(ErrorDetails instance) =>
    <String, dynamic>{
      "errors": instance.errors,
    };
