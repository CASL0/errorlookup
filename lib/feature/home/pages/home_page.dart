import 'package:collection/collection.dart';
import 'package:errorlookup/core/common/views/top_app_bar.dart';
import 'package:errorlookup/core/data/repository/error_codes_repository.dart';
import 'package:errorlookup/feature/home/viewmodels/home_view_model.dart';
import 'package:errorlookup/feature/home/views/error_detail_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(homeViewModelProvider);
    final viewModel = ref.watch(homeViewModelProvider.notifier);
    final windowsError = uiState.windowsErrorDetails
        .firstWhereOrNull((element) => element.code == uiState.errorCodeInput);
    final linuxError = uiState.linuxErrorDetails
        .firstWhereOrNull((element) => element.code == uiState.errorCodeInput);
    final curlError = uiState.curlErrorDetails
        .firstWhereOrNull((element) => element.code == uiState.errorCodeInput);
    return Scaffold(
        appBar: TopAppBar(
          currentRouteName: "home",
        ),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              TextField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                    icon: Icon(Icons.pin), hintText: "Error Code"),
                onChanged: viewModel.updateErrorCodeInput,
              ),
              if (windowsError != null)
                ErrorDetailItem(
                  errorDetail: windowsError,
                  errorType: ErrorType.windows,
                ),
              if (linuxError != null)
                ErrorDetailItem(
                  errorDetail: linuxError,
                  errorType: ErrorType.linux,
                ),
              if (curlError != null)
                ErrorDetailItem(
                  errorDetail: curlError,
                  errorType: ErrorType.curl,
                )
            ])));
  }
}
