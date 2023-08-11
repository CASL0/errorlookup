import 'package:errorlookup/core/models/error_detail.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

/// エラーコード内容のカード
class ErrorDetailItem extends StatelessWidget {
  const ErrorDetailItem({super.key, required ErrorDetail errorDetail})
      : _errorDetail = errorDetail;
  final ErrorDetail _errorDetail;

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      title: Text(_errorDetail.alias),
      leading: const Icon(Icons.description),
      children: [
        Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Text(
              _errorDetail.description,
              style: Theme.of(context).textTheme.titleLarge,
            )),
      ],
    );
  }
}
