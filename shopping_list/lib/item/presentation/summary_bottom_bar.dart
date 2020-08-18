import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_list/store/app_state.dart';
import 'package:redux/redux.dart';

class SummaryBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SummaryBottomBarViewModel>(
      converter: (store) => SummaryBottomBarViewModel.make(store),
      builder: (context, viewModel) => Container(
        color: Colors.grey[900],
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  viewModel.summary,
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SummaryBottomBarViewModel {
  String summary;
  SummaryBottomBarViewModel(this.summary);

  factory SummaryBottomBarViewModel.make(Store<AppState> store) {
    final selectedItem = store.state.items.where((item) => item.isDone).length;
    return SummaryBottomBarViewModel(
      "$selectedItem selected item(s)"
    );
  }
}