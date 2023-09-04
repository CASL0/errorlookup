import 'package:errorlookup/core/data/di/data_modules.dart';
import 'package:errorlookup/core/data/repository/settings_repository.dart';
import 'package:errorlookup/core/models/main_state.dart';
import 'package:errorlookup/core/models/theme_data.dart' as theme_data;
import 'package:errorlookup/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

void main() {
  setupDataModules();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainState = ref.watch(_mainViewModelProvider);

    return MaterialApp.router(
        title: "errorlookup",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        darkTheme: ThemeData.dark(),
        themeMode: theme_data.convertTheme[mainState.theme]!,
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales);
  }
}

class _MainViewModel extends StateNotifier<MainState> {
  _MainViewModel({required final SettingsRepository repository})
      : _repository = repository,
        super(const MainState()) {
    _repository.getThemeSettingStream().listen((event) {
      state = state.copyWith(theme: event);
    });
  }

  final SettingsRepository _repository;
}

final _mainViewModelProvider = StateNotifierProvider<_MainViewModel, MainState>(
    (ref) => _MainViewModel(repository: GetIt.I<SettingsRepository>()));
