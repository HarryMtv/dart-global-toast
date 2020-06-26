import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:dart_global_toast/global_toast_interop.dart';

@Component(
  selector: 'todo-list',
  styleUrls: ['todo_list_component.css'],
  templateUrl: 'todo_list_component.html',
  directives: [
    NgIf,
    NgFor,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
  ],
)
class TodoListComponent {

  String newTodo = '';

  void handleShowToast() {
    globalToastService.showMessage(newTodo);
  }
}
