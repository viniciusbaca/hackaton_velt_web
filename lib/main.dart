import 'package:data_tables/data_tables.dart';
import 'package:flutter/material.dart';

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'Screens/homeScreen.dart';
// The existing imports
// !! Keep your existing impots here !!

/// main is entry point of Flutter application
void main() {
  // Desktop platforms aren't a valid platform.
  if (!kIsWeb) _setTargetPlatformForDesktop();
  return runApp(MaterialApp(home: HomeScreen()));
}
void _setTargetPlatformForDesktop() {
  TargetPlatform targetPlatform;
  if (Platform.isMacOS) {
    targetPlatform = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    targetPlatform = TargetPlatform.android;
  }
  if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}