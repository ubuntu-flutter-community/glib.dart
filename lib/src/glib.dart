import 'gutils.dart';

export 'stub/glib_stub.dart' if (dart.library.ffi) 'ffi/glib_ffi.dart';

abstract class GLib with GUtilsMixin {}