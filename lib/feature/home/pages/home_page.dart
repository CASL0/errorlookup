import 'package:collection/collection.dart';
import 'package:errorlookup/core/models/error_detail.dart';
import 'package:errorlookup/feature/home/viewmodels/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(homeViewModelProvider);
    final viewModel = ref.watch(homeViewModelProvider.notifier);
    // TODO: エラーコードインプットの状態を追加
    final windowsError = uiState.windowsErrorDetails
        .firstWhereOrNull((element) => element.code == 0);
    final linuxError = uiState.linuxErrorDetails
        .firstWhereOrNull((element) => element.code == 0);
    final curlError = uiState.curlErrorDetails
        .firstWhereOrNull((element) => element.code == 0);
    return Scaffold(
        appBar: _TopAppBar(),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              TextField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                    icon: Icon(Icons.pin), hintText: "Error Code"),
                onChanged: (value) {
                  // TODO: implement
                },
              ),
              if (windowsError != null)
                _ErrorDetailItem(errorDetail: windowsError),
              if (linuxError != null)
                _ErrorDetailItem(
                  errorDetail: linuxError,
                ),
              if (curlError != null)
                _ErrorDetailItem(
                  errorDetail: curlError,
                )
            ])));
  }
}

class _TopAppBar extends AppBar {
  @override
  Widget? get title => const Text("errorlookup");
}

// 仮実装
class _ErrorDetailItem extends StatelessWidget {
  const _ErrorDetailItem({required ErrorDetail errorDetail})
      : _errorDetail = errorDetail;
  final ErrorDetail _errorDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child: Text(_errorDetail.alias));
  }
}
