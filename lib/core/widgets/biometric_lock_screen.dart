import 'package:flutter/material.dart';
import 'package:flutter_biometric_kit/flutter_biometric_kit.dart';
import 'package:provider/provider.dart';

import '../services/biometric_lock_provider.dart';

/// Membungkus seluruh widget tree dan menampilkan layar kunci
/// jika [BiometricLockProvider.isLocked] bernilai true.
///
/// Dipasang di [MaterialApp.builder] agar aktif di semua halaman.
class BiometricLockScreen extends StatefulWidget {
  final Widget child;

  const BiometricLockScreen({super.key, required this.child});

  @override
  State<BiometricLockScreen> createState() => _BiometricLockScreenState();
}

class _BiometricLockScreenState extends State<BiometricLockScreen>
    with WidgetsBindingObserver {
  DateTime? _backgroundedAt;

  // Kunci setelah app di background lebih dari 30 detik
  static const _lockTimeout = Duration(seconds: 30);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // Trigger unlock pertama kali app dibuka (setelah frame pertama render)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<BiometricLockProvider>();
      if (provider.isLocked) provider.unlock();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Guard: element mungkin belum active saat transisi lifecycle
    if (!mounted) return;

    switch (state) {
      case AppLifecycleState.paused:
        final provider = context.read<BiometricLockProvider>();
        if (!provider.isLocked) {
          _backgroundedAt = DateTime.now();
        }

      case AppLifecycleState.resumed:
        final bg = _backgroundedAt;
        if (bg != null && DateTime.now().difference(bg) >= _lockTimeout) {
          _backgroundedAt = null;
          // Defer ke frame berikutnya agar element sudah active
          // sebelum notifyListeners() dipanggil oleh lock()/unlock()
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            final provider = context.read<BiometricLockProvider>();
            provider.lock();
            provider.unlock();
          });
        }

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Biometric lock disabled for development
    return widget.child;
  }
}
