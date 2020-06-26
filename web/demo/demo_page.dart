import 'package:angular/angular.dart';
import 'package:dart_global_toast/global_toast_controller.dart';

import 'todo_list/todo_list_component.dart';

@Component(
  selector: 'demo-page',
  templateUrl: 'demo_page.html',
  styleUrls: ['demo_page.css'],
  directives: [TodoListComponent],
  providers: [
    globalToastProvider,
  ]
)
class DemoPageComponent {

  final GlobalToastProvider _toastController;

  DemoPageComponent(this._toastController);
}
