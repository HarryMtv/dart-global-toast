import 'package:dart_global_toast/src/models/toast_action.dart';
import 'package:meta/meta.dart';

@immutable
class ToastMessage {
  final String text;
  final Duration duration;
  final ToastAction action;

  const ToastMessage(this.text, {this.duration, this.action});
}
