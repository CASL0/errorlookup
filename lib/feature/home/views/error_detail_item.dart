import 'package:errorlookup/core/data/repository/error_codes_repository.dart';
import 'package:errorlookup/core/models/error_detail.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

/// エラーコード内容のカード
class ErrorDetailItem extends StatelessWidget {
  ErrorDetailItem(
      {super.key,
      required ErrorDetail errorDetail,
      required ErrorType errorType})
      : _errorDetail = errorDetail,
        _errorType = errorType;
  final ErrorDetail _errorDetail;
  final ErrorType _errorType;
  final Map<ErrorType, String> _errorTypeConverter = {
    ErrorType.windows: "GetLastError",
    ErrorType.linux: "errno",
    ErrorType.curl: "cURL"
  };

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      title: Text(_errorDetail.alias),
      subtitle: Text(_errorTypeConverter[_errorType] ?? ""),
      leading: const Icon(Icons.description),
      children: [
        SelectionArea(
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Text(_errorDetail.description,
                    style: Theme.of(context).textTheme.titleLarge)))
      ],
    );
  }
}
