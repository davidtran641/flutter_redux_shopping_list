
import 'package:shopping_list/store/app_state.dart';
import 'package:redux/redux.dart';

class LoggingMiddleware extends MiddlewareClass<AppState> {
  @override
  call(Store<AppState> store, action, next) {
    next(action);

    print('Action: $action');
    print('State: ${store.state}');
  }

}