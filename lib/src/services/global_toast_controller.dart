// ignore_for_file: uri_has_not_been_generated

import 'dart:html';
import 'dart:js';

import 'package:angular/angular.dart';
import 'package:dart_global_toast/src/components/global_toast.dart';
import 'package:dart_global_toast/src/components/global_toast.template.dart' as ng;

import 'toast_interop.dart';

const globalToastProvider = [
  FactoryProvider<GlobalToastProvider>(GlobalToastProvider, createGlobalToastProvider),
];

GlobalToastProvider createGlobalToastProvider(@Optional() @SkipSelf() GlobalToastProvider globalToastController) =>
    globalToastController ?? GlobalToastProvider();

class GlobalToastProvider {

  GlobalToastComponent _toastComponent;

  GlobalToastProvider() {
    final _globalToastRef = runApp<Object>(ng.GlobalToastComponentNgFactory);
    _toastComponent = _globalToastRef.instance as GlobalToastComponent;

    document.body.append(_globalToastRef.location);

    globalToastService = GlobalToastApi(
        showMessage: allowInterop((message) { _toastComponent.showMessage(message); })
    );
  }

  void showMessage(final String message) =>
      _toastComponent.showMessage(message);

  void destroy() {
    _toastComponent.ngOnDestroy();
    _toastComponent = null;
  }
}
