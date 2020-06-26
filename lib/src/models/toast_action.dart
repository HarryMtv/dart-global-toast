import 'package:meta/meta.dart';

@immutable
class ToastAction {
  final String label;
  final Function callback;

  const ToastAction(this.label, this.callback);
}
