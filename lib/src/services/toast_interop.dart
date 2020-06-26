@JS()
library dart_global_toast;

import 'package:js/js.dart';

@anonymous
@JS()
class GlobalToastApi {
  external factory GlobalToastApi({Function showMessage});

  external showMessage(final String message);
}

@JS()
external set globalToastService(GlobalToastApi v);

@JS()
external GlobalToastApi get globalToastService;
