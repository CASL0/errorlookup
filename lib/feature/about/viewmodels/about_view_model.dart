import 'package:errorlookup/feature/about/models/about_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutViewModel extends StateNotifier<AboutState> {
  AboutViewModel({bool initialFetch = true}) : super(const AboutState()) {
    if (initialFetch) {
      getPackageInfo();
    }
  }

  /// アプリパッケージ情報を取得します
  Future<void> getPackageInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    state = state.copyWith(
        version: packageInfo.version, buildNumber: packageInfo.buildNumber);
  }
}

final aboutViewModelProvider =
    StateNotifierProvider<AboutViewModel, AboutState>(
        (ref) => AboutViewModel(initialFetch: true));
