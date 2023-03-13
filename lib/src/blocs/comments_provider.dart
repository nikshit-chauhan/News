import 'package:flutter/material.dart';
import 'comments_bloc.dart';
export 'comments_bloc.dart';

class CommentsProvider extends InheritedWidget {
  final CommentsBloc bloc;
  CommentsProvider ({key, required Widget child})
  : bloc = CommentsBloc(),
  super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  CommentsBloc of (BuildContext context){
    return (context.dependOnInheritedWidgetOfExactType<CommentsProvider>() as CommentsProvider).bloc;
  }
}