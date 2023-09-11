import "package:errorlookup/core/data/repository/default_error_codes_repository.dart";
import "package:errorlookup/core/data/repository/default_settings_repository.dart";
import "package:errorlookup/core/data/repository/error_codes_repository.dart";
import "package:errorlookup/core/data/repository/settings_repository.dart";
import "package:errorlookup/core/data/source/error_codes_data_source.dart";
import "package:errorlookup/core/data/source/local/local_error_codes_data_source.dart";
import "package:errorlookup/core/data/source/local/local_settings_data_source.dart";
import "package:errorlookup/core/data/source/settings_data_source.dart";
import "package:get_it/get_it.dart";

final GetIt getIt = GetIt.I;

void setupDataModules() {
  GetIt.I.registerSingleton<ErrorCodesDataSource>(LocalErrorCodesDataSource());
  GetIt.I.registerSingleton<SettingsDataSource>(LocalSettingsDataSource());
  GetIt.I.registerSingleton<ErrorCodesRepository>(
      DefaultErrorCodesRepository(dataSource: GetIt.I<ErrorCodesDataSource>()));
  GetIt.I.registerSingleton<SettingsRepository>(
      DefaultSettingsRepository(dataSource: GetIt.I<SettingsDataSource>()));
}
