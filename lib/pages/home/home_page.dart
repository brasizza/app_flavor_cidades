import 'package:app_flavor_cidades/pages/home/cubit/home_cubit.dart';
import 'package:app_flavor_cidades/pages/home/widgets/list_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

import '../../flavors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _shorebirdCodePush = ShorebirdUpdater();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if ((await _shorebirdCodePush.checkForUpdate() == UpdateStatus.outdated)) {
        _showUpdateAvailableBanner();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: context.get(),
        builder: (context, state) {
          return switch (state) {
            HomeInitial() => const SizedBox(),
            HomeLoading() => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            HomeLoaded() => ListLocal(locais: state.locais ?? []),
            HomeError() => Center(
                child: Text(state.error),
              )
          };
        },
      ),
    );
  }

  void _showDownloadingBanner() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      const MaterialBanner(
        content: Text('Downloading...'),
        actions: [
          SizedBox(
            height: 14,
            width: 14,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        ],
      ),
    );
  }

  void _showUpdateAvailableBanner() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: const Text('Update available'),
        actions: [
          TextButton(
            onPressed: () async {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              await _downloadUpdate();
              if (!mounted) return;
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: const Text('Download'),
          ),
        ],
      ),
    );
  }

  void _showRestartBanner() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      const MaterialBanner(
        content: Text('A new patch is ready!'),
        actions: [
          TextButton(
            // Restart the app for the new patch to take effect.
            onPressed: Restart.restartApp,
            child: Text('Restart app'),
          ),
        ],
      ),
    );
  }

  void _showErrorBanner() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: const Text('An error occurred while downloading the update.'),
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: const Text('Dismiss'),
          ),
        ],
      ),
    );
  }

  // Note: this is only run if an update is reported as available.
  Future<void> _downloadUpdate() async {
    _showDownloadingBanner();

    await Future.wait([
      _shorebirdCodePush.update(),
      // Add an artificial delay so the banner has enough time to animate in.
      Future<void>.delayed(const Duration(milliseconds: 250)),
    ]);

    final isUpdateReadyToInstall = await _shorebirdCodePush.checkForUpdate();

    if (!mounted) return;

    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    if (isUpdateReadyToInstall == UpdateStatus.restartRequired) {
      _showRestartBanner();
    } else {
      _showErrorBanner();
    }
  }
}
