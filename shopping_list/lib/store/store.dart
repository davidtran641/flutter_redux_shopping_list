import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:shopping_list/item/redux/reducers.dart';
import 'package:shopping_list/middleware/LoggingMiddleware.dart';
import 'package:shopping_list/store/app_state.dart';

Store<AppState> createStore() {
  return DevToolsStore<AppState>(
    appReducer,
    initialState: AppState(List()),
    middleware: [LoggingMiddleware()],
  );
}
