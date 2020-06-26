import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular/meta.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:dart_global_toast/src/models/toast_action.dart';
import 'package:dart_global_toast/src/models/toast_message.dart';

@Component(
  selector: 'global-toast',
  templateUrl: 'global_toast.html',
  styleUrls: ['global_toast.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
  directives: [
    NgIf,
    MaterialButtonComponent,
  ],
)
class GlobalToastComponent implements OnInit, OnDestroy {
  static const Duration _defaultDuration = Duration(seconds: 3);
  static final Duration _minimumSlideInDelay = Duration(milliseconds: 100);

  final ChangeDetectorRef _changeDetectorRef;
  final StreamController<ToastMessage> _messageQueue = StreamController<ToastMessage>();

  ToastMessage message;
  ToastMessage nextMessage;
  Timer _messageTimer;
  bool show;
  Timer _animationBlocker;
  StreamSubscription _subscription;

  GlobalToastComponent(this._changeDetectorRef);

  @override
  void ngOnInit() {
    _subscription = _messageQueue.stream.listen((ToastMessage newMessage) {
      if (message == null) {
        message = newMessage;
        _slideIn();
      } else {
        nextMessage = newMessage;
        _messageTimer?.cancel();
        _messageTimer = null;
        if (_animationBlocker == null) {
          _slideOut();
        }
      }
    });
  }

  void _slideIn() {
    show = true;
    _animationBlocker = Timer(_minimumSlideInDelay, () {
      _animationBlocker = null;
      if (nextMessage != null) {
        _slideOut();
      }
    });
    _changeDetectorRef.markForCheck();
  }

  void _slideOut() {
    show = false;
    _changeDetectorRef.markForCheck();
  }

  @visibleForTemplate
  void transitionEnd(_) {
    if (show) {
      _messageTimer = Timer(message.duration, () {
        _messageTimer = null;
        _slideOut();
      });
    } else {
      if (nextMessage == null) {
        message = null;
        _changeDetectorRef.markForCheck();
      } else {
        message = nextMessage;
        nextMessage = null;
        _slideIn();
      }
    }
  }

  void showMessage(String message, {Duration duration, ToastAction action}) =>
    _messageQueue.add(ToastMessage(message, duration: duration ?? _defaultDuration, action: action));

  @override
  void ngOnDestroy() => _subscription.cancel();
}
