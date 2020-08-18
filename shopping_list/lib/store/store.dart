
import 'package:shopping_list/item/redux/reducers.dart';
import 'package:shopping_list/middleware/LoggingMiddleware.dart';
import 'package:shopping_list/store/app_state.dart';
import 'package:redux/redux.dart';

Store<AppState> createStore() {
  return Store<AppState>(appReducer, initialState: AppState(List()), middleware: [
    LoggingMiddleware()
  ]);
}