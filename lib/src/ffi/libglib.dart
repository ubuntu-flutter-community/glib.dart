import 'dart:ffi' as ffi;
import 'dart:io' as io;

import 'package:meta/meta.dart';

import 'libglib.g.dart';

LibGLib? _libglib;
LibGLib get libglib =>
    _libglib ??= LibGLib(ffi.DynamicLibrary.open(_env ?? _platform));

String? get _env => io.Platform.environment['LIBGLIB_PATH'];
String get _platform {
  if (io.Platform.isMacOS) return 'libglib-2.0.0.dylib';
  if (io.Platform.isWindows) return 'glib-2.0-0.dll';
  return 'libglib-2.0.so.0';
}

@visibleForTesting
void overrideLibGLibForTesting(LibGLib lib) => _libglib = lib;
