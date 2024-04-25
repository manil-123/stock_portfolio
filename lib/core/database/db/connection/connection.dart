// We use a conditional export to expose the right connection factory depending
// on the platform.
export 'native.dart'
    if (dart.library.js) 'web.dart'
    if (dart.library.ffi) 'native.dart';
