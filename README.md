# dart-global-toast

### Example

```dart
// Add provider to root component
providers: [
  globalToastProvider,
]

// Add toast provider to root component (node will be created automaticly)
final GlobalToastProvider _toastProvider;

// Use this from any place to show toast notification
globalToastService.showMessage(newTodo);

```
