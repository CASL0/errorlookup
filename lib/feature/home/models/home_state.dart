import 'package:errorlookup/core/models/error_detail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "home_state.freezed.dart";

/// Home画面のUI状態
@freezed
class HomeState with _$HomeState {
  const factory HomeState(
      {@Default([]) List<ErrorDetail> windowsErrorDetails,
      @Default([]) List<ErrorDetail> linuxErrorDetails,
      @Default([]) List<ErrorDetail> curlErrorDetails,
      @Default(false) bool isFetchingErrorCodes}) = _HomeState;
}
